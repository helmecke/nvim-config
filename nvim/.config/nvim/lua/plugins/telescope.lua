return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "branch" },
    { "<leader>gC", "<cmd>Telescope git_bcommits<cr>", desc = "buffer commit" },
    { "<leader>gf", "<cmd>Telescope git_files<cr>", desc = "file" },
    { "<leader>gS", "<cmd>Telescope git_stash<cr>", desc = "Stash" },
  },
  opts = {
    pickers = {
      buffers = {
        sort_lastused = true,
        ignore_current_buffer = true,
        mappings = {
          i = { ["<c-d>"] = "delete_buffer" },
          n = { ["<c-d>"] = "delete_buffer" },
        },
      },
    },
  },
}
