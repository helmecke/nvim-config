local telescope = require 'telescope'

telescope.setup {
  mappings = {
    i = {
      ['<C-h>'] = 'which_key',
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = true,
      override_file_sorter = true,
    },
    git_worktree = {
      update_on_change = false,
    },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    buffers = {
      sort_lastused = true,
      show_all_buffers = true,
      mappings = {
        i = { ['<c-d>'] = 'delete_buffer' },
        n = { ['<c-d>'] = 'delete_buffer' },
      },
    },
  },
}

telescope.load_extension 'fzy_native'
telescope.load_extension 'gh'
telescope.load_extension 'ghq'
telescope.load_extension 'git_worktree'

vim.api.nvim_set_keymap('n', '<a-g>', '<cmd>Telescope ghq list<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fm', '<cmd>Telescope man_pages<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gr', '<cmd>Telescope ghq list<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gf', '<cmd>Telescope git_files<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gc', '<cmd>Telescope git_commits<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gb', '<cmd>Telescope git_branches<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gs', '<cmd>Telescope git_status<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gS', '<cmd>Telescope git_stash<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gC', '<cmd>Telescope git_bcommits<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gw', '<cmd>Telescope git_worktree git_worktrees<cr>', { noremap = true })
