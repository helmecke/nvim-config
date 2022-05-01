vim.keymap.set('n', '<leader>bd', '<cmd>Bdelete<cr>', { desc = 'delete' })

local success, wk = pcall(require, 'which-key')
if not success then
  return
end

wk.register {
  ['<leader>'] = {
    ['b'] = {
      name = '+buffer',
    },
  },
}
