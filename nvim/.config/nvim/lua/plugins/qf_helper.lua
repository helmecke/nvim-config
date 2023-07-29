return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>t"] = { name = "+toggle" },
      },
    },
  },
  {
    "stevearc/qf_helper.nvim",
    opts = {
      default_bindings = false,
      quickfix = {
        min_height = 10,
      },
      loclist = {
        min_height = 10,
      },
    },
    keys = {
      { "<leader>tl", "<cmd>LLToggle!<cr>", desc = "loclist" },
      { "<leader>tq", "<cmd>QFToggle!<cr>", desc = "quickfix" },
      { "[q", "<cmd>QFPrev<cr>", desc = "Previous quickfix item" },
      { "]q", "<cmd>QFNext<cr>", desc = "Next quickfix item" },
      { "[l", "<cmd>LLPrev<cr>", desc = "Previous loclist item" },
      { "]l", "<cmd>LLNext<cr>", desc = "Next loclist item" },
    },
  },
}
