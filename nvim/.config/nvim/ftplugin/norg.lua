vim.bo.shiftwidth = 2
vim.bo.expandtab = true
vim.bo.tabstop = 2
vim.wo.spell = true

if packer_plugins['which-key.nvim'] and packer_plugins['which-key.nvim'].loaded then
  require('which-key').register({
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
end
