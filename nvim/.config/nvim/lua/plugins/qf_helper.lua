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
