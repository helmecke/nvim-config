local telescope = require 'telescope'
local telescope_actions = require 'telescope.actions.set'

-- INFO: https://github.com/nvim-telescope/telescope.nvim/issues/699#issuecomment-1013520776
local fixfolds = function(_)
  telescope_actions.select:enhance {
    post = function()
      vim.cmd ':normal! zX'
    end,
  }
  return true
end

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
      attach_mappings = fixfolds,
    },
    buffers = {
      attach_mappings = fixfolds,
      sort_lastused = true,
      show_all_buffers = true,
      mappings = {
        i = { ['<c-d>'] = 'delete_buffer' },
        n = { ['<c-d>'] = 'delete_buffer' },
      },
    },
    git_files = {
      attach_mappings = fixfolds,
    },
    grep_string = {
      attach_mappings = fixfolds,
    },
    live_grep = {
      attach_mappings = fixfolds,
    },
    oldfiles = {
      attach_mappings = fixfolds,
    },
  },
}

telescope.load_extension 'fzy_native'
telescope.load_extension 'gh'
telescope.load_extension 'ghq'
telescope.load_extension 'git_worktree'

vim.api.nvim_set_keymap('n', '<a-g>', '<cmd>Telescope ghq list<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>bb', '<cmd>Telescope buffers<cr>', { desc = 'find' })
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'find' })
vim.api.nvim_set_keymap('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', { desc = 'recent' })
vim.api.nvim_set_keymap('n', '<leader>gb', '<cmd>Telescope git_branches<cr>', { desc = 'branch' })
vim.api.nvim_set_keymap('n', '<leader>gC', '<cmd>Telescope git_bcommits<cr>', { desc = 'buffer commit' })
vim.api.nvim_set_keymap('n', '<leader>gc', '<cmd>Telescope git_commits<cr>', { desc = 'commit' })
vim.api.nvim_set_keymap('n', '<leader>gf', '<cmd>Telescope git_files<cr>', { desc = 'file' })
vim.api.nvim_set_keymap('n', '<leader>gr', '<cmd>Telescope ghq list<cr>', { desc = 'repository' })
vim.api.nvim_set_keymap('n', '<leader>gS', '<cmd>Telescope git_stash<cr>', { desc = 'stash' })
vim.api.nvim_set_keymap('n', '<leader>gs', '<cmd>Telescope git_status<cr>', { desc = 'change' })
vim.api.nvim_set_keymap('n', '<leader>gw', '<cmd>Telescope git_worktrees<cr>', { desc = 'worktree' })
vim.api.nvim_set_keymap('n', '<leader>sj', '<cmd>Telescope jumplist<cr>', { desc = 'jumplist' })
vim.api.nvim_set_keymap('n', '<leader>sm', '<cmd>Telescope man_pages<cr>', { desc = 'man page' })
vim.api.nvim_set_keymap('n', '<leader>sq', '<cmd>Telescope quickfix<cr>', { desc = 'quickfix' })
vim.api.nvim_set_keymap('n', '<leader>ss', '<cmd>Telescope live_grep<cr>', { desc = 'string' })
