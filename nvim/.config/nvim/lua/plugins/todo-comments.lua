return {
  {
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
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
    -- stylua: ignore
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo-comment" },
    },
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>s"] = { name = "+search" },
      },
    },
  },
}
