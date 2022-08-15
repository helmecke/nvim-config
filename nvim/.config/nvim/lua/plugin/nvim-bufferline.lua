local colors = require 'onedark.colors'

require('bufferline').setup {
  options = {
    indicator_icon = '▍',
    offsets = { { filetype = 'NvimTree', text = 'File Explorer', highlight = 'Directory', text_align = 'left' } },
    show_close_icon = false,
    show_buffer_close_icons = false,
    diagnostics = 'nvim_lsp',
    right_mouse_command = '',
    middle_mouse_command = 'bdelete! %d',
  },
  highlights = {
    indicator_selected = {
      fg = colors.blue.gui,
    },
  },
}

vim.keymap.set('n', '<leader>bp', '<cmd>BufferLinePick<cr>', { desc = 'pick' })
vim.keymap.set('n', '<leader>b1', '<cmd>BufferLineGoToBuffer 1<cr>', { desc = 'goto 1' })
vim.keymap.set('n', '<leader>b2', '<cmd>BufferLineGoToBuffer 2<cr>', { desc = 'goto 2' })
vim.keymap.set('n', '<leader>b3', '<cmd>BufferLineGoToBuffer 3<cr>', { desc = 'goto 3' })
vim.keymap.set('n', '<leader>b4', '<cmd>BufferLineGoToBuffer 4<cr>', { desc = 'goto 4' })
vim.keymap.set('n', '<leader>b5', '<cmd>BufferLineGoToBuffer 5<cr>', { desc = 'goto 5' })
vim.keymap.set('n', '<leader>b6', '<cmd>BufferLineGoToBuffer 6<cr>', { desc = 'goto 6' })
vim.keymap.set('n', '<leader>b7', '<cmd>BufferLineGoToBuffer 7<cr>', { desc = 'goto 7' })
vim.keymap.set('n', '<leader>b8', '<cmd>BufferLineGoToBuffer 8<cr>', { desc = 'goto 8' })
vim.keymap.set('n', '<leader>b9', '<cmd>BufferLineGoToBuffer 9<cr>', { desc = 'goto 9' })
vim.keymap.set('n', '[b', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Previous buffer' })
vim.keymap.set('n', ']b', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next buffer' })

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
