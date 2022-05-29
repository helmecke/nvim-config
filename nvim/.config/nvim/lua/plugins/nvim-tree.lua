local tree_cb = require('nvim-tree.config').nvim_tree_callback

require('nvim-tree').setup {
  disable_netrw = false,
  update_cwd = true,
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
      quit_on_open = true,
    },
  },
  renderer = {
    highlight_git = true,
    highlight_opened_files = 'none',
    special_files = {},
    root_folder_modifier = ':p:~',
    icons = {
      glyphs = {
        default = '',
        symlink = '',
      },
      show = {
        git = false,
        folder = true,
        file = true,
        folder_arrow = true,
      },
    },
  },
  view = {
    mappings = {
      list = {
        { key = 'gq', cb = tree_cb 'close' },
      },
    },
  },
}

vim.keymap.set('n', '<leader>tt', '<cmd>NvimTreeToggle<cr>', { desc = 'file tree' })
vim.keymap.set('n', '<leader>fl', '<cmd>NvimTreeFindFile<cr>', { desc = 'locate' })

local success, wk = pcall(require, 'which-key')
if not success then
  return
end

wk.register {
  ['<leader>'] = {
    ['f'] = {
      name = '+file',
    },
  },
}
