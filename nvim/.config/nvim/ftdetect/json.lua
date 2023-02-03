local group = vim.api.nvim_create_augroup('filetypedetect', { clear = false })

vim.api.nvim_create_autocmd(
  { 'BufRead', 'BufNewFile' },
  { group = group, pattern = '*.tfstate', command = 'setl ft=json' }
)
