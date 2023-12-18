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
      { "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "Pick buffer" },
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
