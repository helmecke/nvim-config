vim.keymap.set({ 'n', 'v' }, '<leader>gy', '<cmd>GBrowse!<CR>', { desc = 'yank link' })

local success, wk = pcall(require, 'which-key')
if not success then
  return
end

wk.register {
  ['<leader>'] = {
    ['g'] = {
      name = '+git',
    },
  },
}
