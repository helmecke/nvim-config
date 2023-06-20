require('neorg').setup {
  load = {
    ['core.defaults'] = {},
    ['core.concealer'] = {},
    ['core.dirman'] = {
      config = {
        workspaces = {
          notes = '~/Documents/neorg',
        },
        default_workspace = 'notes',
      },
    },
    ['core.keybinds'] = {
      config = {
        hook = function(keybinds)
          keybinds.map_event(
            'norg',
            'n',
            '<localleader>c',
            'core.looking-glass.magnify-code-block',
            { desc = 'code block' }
          )
          keybinds.map_event('norg', 'n', '<C-s>', 'core.integrations.telescope.find_linkable')
          keybinds.map_event('norg', 'i', '<C-l>', 'core.integrations.telescope.insert_link')
          keybinds.map('all', 'n', '<leader>nq', '<cmd>Neorg return<cr>', { desc = 'return' })
          keybinds.map('norg', 'n', '<localleader>t', '<cmd>Neorg toc<cr>', { desc = 'return' })
        end,
      },
    },
    ['core.completion'] = {
      config = {
        engine = 'nvim-cmp',
      },
    },
    ['core.summary'] = {},
    ['core.esupports.metagen'] = {
      config = {
        type = 'auto',
        template = {
          {
            'title',
            function()
              return vim.fn.expand '%:p:t:r'
            end,
          },
          { 'description', '' },
          {
            'authors',
            function()
              return 'Jakob Helmecke'
            end,
          },
          { 'categories', '' },
          {
            'created',
            function()
              return os.date '%Y-%m-%d'
            end,
          },
          {
            'updated',
            function()
              return os.date '%Y-%m-%d'
            end,
          },
          { 'version', require('neorg.config').norg_version },
        },
      },
    },
    ['core.integrations.telescope'] = {},
    ['core.qol.toc'] = {
      config = {
        close_after_use = true,
      },
    },
  },
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
    ['j'] = {
      name = '+journal',
    },
  },
}

vim.keymap.set('n', '<leader>ni', '<cmd>Neorg index<cr>', { desc = 'index' })
vim.keymap.set('n', '<leader>jj', '<cmd>Neorg journal today<cr>', { desc = 'today' })
vim.keymap.set('n', '<leader>jy', '<cmd>Neorg journal yesterday<cr>', { desc = 'yesterday' })
vim.keymap.set('n', '<leader>jt', '<cmd>Neorg journal tomorrow<cr>', { desc = 'tomorrow' })
