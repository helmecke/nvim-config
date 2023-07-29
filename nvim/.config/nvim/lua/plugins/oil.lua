return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    buf_options = { buflisted = true, bufhidden = "delete" },
    win_options = {
      -- https://github.com/stevearc/oil.nvim/issues/57
      concealcursor = "nvc",
    },
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, _)
        local pattern = { ".git" }
        return vim.tbl_contains(pattern, name) and true or false
      end,
    },
    use_default_keymaps = false,
    keymaps = {
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["<C-v>"] = "actions.select_vsplit",
      ["<C-x>"] = "actions.select_split",
      ["<C-t>"] = "actions.select_tab",
      ["<C-p>"] = "actions.preview",
      ["<C-c>"] = "actions.close",
      ["<C-l>"] = "actions.refresh",
      ["-"] = "actions.parent",
      ["_"] = "actions.open_cwd",
      ["`"] = "actions.cd",
      ["~"] = "actions.tcd",
      ["g."] = "actions.toggle_hidden",
    },
  },
  keys = {
    {
      "-",
      function()
        require("oil").open()
      end,
      desc = "Open parent directory",
    },
  },
}
