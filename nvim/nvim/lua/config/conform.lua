require("conform").setup({
  format_on_save = {
    lsp_fallback = true,
  },
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettier", "eslint_d" },
    javascriptreact = { "prettier", "eslint_d" },
    typescript = { "prettier", "eslint_d" },
    typescriptreact = { "prettier", "eslint_d" },
    css = { "prettier" },
    html = { "prettier" },
    -- go = { "gopls" },
  }
})
