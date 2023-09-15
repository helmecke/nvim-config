return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile", "StdinReadPre" },
  dependencies = { "mason.nvim" },
  opts = function()
    local null_ls = require("null-ls")
    return {
      root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.markdownlint,
      },
    }
  end,
}
