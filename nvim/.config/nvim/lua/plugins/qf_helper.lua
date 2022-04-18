require('qf_helper').setup {
  default_bindings = false,
  quickfix = {
    min_height = 10,
  },
  loclist = {
    min_height = 10,
  },
}

vim.api.nvim_set_keymap('n', '<leader>tl', '<cmd>LLToggle!<cr>', { desc = 'loclist' })
vim.api.nvim_set_keymap('n', '<leader>tq', '<cmd>QFToggle!<cr>', { desc = 'quickfix' })
