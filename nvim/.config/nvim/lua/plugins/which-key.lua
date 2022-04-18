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
    ['b'] = {
      name = '+buffer',
    },
    ['g'] = {
      name = '+git',
    },
    ['l'] = {
      name = '+lsp',
    },
    ['n'] = {
      name = '+notes',
      ['w'] = {
        name = '+workspaces',
      },
    },
    ['t'] = {
      name = '+toggle',
    },
    ['s'] = {
      name = '+search',
    },
    ['o'] = {
      name = '+open',
    },
    ['c'] = {
      name = '+change',
    },
    ['f'] = {
      name = '+file',
    },
  },
}
