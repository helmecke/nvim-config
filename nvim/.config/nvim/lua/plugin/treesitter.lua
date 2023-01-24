vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

parser_config.gotmpl = {
  install_info = {
    url = 'https://github.com/msvechla/tree-sitter-go-template',
    branch = 'fix_brackets',
    files = { 'src/parser.c' },
  },
  filetype = 'gotmpl',
  used_by = { 'gohtmltmpl', 'gotexttmpl', 'gotmpl' },
}

require('nvim-treesitter.configs').setup {
  ensure_installed = 'all',
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
    disable = { 'yaml' },
  },
}
