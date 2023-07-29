return {
  {
    "nvim-telescope/telescope.nvim",
    version = false,
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
    },
    cmd = {
      "Telescope",
    },
    opts = {
      defaults = {
        winblend = 10,
      },
      mappings = {
        i = {
          ["<C-h>"] = "which_key",
        },
      },
      extensions = {
        fzy_native = {
          override_generic_sorter = true,
          override_file_sorter = true,
        },
      },
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
    keys = {
      { "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "Switch buffer" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      {
        "<leader>fF",
        function()
          require("telescope.builtin").find_files({ hidden = true })
        end,
        desc = "Find files (hidden)",
      },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
      { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "branch" },
      { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "commit" },
      { "<leader>gC", "<cmd>Telescope git_bcommits<cr>", desc = "buffer commit" },
      { "<leader>gf", "<cmd>Telescope git_files<cr>", desc = "file" },
      { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "status" },
      { "<leader>gS", "<cmd>Telescope git_stash<cr>", desc = "Stash" },
      { "<leader>sj", "<cmd>Telescope jumplist<cr>", desc = "Search jumplist" },
      { "<leader>sm", "<cmd>Telescope man_pages<cr>", desc = "Search man page" },
      { "<leader>sq", "<cmd>Telescope quickfix<cr>", desc = "Search quickfix" },
      { "<leader>ss", "<cmd>Telescope live_grep<cr>", desc = "Search string" },
      {
        "<leader>sS",
        function()
          -- Clone the default Telescope configuration
          local vimgrep_arguments = { unpack(require("telescope.config").values.vimgrep_arguments) }

          -- I want to search in hidden/dot files.
          table.insert(vimgrep_arguments, "--hidden")
          -- I don't want to search in the `.git` directory.
          table.insert(vimgrep_arguments, "--glob")
          table.insert(vimgrep_arguments, "!**/.git/*")

          require("telescope.builtin").live_grep({ vimgrep_arguments = vimgrep_arguments })
        end,
        desc = "Search string(hidden)",
      },
    },
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>b"] = { name = "+buffer" },
        ["<leader>f"] = { name = "+file" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>s"] = { name = "+search" },
      },
    },
  },
}
