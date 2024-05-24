return {
  "neovim/nvim-lspconfig",
  init = function()
    require("lspconfig.ui.windows").default_options.border = "rounded"
    vim.diagnostic.config({
      float = { border = "rounded" },
    })
    local float = { focusable = true, style = "minimal", border = "rounded" }
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, float)
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, float)
  end,
  opts = {
    diagnostics = {
      virtual_text = false,
    },
    document_highlight = {
      enabled = false,
    },
  },
}
