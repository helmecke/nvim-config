require('qf_helper').setup {
  default_bindings = false,
  quickfix = {
    min_height = 10,
  },
  loclist = {
    min_height = 10,
  },
}

require('which-key').register {
  ['<leader>t'] = {
    name = '+toggle',
    q = { '<cmd>QFToggle!<cr>', 'loclist' },
    l = { '<cmd>LLToggle!<cr>', 'quickfix' },
  },
}
