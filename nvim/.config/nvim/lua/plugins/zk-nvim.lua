return {
  {
    "mickael-menu/zk-nvim",
    event = { "BufReadPre " .. vim.fn.expand("~") .. "/Documents/notes/**.md" },
    keys = {
      { "<leader>nn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", desc = "New note" },
      { "<leader>njj", "<Cmd>ZkNew { group = 'journal', dir = 'journal' }<CR>", desc = "Journal today" },
      {
        "<leader>njt",
        "<Cmd>ZkNew { group = 'journal', dir = 'journal', date = 'tomorrow' }<CR>",
        desc = "Journal tomorrow",
      },
      {
        "<leader>njy",
        "<Cmd>ZkNew { group = 'journal', dir = 'journal', date = 'yesterday' }<CR>",
        desc = "Journal yesterday",
      },
      { "<leader>nf", "<Cmd>ZkNotes<CR>", desc = "Find note" },
      { "<leader>nr", "<Cmd>ZkNotes { sort = { 'modified' }}<CR>", desc = "Recent notes" },
      { "<leader>nt", "<Cmd>ZkTags<CR>", desc = "Find tag" },
      { "<leader>nl", "<Cmd>ZkLinks<CR>", desc = "Find link" },
      { "<leader>nb", "<Cmd>ZkBacklinks<CR>", desc = "Find backlink" },
      { "<leader>no", "<Cmd>ZkNotes { orphan = true }<CR>", desc = "Find orphan" },
    },
    opts = {
      picker = "telescope",
    },
    config = function(_, opts)
      require("zk").setup(opts)
    end,
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>n"] = { name = "+note" },
        ["<leader>nj"] = { name = "+journal" },
      },
    },
  },
}
