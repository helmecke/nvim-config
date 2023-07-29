return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    buftype_exclude = { "terminal" },
    filetype_exclude = {
      "help",
      "alpha",
      "dashboard",
      "neo-tree",
      "Trouble",
      "lazy",
      "mason",
      "notify",
      "toggleterm",
      "lazyterm",
      "oil_preview",
    },
    show_current_context = true,
    show_first_indent_level = false,
  },
}
