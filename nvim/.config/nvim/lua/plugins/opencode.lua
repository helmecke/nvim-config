return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    -- Recommended for `ask()` and `select()`.
    -- Required for `snacks` provider.
    ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
    { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
  },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
    }

    -- Required for `opts.events.reload`.
    vim.o.autoread = true
  end,
  keys = {
    { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
    {
      "<leader>aa",
      function()
        require("opencode").ask("", { submit = true })
      end,
      desc = "Ask opencode",
      mode = "n",
    },
    {
      "<leader>aa",
      function()
        require("opencode").ask("@selection: ", { submit = true })
      end,
      desc = "Ask opencode about selection",
      mode = "v",
    },
    {
      "<leader>as",
      function()
        require("opencode").select()
      end,
      desc = "Select",
      mode = "n",
    },
    {
      "<leader>an",
      function()
        require("opencode").command("session.new")
      end,
      desc = "New session",
    },
    {
      "ga",
      function()
        require("opencode").prompt("@this")
      end,
      desc = "Send to opencode",
      mode = { "n", "x" },
    },
  },
}
