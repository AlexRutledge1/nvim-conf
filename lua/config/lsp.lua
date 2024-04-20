local lspconfig = require("lspconfig")

lspconfig.ruff_lsp.setup = {
  settings = {
    args = {
      max_line_length = 160,
    },
  },
}
