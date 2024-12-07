return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup { n_lines = 500 }
    require('mini.surround').setup()
    require('mini.pairs').setup()
    require('mini.files').setup()
  end,
  keys = {
    {
      '<leader>ft',
      function()
        MiniFiles.open()
      end,
    },
  },
}
