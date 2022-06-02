require('gitsigns').setup {
  signs = {
    add = { hl = 'GitSignsAdd', text = '▍', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
    change = {
      hl = 'GitSignsChange',
      text = '▍',
      numhl = 'GitSignsChangeNr',
      linehl = 'GitSignsChangeLn',
    },
    delete = {
      hl = 'GitSignsDelete',
      text = '▸',
      numhl = 'GitSignsDeleteNr',
      linehl = 'GitSignsDeleteLn',
    },
    topdelete = {
      hl = 'GitSignsDelete',
      text = '▾',
      numhl = 'GitSignsDeleteNr',
      linehl = 'GitSignsDeleteLn',
    },
    changedelete = {
      hl = 'GitSignsChange',
      text = '▍',
      numhl = 'GitSignsChangeNr',
      linehl = 'GitSignsChangeLn',
    },
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        return ']c'
      end
      vim.schedule(function()
        gs.next_hunk()
      end)
      return '<Ignore>'
    end, { desc = 'Next change', expr = true })

    map('n', '[c', function()
      if vim.wo.diff then
        return '[c'
      end
      vim.schedule(function()
        gs.prev_hunk()
      end)
      return '<Ignore>'
    end, { desc = 'Previous change', expr = true })

    -- Actions
    map({ 'n', 'v' }, '<leader>ghs', ':Gitsigns stage_hunk<CR>', { desc = 'stage' })
    map({ 'n', 'v' }, '<leader>ghr', ':Gitsigns reset_hunk<CR>', { desc = 'reset' })
    map('n', '<leader>ghu', gs.undo_stage_hunk, { desc = 'undo' })
    map('n', '<leader>ghp', gs.preview_hunk, { desc = 'preview' })
    map('n', '<leader>ghb', function()
      gs.blame_line { full = true }
    end, { desc = 'blame' })
    map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'blame' })
    map('n', '<leader>gd', gs.diffthis, { desc = 'diff with index' })
    map('n', '<leader>gD', function()
      gs.diffthis '~'
    end, { desc = 'diff with head' })
    map('n', '<leader>td', gs.toggle_deleted, { desc = 'deleted' })

    -- Text object
    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end,
}

local success, wk = pcall(require, 'which-key')
if not success then
  return
end

wk.register {
  ['<leader>'] = {
    ['g'] = {
      name = '+git',
      ['h'] = {
        name = '+hunk',
      },
    },
  },
}
