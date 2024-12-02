return {
  "folke/todo-comments.nvim",
  opts = {
    search = {
      command = "rg",
      args = {
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--hidden",
      },
    },
    highlight = {
      before = "",
      keyword = "fg",
      after = "",
    },
    keywords = {
      TODO = { color = "default" },
      PERF = { color = "info" },
    },
    signs = false,
    colors = {
      error = { "DiagnosticError" },
      warning = { "DiagnosticWarn" },
      info = { "DiagnosticInfo" },
      hint = { "DiagnosticHint" },
      default = { "Todo" },
    },
  },
}
