vim.bo.shiftwidth = 2
vim.bo.expandtab = true
vim.bo.tabstop = 2

local success, wk = pcall(require, 'which-key')
if not success then
  return
end
wk.register({
  ['<localleader>'] = {
    t = {
      name = '+task',
      e = 'edit',
      u = 'undone',
      p = 'pending',
      d = 'done',
      h = 'hold',
      c = 'cancelled',
      r = 'recurring',
      i = 'important',
    },
    j = {
      name = '+journal',
      m = 'tomorrow',
      t = 'today',
      y = 'yesterday',
    },
    m = {
      name = '+mode',
      h = 'traverse-heading',
      n = 'norg',
    },
    n = {
      name = '+new',
      n = 'note',
    },
    p = {
      name = '+presenter',
      s = 'start',
    },
  },
  ['<leader>n'] = {
    n = 'new',
    e = 'edit',
    p = 'presenter',
    j = {
      name = '+journal',
      m = 'tomorrow',
      t = 'today',
      y = 'yesterday',
    },
    m = {
      name = '+mode',
      h = 'traverse-heading',
      n = 'norg',
    },
  },
}, {
  buffer = 0,
})
