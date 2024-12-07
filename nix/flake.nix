{
  description = "Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      nix-homebrew,
      home-manager,
    }:
    let
      configuration =
        { pkgs, config, ... }:
        {
          nixpkgs.config.allowUnfree = true;

          # List packages installed in system profile. To search by name, run:
          # $ nix-env -qaP | grep wget
          environment.systemPackages = [
            pkgs.aerospace
            pkgs.alacritty
            pkgs.bat
            pkgs.btop
            pkgs.discord
            pkgs.eza
            pkgs.fastfetch
            pkgs.fzf
            pkgs.go
            pkgs.google-chrome
            pkgs.jankyborders
            pkgs.lazygit
            pkgs.lua5_4_compat
            pkgs.mas
            pkgs.mkalias
            pkgs.neovim
            pkgs.ripgrep
            pkgs.rustup
            pkgs.sketchybar
            pkgs.starship
            pkgs.stow
            pkgs.tmux
            pkgs.tree
            pkgs.zsh-autosuggestions
          ];

          homebrew = {
            enable = true;
            brews = [
              "nvm"
            ];
            casks = [
              "font-sf-mono"
              "font-sf-pro"
              "notchnook"
              "proxyman"
              "sf-symbols"
            ];
            masApps = {};
            onActivation.cleanup = "zap";
          };

          fonts.packages = [
            (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "NerdFontsSymbolsOnly" ]; })
            pkgs.sketchybar-app-font
          ];

          system.activationScripts.applications.text =
            let
              env = pkgs.buildEnv {
                name = "system-applications";
                paths = config.environment.systemPackages;
                pathsToLink = "/Applications";
              };
            in
            pkgs.lib.mkForce ''
              # Set up applications.
              echo "setting up /Applications..." >&2
              rm -rf /Applications/Nix\ Apps
              mkdir -p /Applications/Nix\ Apps
              find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
              while read -r src; do
                app_name=$(basename "$src")
                echo "copying $src" >&2
                ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
              done
            '';

          programs.zsh = {
            enable = true;
            enableCompletion = true;
            enableSyntaxHighlighting = true;
            promptInit = "source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh";
          };

          launchd.user.agents.aerospace = {
            command = "${pkgs.aerospace}/Applications/AeroSpace.app/Contents/MacOS/AeroSpace";
            serviceConfig = {
              UserName = "jakemeredith";
              KeepAlive = true;
              RunAtLoad = true;
            };
          };

          system.startup.chime = false;

          system.defaults = {
            dock = {
              autohide = true;
              persistent-apps = [
                "${pkgs.alacritty}/Applications/Alacritty.app"
                "${pkgs.google-chrome}/Applications/Google Chrome.app"
                "${pkgs.discord}/Applications/Discord.app"
                "/Applications/Proxyman.app"
              ];
              persistent-others = [];
              show-recents = false;
              orientation = "left";
              launchanim = false;
            };
            NSGlobalDomain._HIHideMenuBar = true;
            finder = {
              AppleShowAllFiles = true;
              CreateDesktop = false;
              FXPreferredViewStyle = "Nlsv";
              ShowPathbar = true;
            };
          };

          security.pam.enableSudoTouchIdAuth = true;

          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";

          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;

          # Used for backwards compatibility, please read the changelog before changing.
          # $ darwin-rebuild changelog
          system.stateVersion = 5;

          # The platform the configuration will be used on.
          nixpkgs.hostPlatform = "aarch64-darwin";
        };
    in
    {
      programs.starship = {
        enable = true;
      };

      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#jake
      darwinConfigurations."jake" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          {
            users.users.jakemeredith.home = "/Users/jakemeredith";
          }
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "jakemeredith";
            };
          }
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jakemeredith = import ./home.nix;
          }
        ];
      };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."jake".pkgs;
    };
}
