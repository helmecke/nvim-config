return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  keys = {
    { "<leader>gdf", "<cmd>DiffviewFileHistory<cr>", desc = "File history" },
    { "<leader>gdd", "<cmd>DiffviewOpen<cr>", desc = "Open diff view" },
    { "<leader>gdc", "<cmd>DiffviewClose<cr>", desc = "Close diff view" },
  },
  opts = {
    file_panel = {
      listing_style = "list",
    },
  },
}
