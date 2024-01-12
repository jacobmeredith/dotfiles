local custom_catppuccin = require "lualine.themes.catppuccin"

custom_catppuccin.normal.c.bg = "#262626"

require("lualine").setup {
  options = {
    theme = custom_catppuccin,
  },
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1,
      }
    }
  }
}
