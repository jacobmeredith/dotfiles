vim.o.termguicolors = true

vim.cmd.colorscheme("catppuccin")

vim.wo.signcolumn = "yes"
vim.wo.listchars = ""

vim.api.nvim_set_hl(0, "SignColumn", { fg = nil, bg = nil })
