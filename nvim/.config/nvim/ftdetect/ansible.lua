local group = vim.api.nvim_create_augroup('filetypedetect', { clear = false })

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = group,
  pattern = {
    '*/comp/{playbook_*,group_vars/*,host_vars/*}.{yml,yaml}',
    '*/{de.hacon.hafas.ansible.roles.*}/*.{yml,yaml}',
  },
  command = 'setl ft=yaml.ansible',
})
