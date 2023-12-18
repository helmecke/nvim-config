return {
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    opts = {
      options = {
        indicator = {
          icon = "▍",
        },
        offsets = { { filetype = "NvimTree", text = "File Explorer", highlight = "Directory", text_align = "left" } },
        always_show_bufferline = false,
        show_close_icon = false,
        show_buffer_close_icons = false,
        diagnostics = "nvim_lsp",
        right_mouse_command = "",
        middle_mouse_command = "bdelete! %d",
      },
    },
    keys = {
      { "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "pick" },
      { "<leader>b1", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "goto 1" },
      { "<leader>b2", "<cmd>BufferLineGoToBuffer 2<cr>", desc = "goto 2" },
      { "<leader>b3", "<cmd>BufferLineGoToBuffer 3<cr>", desc = "goto 3" },
      { "<leader>b4", "<cmd>BufferLineGoToBuffer 4<cr>", desc = "goto 4" },
      { "<leader>b5", "<cmd>BufferLineGoToBuffer 5<cr>", desc = "goto 5" },
      { "<leader>b6", "<cmd>BufferLineGoToBuffer 6<cr>", desc = "goto 6" },
      { "<leader>b7", "<cmd>BufferLineGoToBuffer 7<cr>", desc = "goto 7" },
      { "<leader>b8", "<cmd>BufferLineGoToBuffer 8<cr>", desc = "goto 8" },
      { "<leader>b9", "<cmd>BufferLineGoToBuffer 9<cr>", desc = "goto 9" },
      { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
      { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
    },
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>b"] = { name = "+buffer" },
      },
    },
  },
}
