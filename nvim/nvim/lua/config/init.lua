-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

require("config.theme")
require("config.telescope")
require("config.treesitter")
require("config.which-key")
require("config.lsp")
require("config.cmp")
require("config.git")

vim.o.hlsearch = false

vim.o.scrolloff = 9999
vim.wo.number = true
vim.wo.relativenumber = true

vim.o.clipboard = "unnamedplus"

vim.o.breakindent = true

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.completeopt = true

vim.o.termguicolors = true

vim.opt.fillchars = { eob = " " }

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
