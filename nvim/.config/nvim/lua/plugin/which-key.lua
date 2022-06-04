require('which-key').setup {
  plugins = {
    marks = false,
    registers = false,
    spelling = {
      enabled = true,
    },
  },
}

require('which-key').register {
  ['<leader>'] = {
    ['l'] = {
      name = '+lsp',
    },
    ['o'] = {
      name = '+open',
    },
    ['c'] = {
      name = '+change',
    },
  },
}
