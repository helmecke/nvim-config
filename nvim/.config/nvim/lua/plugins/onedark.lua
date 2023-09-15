return {
  {
    -- "helmecke/onedark.nvim",
    dir = "~/Git/github.com/helmecke/onedark.nvim",
    branch = "develop",
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd("colorscheme onedark")
    end,
    opts = {
      caching = false,
    },
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
