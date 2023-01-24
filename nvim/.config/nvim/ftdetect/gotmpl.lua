local group = vim.api.nvim_create_augroup('filetypedetect', { clear = false })

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = group,
  pattern = { '*helm*/*/templates/*.yaml', '*helm*/*/templates/*.tpl', '*helm*/*/config/*' },
  command = [[if search('{{.\+}}', 'nw') | setl ft=gotmpl | endif]],
})

vim.api.nvim_create_autocmd(
  { 'BufRead', 'BufNewFile' },
  { group = group, pattern = { '*.gotmpl', 'helmfile.yaml' }, command = 'setl ft=gotmpl' }
)
