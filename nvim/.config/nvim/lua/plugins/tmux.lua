return {
  "aserowy/tmux.nvim",
  opts = {
    copy_sync = {
      enable = false,
    },
    navigation = {
      cycle_navigation = false,
      enable_default_keybindings = false,
    },
    resize = {
      enable_default_keybindings = false,
    },
  },
  keys = {
    {
      "<C-h>",
      function()
        require("tmux").move_left()
      end,
      desc = "Go to left window",
    },
    {
      "<C-j>",
      function()
        require("tmux").move_bottom()
      end,
      desc = "Go to lower window",
    },
    {
      "<C-k>",
      function()
        require("tmux").move_top()
      end,
      desc = "Go to upper window",
    },
    {
      "<C-l>",
      function()
        require("tmux").move_right()
      end,
      desc = "Go to right window",
    },
    {
      "<C-S-h>",
      function()
        require("tmux").resize_left()
      end,
      desc = "Go to left window",
    },
    {
      "<C-S-j>",
      function()
        require("tmux").resize_bottom()
      end,
      desc = "Go to lower window",
    },
    {
      "<C-S-k>",
      function()
        require("tmux").resize_top()
      end,
      desc = "Go to upper window",
    },
    {
      "<C-S-l>",
      function()
        require("tmux").resize_right()
      end,
      desc = "Go to right window",
    },
  },
}
