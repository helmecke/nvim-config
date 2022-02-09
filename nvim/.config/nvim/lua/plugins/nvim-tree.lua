vim.g.nvim_tree_show_icons = { git = 0, folders = 1, files = 1, folder_arrows = 1 }
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_special_files = {}
vim.g.nvim_tree_root_folder_modifier = ':p:~'
vim.g.nvim_tree_highlight_opened_files = 0
vim.g.nvim_tree_icons = {
  default = '',
  symlink = '',
}
vim.g.nvim_tree_disable_window_picker = 1
vim.g.nvim_tree_quit_on_open = 1

local tree_cb = require('nvim-tree.config').nvim_tree_callback

require('nvim-tree').setup {
  disable_netrw = false,
  update_cwd = true,
  view = {
    mappings = {
      list = {
        { key = 'gq', cb = tree_cb 'close' },
      },
    },
  },
}

require('which-key').register {
  ['<leader>'] = {
    t = {
      name = '+toggle',
      t = { '<cmd>NvimTreeToggle<cr>', 'file tree' },
    },
    f = {
      name = '+file',
      l = { '<cmd>NvimTreeFindFile<cr>', 'locate' },
    },
  },
}
