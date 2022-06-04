require('session_manager').setup {
  autoload_mode = 'Disabled',
}

vim.keymap.set('n', '<leader>SS', '<cmd>SessionManager load_session<cr>', { desc = 'load' })
vim.keymap.set('n', '<leader>Ss', '<cmd>SessionManager save_current_session<cr>', { desc = 'save' })
vim.keymap.set('n', '<leader>Sd', '<cmd>SessionManager delete_session<cr>', { desc = 'load' })
vim.keymap.set('n', '<leader>Sl', '<cmd>SessionManager load_last_session<cr>', { desc = 'last' })
vim.keymap.set('n', '<leader>Sc', '<cmd>SessionManager load_current_dir_session<cr>', { desc = 'current' })

local success, wk = pcall(require, 'which-key')
if not success then
  return
end

wk.register {
  ['<leader>'] = {
    ['S'] = {
      name = '+session',
    },
  },
}
