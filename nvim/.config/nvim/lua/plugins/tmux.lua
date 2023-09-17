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
      "<M-h>",
      function()
        require("tmux").move_left()
      end,
      desc = "Go to left window",
    },
    {
      "<M-j>",
      function()
        require("tmux").move_bottom()
      end,
      desc = "Go to lower window",
    },
    {
      "<M-k>",
      function()
        require("tmux").move_top()
      end,
      desc = "Go to upper window",
    },
    {
      "<M-l>",
      function()
        require("tmux").move_right()
      end,
      desc = "Go to right window",
    },
    {
      "<M-S-h>",
      function()
        require("tmux").resize_left()
      end,
      desc = "Go to left window",
    },
    {
      "<M-S-j>",
      function()
        require("tmux").resize_bottom()
      end,
      desc = "Go to lower window",
    },
    {
      "<M-S-k>",
      function()
        require("tmux").resize_top()
      end,
      desc = "Go to upper window",
    },
    {
      "<M-S-l>",
      function()
        require("tmux").resize_right()
      end,
      desc = "Go to right window",
    },
  },
}
