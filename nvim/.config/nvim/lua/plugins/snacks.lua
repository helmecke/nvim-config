return {
  "folke/snacks.nvim",
  opts = {
    ---@class snacks.statuscolumn.Config
    ---@field enabled? boolean
    statuscolumn = {
      left = { "mark", "sign", "git" },
      right = { "fold" },
      folds = {
        open = true,
      },
    },
  },
}
