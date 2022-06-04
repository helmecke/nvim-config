vim.g.db_ui_show_help = 0
vim.g.dbui_disable_mappings = 0

vim.o.previewheight = 20

vim.keymap.set('n', '<leader>db', '<cmd>DBUIToggle<cr>', { silent = true })
vim.keymap.set({ 'n', 'x' }, '<Plug>(DBExe)', [[db#op_exec()]], { expr = true })
vim.keymap.set('n', '<Plug>(DBExeLine)', [[db#op_exec() . '_']], { expr = true })

vim.keymap.set({ 'n', 'x', 'o' }, '<leader>d', '<Plug>(DBExe)')
vim.keymap.set('n', '<leader>dl', '<Plug>(DBExeLine)')
