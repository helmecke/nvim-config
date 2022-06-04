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
