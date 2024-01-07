local signs = { "GitSignsAdd", "GitSignsChange", "GitSignsDelete", "GitSignsChange", "GitSignsUntracked" }

require("gitsigns").setup {
  on_attach = function ()
    for _, sign in ipairs(signs) do
      vim.api.nvim_set_hl(0, sign, { bg = nil, fg = nil })
    end
  end
}
