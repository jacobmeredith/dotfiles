require("conform").setup({
  lsp_fallback = true,
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettier", "eslint_d" },
    typescript = { "prettier", "eslint_d" },
    css = { "prettier" },
    html = { "prettier" },
    go = { "gopls" },
  }
})
