require('todo-comments').setup {
  search = {
    command = 'rg',
    args = {
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--hidden',
    },
  },
  highlight = {
    before = '',
    keyword = 'fg',
    after = '',
  },
  keywords = {
    TODO = { color = 'default' },
    PERF = { color = 'info' },
  },
  signs = false,
  colors = {
    error = { 'DiagnosticError' },
    warning = { 'DiagnosticWarn' },
    info = { 'DiagnosticInfo' },
    hint = { 'DiagnosticHint' },
    default = { 'Todo' },
  },
}

vim.keymap.set('n', '<leader>st', '<cmd>TodoTelescope<cr>', { desc = 'todo-comment' })

local success, wk = pcall(require, 'which-key')
if not success then
  return
end

wk.register {
  ['<leader>'] = {
    ['s'] = {
      name = '+search',
    },
  },
}
