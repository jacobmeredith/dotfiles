return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {},
  init = function()
    local harpoon = require 'harpoon'

    harpoon:setup()

    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():add()
    end, { desc = 'Add to harpoon' })

    vim.keymap.set('n', '<leader>hl', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'List harpoon entries' })

    vim.keymap.set('n', '<C-h>', function()
      harpoon:list():select(1)
    end)

    vim.keymap.set('n', '<C-j>', function()
      harpoon:list():select(2)
    end)

    vim.keymap.set('n', '<C-k>', function()
      harpoon:list():select(3)
    end)

    vim.keymap.set('n', '<C-l>', function()
      harpoon:list():select(4)
    end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<leader>hp', function()
      harpoon:list():prev()
    end)

    vim.keymap.set('n', '<leader>hn', function()
      harpoon:list():next()
    end)
  end,
}
