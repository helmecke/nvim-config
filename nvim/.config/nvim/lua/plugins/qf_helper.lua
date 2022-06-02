require('qf_helper').setup {
  default_bindings = false,
  quickfix = {
    min_height = 10,
  },
  loclist = {
    min_height = 10,
  },
}

vim.keymap.set('n', '<leader>tl', '<cmd>LLToggle!<cr>', { desc = 'loclist' })
vim.keymap.set('n', '<leader>tq', '<cmd>QFToggle!<cr>', { desc = 'quickfix' })
vim.keymap.set('n', '[q', '<cmd>QFPrev<cr>', { desc = 'Previous quickfix item' })
vim.keymap.set('n', ']q', '<cmd>QFNext<cr>', { desc = 'Next quickfix item' })
vim.keymap.set('n', '[l', '<cmd>LLPrev<cr>', { desc = 'Previous loclist item' })
vim.keymap.set('n', ']l', '<cmd>LLNext<cr>', { desc = 'Next loclist item' })

local success, wk = pcall(require, 'which-key')
if not success then
  return
end

wk.register {
  ['<leader>'] = {
    ['t'] = {
      name = '+toggle',
    },
  },
}
