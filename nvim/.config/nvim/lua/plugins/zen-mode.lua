return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  keys = {
    { "<leader>tz", "<cmd>ZenMode<cr>", desc = "Zen mode" },
  },
  opts = {
    window = {
      backdrop = 1,
      height = 0.95,
      options = {
        signcolumn = "no",
        number = false,
        relativenumber = false,
        foldcolumn = "0",
      },
    },
    plugins = {
      tmux = { enabled = true },
    },
  },
}
