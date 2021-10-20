vim.api.nvim_buf_set_keymap(0, 'n', '<cr>', '<plug>RestNvim', { silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', '<c-cr>', '<plug>RestNvimLast', { silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', '<c-p>', '<plug>RestNvimPreview', { silent = true })
