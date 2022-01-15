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
    git_worktree = {
      update_on_change = false,
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

require('which-key').register {
  ['<leader>'] = {
    b = {
      name = '+buffer',
      b = { '<cmd>Telescope buffers<cr>', 'find' },
    },
    f = {
      name = '+file',
      f = { '<cmd>Telescope find_files<cr>', 'file' },
      r = { '<cmd>Telescope oldfiles<cr>', 'recent file' },
    },
    g = {
      name = '+git',
      b = { '<cmd>Telescope git_branches<cr>', 'branch' },
      C = { '<cmd>Telescope git_bcommits<cr>', 'buffer commit' },
      c = { '<cmd>Telescope git_commits<cr>', 'commit' },
      f = { '<cmd>Telescope git_files<cr>', 'file' },
      r = { '<cmd>Telescope ghq list<cr>', 'repository' },
      S = { '<cmd>Telescope git_stash<cr>', 'stash' },
      s = { '<cmd>Telescope git_status<cr>', 'change' },
      w = { '<cmd>Telescope git_worktree git_worktrees<cr>', 'worktree' },
    },
    s = {
      name = '+search',
      j = { '<cmd>Telescope jumplist<cr>', 'jumplist' },
      m = { '<cmd>Telescope man_pages<cr>', 'man page' },
      q = { '<cmd>Telescope quickfix<cr>', 'qickfix' },
      s = { '<cmd>Telescope live_grep<cr>', 'string' },
    },
  },
}
