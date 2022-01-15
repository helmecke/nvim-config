vim.bo.shiftwidth = 2
vim.bo.expandtab = true
vim.bo.tabstop = 2

local success, wk = pcall(require, 'which-key')
if not success then
  return
end
wk.register({
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
  t = {
    name = '+task',
    c = 'capture',
    e = 'edit',
    v = 'view',
  },
}, {
  buffer = 0,
  prefix = '<localleader>',
})
