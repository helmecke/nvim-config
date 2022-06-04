vim.g.mapleader = ','
vim.g.maplocalleader = ';'

vim.keymap.set('n', '<leader><leader>', '<c-^>', { desc = 'alternative file' })
vim.keymap.set('n', '<leader>cd', '<cmd>cd %:p:h<CR><cmd>pwd<CR>', { desc = 'directory' })
vim.keymap.set('n', '<leader><space>', '<cmd>nohlsearch<CR>', { desc = 'clear search' })
vim.keymap.set('n', '<leader>bc', '<cmd>bw<cr>', { desc = 'close', silent = true })

-- recommended navigation shortcuts :help terminal-input
vim.keymap.set('t', '<m-j>', '<c-\\><c-n><c-w>j')
vim.keymap.set('t', '<m-k>', '<c-\\><c-n><c-w>k')
vim.keymap.set('t', '<m-l>', '<c-\\><c-n><c-w>l')
vim.keymap.set('t', '<m-h>', '<c-\\><c-n><c-w>h')
vim.keymap.set('i', '<m-j>', '<c-\\><c-n><c-w>j')
vim.keymap.set('i', '<m-k>', '<c-\\><c-n><c-w>k')
vim.keymap.set('i', '<m-l>', '<c-\\><c-n><c-w>l')
vim.keymap.set('i', '<m-h>', '<c-\\><c-n><c-w>h')
vim.keymap.set('n', '<m-j>', '<c-w>j')
vim.keymap.set('n', '<m-k>', '<c-w>k')
vim.keymap.set('n', '<m-l>', '<c-w>l')
vim.keymap.set('n', '<m-h>', '<c-w>h')

-- traversing text in insert mode like in terminal
vim.keymap.set('i', '<a-f>', '<c-o>f')
vim.keymap.set('i', '<a-b>', '<c-o>b')
vim.keymap.set('i', '<c-f>', '<c-o>l')
vim.keymap.set('i', '<c-b>', '<c-o>h')
vim.keymap.set('i', '<c-a>', '<c-o>0')
vim.keymap.set('i', '<c-e>', '<c-o>$')
vim.keymap.set('i', '<c-e>', '<c-o>$')
vim.keymap.set('i', '<c-u>', '<c-o>d0')
vim.keymap.set('i', '<c-k>', '<c-o>d$')
vim.keymap.set('i', '<c-y>', '<c-o>P')
vim.keymap.set('i', '<c-_>', '<c-o>u')

vim.keymap.set('n', '<leader>ots', '<cmd>botright sp +te<CR>', { desc = 'split' })
vim.keymap.set('n', '<leader>otv', '<cmd>botright vs +te<CR>', { desc = 'vertical' })
vim.keymap.set('n', '<leader>ott', '<cmd>tabe +te<CR>', { desc = 'tab' })

-- make Y behave like C and D, cursor to eol
vim.keymap.set('n', 'Y', 'y$')

-- keeping it centered
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', 'J', 'mzJ`z')

-- convinient system yank or paste
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'yank to clipboard' })
vim.keymap.set('n', '<leader>p', '"+p', { desc = 'paste from clipboard below' })
vim.keymap.set('n', '<leader>P', '"+P', { desc = 'paste from clipboard abow' })
vim.keymap.set('v', '<leader>p', '"+p', { desc = 'paste from clipboard' })
