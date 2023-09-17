return {
  {
    "tpope/vim-fugitive",
    dependencies = {
      "tpope/vim-rhubarb",
    },
    event = "VeryLazy",
    keys = {
      { "<leader>gy", "<cmd>GBrowse!<cr>", desc = "yank link", mode = { "n", "v" } },
    },
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>g"] = { name = "+git" },
      },
    },
  },
}
