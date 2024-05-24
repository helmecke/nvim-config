return {
  "lukas-reineke/indent-blankline.nvim",
  version = false,
  main = "ibl",
  event = { "BufReadPost", "BufNewFile", "StdinReadPost" },
  opts = {
    exclude = {
      filetypes = {
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
        "fugitive",
        "norg",
      },
    },
    scope = {
      show_start = false,
      show_end = false,
      char = "┊",
    },
  },
}
