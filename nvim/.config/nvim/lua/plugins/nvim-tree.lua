vim.g.nvim_tree_show_icons = { git = 0, folders = 1, files = 1, folder_arrows = 1 }
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_special_files = {}
vim.g.nvim_tree_root_folder_modifier = ':p:~'
vim.g.nvim_tree_highlight_opened_files = 0
vim.g.nvim_tree_icons = {
  default = '',
  symlink = '',
}

local tree_cb = require('nvim-tree.config').nvim_tree_callback

require('nvim-tree').setup {
  disable_netrw = false,
  hijack_netrw = false,
  update_cwd = true,
  auto_close = true,
  view = {
    mappings = {
      list = {
        { key = 'gq', cb = tree_cb 'close' },
      },
    },
  },
}

vim.api.nvim_set_keymap('n', '<leader>tn', '<cmd>NvimTreeToggle<cr>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>ft', '<cmd>NvimTreeFindFile<cr>', { silent = true })
