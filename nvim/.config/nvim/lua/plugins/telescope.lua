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
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    file_browser = {
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

require('git-worktree').setup {
  update_on_change = false,
}

-- require'telescope._extensions.ghq_builtin'.list({ attach_mappings = function(_, map)
--   map('i', '<c-d>', require'telescope.builtin'.git_files{cwd = dir}) -- this action already exist
--   map('n', '<c-d>', require'telescope.builtin'.git_files{cwd = dir}) -- this action already exist
--   -- For more actions look at lua/telescope/actions/init.lua
--   return true
-- end})

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
