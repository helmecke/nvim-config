local util = require 'util'

local autogroups = {
  neovim_terminal = {
    'TermOpen * startinsert',
    'TermOpen * :set nonumber norelativenumber',
    'TermOpen * nnoremap <buffer> <C-c> i<C-c>',
  },
  helm_yamlls = {
    'BufEnter,WinEnter *helm*/*/templates/*.{yml,yaml} :LspStop yamlls',
    'BufLeave *helm*/*/templates/*.{yml,yaml} :LspStart yamlls',
  },
  spell_files = {
    'BufWritePost */spell/*.add silent! :mkspell! %',
  },
}

util.create_augroup(autogroups)

-- https://github.com/kovidgoyal/kitty/issues/6173
-- https://github.com/kovidgoyal/kitty/discussions/4869
local group = vim.api.nvim_create_augroup('_kitty_cwd_fix', { clear = true })
vim.api.nvim_create_autocmd({ 'DirChanged' }, {
  pattern = '*',
  callback = function()
    vim.cmd [[ call chansend(v:stderr, printf("\033]7;file://%s\033\\", v:event.cwd)) ]]
  end,
  group = group,
})
