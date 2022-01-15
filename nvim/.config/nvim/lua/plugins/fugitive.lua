require('which-key').register {
  ['<leader>g'] = {
    name = '+git',
    y = { '<cmd>GBrowse!<CR>', 'yank link' },
  },
}

require('which-key').register({
  ['<leader>g'] = {
    name = '+git',
    y = { '<cmd>GBrowse!<CR>', 'yank link' },
  },
}, {
  mode = 'v',
})
