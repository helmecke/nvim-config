vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

require('nvim-treesitter.configs').setup {
  ensure_installed = 'all',
  highlight = { enable = true },
  indent = {
    enable = true,
    disable = { 'yaml' },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<cr>',
      scope_incremental = '<cr>',
      node_incremental = '<tab>',
      node_decremental = '<s-tab>',
    },
  },
}
