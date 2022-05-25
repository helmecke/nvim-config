vim.bo.tabstop = 4
vim.bo.shiftwidth = 4

vim.keymap.set('n', '<localleader>b', '<cmd>GoBuild<cr>', { buffer = 0 })
vim.keymap.set('n', '<localleader>c', '<cmd>GoCoverage<cr>', { buffer = 0 })
vim.keymap.set('n', '<localleader>t', '<cmd>GoTest<cr>', { buffer = 0 })
vim.keymap.set('n', '<localleader>r', '<cmd>GoRun<cr>', { buffer = 0 })
vim.keymap.set('n', '<localleader>aa', '<cmd>GoAlt<cr>', { buffer = 0 })
vim.keymap.set('n', '<localleader>av', '<cmd>GoAltV<cr>', { buffer = 0 })
vim.keymap.set('n', '<localleader>as', '<cmd>GoAltS<cr>', { buffer = 0 })
vim.keymap.set('n', '<localleader>i', '<cmd>GoIfErr<cr>', { buffer = 0 })
vim.keymap.set('n', '<localleader>d', '<cmd>GoDoc<cr>', { buffer = 0 })
