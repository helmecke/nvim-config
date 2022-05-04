vim.bo.shiftwidth = 2
vim.bo.expandtab = true
vim.bo.tabstop = 2

-- Add the key mappings only for Markdown files in a zk notebook.
if require('zk.util').notebook_root(vim.fn.expand '%:p') ~= nil then
  -- Open the link under the caret.
  vim.keymap.set('n', '<CR>', '<Cmd>lua vim.lsp.buf.definition()<CR>', { buffer = true })

  -- Create a new note after asking for its title.
  -- This overrides the global `<leader>zn` mapping to create the note in the same directory as the current buffer.
  vim.keymap.set(
    'n',
    '<leader>nn',
    "<Cmd>ZkNew { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>",
    { buffer = true, desc = 'new' }
  )
  -- Create a new note in the same directory as the current buffer, using the current selection for title.
  vim.keymap.set(
    'v',
    '<leader>nnt',
    ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>",
    { buffer = true, desc = 'new (title)' }
  )
  -- Create a new note in the same directory as the current buffer, using the current selection for note content and asking for its title.
  vim.keymap.set(
    'v',
    '<leader>nnc',
    ":'<,'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>",
    { buffer = true, desc = 'new (content)' }
  )

  -- Open notes linking to the current buffer.
  vim.keymap.set('n', '<leader>nb', '<Cmd>ZkBacklinks<CR>', { buffer = true, desc = 'backlinks' })
  -- Alternative for backlinks using pure LSP and showing the source context.
  -- vim.keymap.set('n', '<leader>nb', '<Cmd>lua vim.lsp.buf.references()<CR>', { buffer = true })
  -- Open notes linked by the current buffer.
  vim.keymap.set('n', '<leader>nl', '<Cmd>ZkLinks<CR>', { buffer = true, desc = 'links' })

  -- Preview a linked note.
  vim.keymap.set('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', { buffer = true })
  -- Open the code actions for a visual selection.
  vim.keymap.set(
    'v',
    '<leader>na',
    ":'<,'>lua vim.lsp.buf.range_code_action()<CR>",
    { buffer = true, desc = 'actions' }
  )
end
