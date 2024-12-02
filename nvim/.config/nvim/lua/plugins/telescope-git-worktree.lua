return {
  {
    "telescope.nvim",
    dependencies = {
      "helmecke/telescope-git-worktree.nvim",
      config = function()
        require("telescope").load_extension("git_worktree")
      end,
    },
    keys = {
      { "<leader>gw", "<cmd>Telescope git_worktree git_worktrees<cr>", desc = "worktrees" },
    },
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>g", group = "git" },
      },
    },
  },
}
