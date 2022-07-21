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
    ['ui-select'] = {
      require('telescope.themes').get_dropdown {},
    },
  },
  pickers = {
    find_files = {
      attach_mappings = fixfolds,
    },
    buffers = {
      attach_mappings = fixfolds,
      sort_lastused = true,
      ignore_current_buffer = true,
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
telescope.load_extension 'ui-select'

vim.keymap.set('n', '<a-g>', '<cmd>Telescope ghq list<cr>')
vim.keymap.set('n', '<leader>bb', '<cmd>Telescope buffers<cr>', { desc = 'find' })
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'find' })
vim.keymap.set('n', '<leader>fF', function()
  require('telescope.builtin').find_files { hidden = true }
end, {
  desc = 'find(hidden)',
})
vim.keymap.set('n', '<leader>fw', '<cmd>Telescope vimwiki vimwiki<cr>', { desc = 'wiki' })
vim.keymap.set('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', { desc = 'recent' })
vim.keymap.set('n', '<leader>gb', '<cmd>Telescope git_branches<cr>', { desc = 'branch' })
vim.keymap.set('n', '<leader>gC', '<cmd>Telescope git_bcommits<cr>', { desc = 'buffer commit' })
vim.keymap.set('n', '<leader>gc', '<cmd>Telescope git_commits<cr>', { desc = 'commit' })
vim.keymap.set('n', '<leader>gf', '<cmd>Telescope git_files<cr>', { desc = 'file' })
vim.keymap.set('n', '<leader>gr', '<cmd>Telescope ghq list<cr>', { desc = 'repository' })
vim.keymap.set('n', '<leader>gS', '<cmd>Telescope git_stash<cr>', { desc = 'stash' })
vim.keymap.set('n', '<leader>gs', '<cmd>Telescope git_status<cr>', { desc = 'change' })
vim.keymap.set('n', '<leader>gw', '<cmd>Telescope git_worktree git_worktrees<cr>', { desc = 'worktree' })
vim.keymap.set('n', '<leader>sj', '<cmd>Telescope jumplist<cr>', { desc = 'jumplist' })
vim.keymap.set('n', '<leader>sm', '<cmd>Telescope man_pages<cr>', { desc = 'man page' })
vim.keymap.set('n', '<leader>sq', '<cmd>Telescope quickfix<cr>', { desc = 'quickfix' })
vim.keymap.set('n', '<leader>ss', '<cmd>Telescope live_grep<cr>', { desc = 'string' })
vim.keymap.set('n', '<leader>sw', '<cmd>Telescope vimwiki live_grep<cr>', { desc = 'wiki' })
