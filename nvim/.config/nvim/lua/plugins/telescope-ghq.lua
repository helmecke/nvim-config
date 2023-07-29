return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>g"] = { name = "+git" },
      },
    },
  },
  {
    "telescope.nvim",
    dependencies = {
      "helmecke/telescope-ghq.nvim",
      branch = "refactor",
      config = function()
        require("telescope").load_extension("ghq")
      end,
    },
    keys = {
      { "<M-g>", "<cmd>Telescope ghq list<cr>", desc = "repositories" },
      { "<leader>gr", "<cmd>Telescope ghq list<cr>", desc = "repositories" },
    },
  },
}
