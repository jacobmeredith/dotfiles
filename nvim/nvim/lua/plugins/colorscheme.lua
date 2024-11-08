return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				transparent_background = true,
				terminal_colors = true,
				custom_highlights = function(colors)
					return {
						CursorLineNR = { fg = colors.subtext0, bg = "none" }, -- Current line number color
						LineNr = { fg = colors.overlay2, bg = "none" }, -- Line number color
					}
				end,
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
