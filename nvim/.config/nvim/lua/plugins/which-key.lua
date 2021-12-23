require('which-key').setup {
  plugins = {
    marks = false,
    registers = false,
  },
}

require('which-key').register {
  ['<leader>'] = {
    b = {
      name = '+buffer',
      b = { 'find' },
      c = { 'close' },
      d = { 'delete' },
      p = { 'pick' },
    },
    f = {
      name = '+find',
      f = { 'file' },
      g = { 'string' },
      r = { 'recent file' },
      m = { 'man page' },
    },
    g = {
      name = '+git',
      r = { 'repository' },
      f = { 'file' },
      c = { 'commit' },
      b = { 'branch' },
      s = { 'change' },
      S = { 'stash' },
      C = { 'buffer commit' },
      w = { 'worktree' },
    },
    o = {
      name = '+open',
    },
  },
}
