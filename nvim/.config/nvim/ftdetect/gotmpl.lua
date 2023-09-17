local group = vim.api.nvim_create_augroup("filetypedetect", { clear = false })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = group,
  pattern = {
    "*helm*/*/templates/*.yaml",
    "*helm*/*/templates/*.tpl",
    "*helm*/*/config/*",
    "*/templates/*.{yml,yaml}",
  },
  command = [[if search('{{.\+}}', 'nw') | setl ft=gotmpl | endif]],
})
