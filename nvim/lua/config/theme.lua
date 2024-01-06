vim.cmd.colorscheme("gruvbox")

vim.wo.signcolumn = "yes"
vim.wo.listchars = ""

vim.api.nvim_set_hl(0, "SignColumn", { fg = nil, bg = nil })
