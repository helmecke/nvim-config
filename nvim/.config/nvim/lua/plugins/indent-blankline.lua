return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile", "StdinReadPost" },
  init = function()
    for _, keymap in pairs({
      "zo",
      "zO",
      "zc",
      "zC",
      "za",
      "zA",
      "zv",
      "zx",
      "zX",
      "zm",
      "zM",
      "zr",
      "zR",
    }) do
      vim.api.nvim_set_keymap(
        "n",
        keymap,
        keymap .. "<CMD>IndentBlanklineRefresh<CR>",
        { noremap = true, silent = true }
      )
    end
  end,
  opts = {
    show_trailing_blankline_indent = false,
    show_current_context = false,
    show_foldtext = false,
    char_priority = 11,

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
      "fugitive",
    },
  },
}
