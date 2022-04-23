vim.keymap.set('n', '<leader>r<cr>', '<Plug>(iron-cr)', { silent = true })
vim.keymap.set('n', '<leader>rr', '<cmd>IronRepl<cr>', { silent = true })
vim.keymap.set('n', '<leader>r', '<Plug>(iron-send-motion)', { silent = true })
vim.keymap.set('v', '<leader>r', '<Plug>(iron-visual-send)', { silent = true })
vim.keymap.set('n', '<leader>rl', '<Plug>(iron-send-line)', { silent = true })

vim.g.iron_map_defaults = 0
vim.g.iron_map_extended = 0

local iron = require 'iron'

iron.core.add_repl_definitions {
  vimwiki = {
    zsh = {
      command = { 'zsh' },
    },
  },
}

iron.core.set_config {
  repl_open_cmd = 'vsplit',
  preferred = {
    vimwiki = 'zsh',
  },
}

local success, wk = pcall(require, 'which-key')
if not success then
  return
end

wk.register {
  ['<leader>'] = {
    ['r'] = {
      name = '+repl',
    },
  },
}
