return {
  "rest-nvim/rest.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  ft = "http",
  opts = {},
  keys = {
    { "<C-cr>", "<Plug>RestNvim", desc = "Run request under cursor" },
    { "<C-S-cr>", "<Plug>RestNvimPreview", desc = "Run request under cursor" },
  },
}
