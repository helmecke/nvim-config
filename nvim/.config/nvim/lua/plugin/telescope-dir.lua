require('dir-telescope').setup {}

require('telescope').load_extension 'dir'

vim.keymap.set('n', '<leader>fd', '<cmd>Telescope dir find_files<cr>', { desc = 'find in directory' })
vim.keymap.set('n', '<leader>sd', '<cmd>Telescope dir live_grep<cr>', { desc = 'string in directory' })

local success, wk = pcall(require, 'which-key')
if not success then
  return
end

wk.register {
  ['<leader>'] = {
    ['s'] = {
      name = '+search',
    },
    ['f'] = {
      name = '+file',
    },
  },
}
