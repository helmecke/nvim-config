vim.bo.shiftwidth = 2
vim.bo.expandtab = true
vim.bo.tabstop = 2

local group = vim.api.nvim_create_augroup('filetypeplugin', { clear = false })

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  group = group,
  pattern = { '*.norg' },
  command = 'set conceallevel=3',
})

local success, wk = pcall(require, 'which-key')
if not success then
  return
end
wk.register({
  ['<localleader>'] = {
    t = {
      name = '+task',
    },
    m = {
      name = '+mode',
    },
    n = {
      name = '+new',
    },
    p = {
      name = '+presenter',
    },
  },
}, {
  buffer = 0,
})
