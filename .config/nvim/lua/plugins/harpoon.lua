return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {},
  keys = {
    {
      '<leader>ha',
      function()
        require('harpoon'):list():add()
      end,
      desc = 'Add to harpoon',
    },
    {
      '<leader>hl',
      function()
        local harpoon = require 'harpoon'
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = 'List harpoon entries',
    },
    {
      '<C-h>',
      function()
        require('harpoon'):list():select(1)
      end,
    },
    {
      '<C-j>',
      function()
        require('harpoon'):list():select(2)
      end,
    },
    {
      '<C-k>',
      function()
        require('harpoon'):list():select(3)
      end,
    },
    {
      '<C-l>',
      function()
        require('harpoon'):list():select(4)
      end,
    },
    {
      '<C-P>',
      function()
        require('harpoon'):list():prev()
      end,
    },
    {
      '<C-N>',
      function()
        require('harpoon'):list():next()
      end,
    },
  },
}
