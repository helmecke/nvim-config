return {
  {
    "olimorris/codecompanion.nvim",
    enabled = false,
    version = "v17.33.0",
    cmd = { "CodeCompanion", "CodeCompanionActions", "CodeCompanionChat", "CodeCompanionCmd" },
    opts = {
      strategies = {
        chat = {
          roles = {
            llm = "  CodeCompanion",
            user = "  Me",
          },
          adapter = "opencode",
        },
      },
      adapters = {
        acp = {
          opts = { show_defaults = false },
          opencode = function()
            return require("codecompanion.adapters.acp.opencode")
          end,
        },
      },
    },
    keys = {
      { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
      { "<leader>ap", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "Prompt Actions" },
      { "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "Toggle Chat" },
      { "ga", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "Add Code to CodeCompanion" },
      { "<leader>ai", "<cmd>CodeCompanion<cr>", mode = { "n", "v" }, desc = "Inline prompt (CodeCompanion)" },
    },
  },
}
