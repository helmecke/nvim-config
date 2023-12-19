return {
  {
    "olimorris/onedarkpro.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd("colorscheme onedark")
    end,
  },
  {
    "folke/lazy.nvim",
    opts = {
      install = {
        colorscheme = { "onedark", "habamax" },
      },
    },
  },
}
