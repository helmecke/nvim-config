require('zk').setup {
  picker = 'telescope',
}

local success, wk = pcall(require, 'which-key')
if not success then
  return
end

wk.register {
  ['<leader>'] = {
    ['n'] = {
      name = '+notes',
    },
  },
}

-- Create a new note after asking for its title.
vim.keymap.set('n', '<leader>nn', "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", { desc = 'new' })

-- Open notes.
vim.keymap.set('n', '<leader>no', "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", { desc = 'open' })
-- Open notes associated with the selected tags.
vim.keymap.set('n', '<leader>nt', '<Cmd>ZkTags<CR>', { desc = 'tags' })

-- Search for the notes matching a given query.
vim.keymap.set(
  'n',
  '<leader>nf',
  "<Cmd>ZkNotes { sort = { 'modified' }, match = vim.fn.input('Search: ') }<CR>",
  { desc = 'find' }
)
-- Search for the notes matching the current visual selection.
vim.keymap.set('v', '<leader>nf', ":'<,'>ZkMatch<CR>", { desc = 'find' })
