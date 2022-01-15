require('which-key').register {
  ['<leader>'] = {
    b = {
      name = '+buffer',
      d = { '<cmd>Bdelete<cr>', 'delete' },
    },
  },
}
