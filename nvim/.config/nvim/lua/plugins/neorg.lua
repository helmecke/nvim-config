return {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope" },
    event = { "VeryLazy" },
    keys = {
      { "<leader>nn", "<Cmd>Neorg keybind norg core.dirman.new.note<CR>", desc = "New note" },
      { "<leader>njj", "<Cmd>Neorg journal today<CR>", desc = "Journal today" },
      { "<leader>njt", "<Cmd>Neorg journal tomorrow<CR>", desc = "Journal tomorrow" },
      { "<leader>njy", "<Cmd>Neorg journal yesterday<CR>", desc = "Journal yesterday" },
      { "<leader>nf", "<Cmd>Neorg keybind all core.integrations.telescope.find_norg_files<CR>", desc = "Find note" },
    },
    opts = {
      load = {
        ["core.defaults"] = {
          config = {
            -- disable = {
            --   "core.esupports.indent",
            -- },
          },
        },
        ["core.esupports.metagen"] = { config = { type = "empty", update_date = true } },
        ["core.concealer"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/Documents/notes",
            },
            default_workspace = "notes",
          },
        },
        ["core.journal"] = {
          config = {
            strategy = "flat",
            workspaces = "notes",
          },
        },
        ["core.keybinds"] = {
          config = {
            hook = function(keybinds)
              local leader = keybinds.leader

              keybinds.unmap("norg", "n", "<CR>")
              keybinds.unmap("norg", "n", "<M-j>")
              keybinds.unmap("norg", "n", "<M-k>")

              keybinds.map_to_mode("all", {
                n = {
                  { leader .. "r", "<cmd>Neorg return<cr>", opts = { desc = "Return" } },
                  { leader .. "im", "<cmd>Neorg inject-metadata<cr>", opts = { desc = "Insert metadata" } },
                },
              }, {
                silent = true,
                noremap = true,
              })

              keybinds.map_event_to_mode("norg", {
                n = {
                  { leader .. "fl", "core.integrations.telescope.find_linkable", opts = { desc = "Find linkable" } },
                  { leader .. "il", "core.integrations.telescope.insert_link", opts = { desc = "Insert link" } },
                  { "]l", "core.integrations.treesitter.next.link", opts = { desc = "Next link" } },
                  { "[l", "core.integrations.treesitter.previous.link", opts = { desc = "Previous link" } },
                  { leader .. "ce", "core.looking-glass.magnify-code-block", opts = { desc = "Edit code" } },
                },
                i = {
                  { "<C-l>", "core.integrations.telescope.insert_link", opts = { desc = "Insert link" } },
                },
              }, {
                silent = true,
                noremap = true,
              })
            end,
          },
        },
        ["core.integrations.telescope"] = {},
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        },
        ["core.export"] = {},
      },
    },
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
