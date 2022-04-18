require('neorg').setup {
  load = {
    ['core.defaults'] = {},
    ['core.keybinds'] = {
      config = {
        default_keybinds = false,
      },
    },
    ['core.norg.concealer'] = {},
    ['core.norg.completion'] = {
      config = {
        engine = 'nvim-cmp',
      },
    },
    ['core.norg.dirman'] = {
      config = {
        workspaces = {
          personal = '~/Documents/neorg',
          gtd = '~/Documents/gtd',
        },
        autochdir = true,
      },
    },
    ['core.gtd.base'] = {
      config = {
        workspace = 'gtd',
      },
    },
    ['core.integrations.telescope'] = {},
    ['core.presenter'] = {
      config = {
        zen_mode = 'zen-mode',
      },
    },
    ['core.norg.journal'] = {},
  },
  hook = function()
    local neorg_callbacks = require 'neorg.callbacks'
    local leader = '<leader>'
    local localleader = '<localleader>'

    neorg_callbacks.on_event('core.keybinds.events.enable_keybinds', function(_, keybinds)
      -- Map all the below keybinds only when the "norg" mode is active
      keybinds.map_event_to_mode('norg', {
        n = {
          -- Keys for managing TODO items and setting their states
          { localleader .. 'tu', 'core.norg.qol.todo_items.todo.task_undone' },
          { localleader .. 'tp', 'core.norg.qol.todo_items.todo.task_pending' },
          { localleader .. 'td', 'core.norg.qol.todo_items.todo.task_done' },
          { localleader .. 'th', 'core.norg.qol.todo_items.todo.task_on_hold' },
          { localleader .. 'tc', 'core.norg.qol.todo_items.todo.task_cancelled' },
          { localleader .. 'tr', 'core.norg.qol.todo_items.todo.task_recurring' },
          { localleader .. 'ti', 'core.norg.qol.todo_items.todo.task_important' },
          { '<C-Space>', 'core.norg.qol.todo_items.todo.task_cycle' },

          -- Keys for managing GTD
          { localleader .. 'te', 'core.gtd.base.edit' },
          { leader .. 'ne', 'core.gtd.base.edit' },

          -- Keys for managing notes
          { localleader .. 'nn', 'core.norg.dirman.new.note' },
          { leader .. 'nn', 'core.norg.dirman.new.note' },

          { '<CR>', 'core.norg.esupports.hop.hop-link' },
          { '<M-CR>', 'core.norg.esupports.hop.hop-link', 'vsplit' },

          { '<C-s>', 'core.integrations.telescope.find_linkable' },

          -- TODO: rebind
          -- { '<M-k>', 'core.norg.manoeuvre.item_up' },
          -- { '<M-j>', 'core.norg.manoeuvre.item_down' },
        },
        i = {
          { '<C-l>', 'core.integrations.telescope.insert_link' },
        },
        o = {
          { 'ah', 'core.norg.manoeuvre.textobject.around-heading' },
          { 'ih', 'core.norg.manoeuvre.textobject.inner-heading' },
          { 'at', 'core.norg.manoeuvre.textobject.around-tag' },
          { 'it', 'core.norg.manoeuvre.textobject.inner-tag' },
          { 'al', 'core.norg.manoeuvre.textobject.around-whole-list' },
        },
      }, {
        silent = true,
        noremap = true,
      })

      -- Map the below keys only when traverse-heading mode is active
      keybinds.map_event_to_mode('traverse-heading', {
        n = {
          -- Rebind j and k to move between headings in traverse-heading mode
          { 'j', 'core.integrations.treesitter.next.heading' },
          { 'k', 'core.integrations.treesitter.previous.heading' },
        },
      }, {
        silent = true,
        noremap = true,
      })

      -- Map the below keys on gtd displays
      keybinds.map_event_to_mode('gtd-displays', {
        n = {
          { '<CR>', 'core.gtd.ui.goto_task' },

          -- Keys for closing the current display
          { 'q', 'core.gtd.ui.close' },
          { '<Esc>', 'core.gtd.ui.close' },

          { 'e', 'core.gtd.ui.edit_task' },
          { '<Tab>', 'core.gtd.ui.details' },
        },
      }, {
        silent = true,
        noremap = true,
        nowait = true,
      })

      -- Map the below keys on presenter mode
      keybinds.map_event_to_mode('presenter', {
        n = {
          { '<CR>', 'core.presenter.next_page' },
          { 'l', 'core.presenter.next_page' },
          { 'h', 'core.presenter.previous_page' },

          -- Keys for closing the current display
          { 'q', 'core.presenter.close' },
          { '<Esc>', 'core.presenter.close' },
        },
      }, {
        silent = true,
        noremap = true,
        nowait = true,
      })

      -- Apply the below keys to all modes
      keybinds.map_to_mode('all', {
        n = {
          { localleader .. 'mn', ':Neorg mode norg<CR>' },
          { localleader .. 'mh', ':Neorg mode traverse-heading<CR>' },
          { leader .. 'nmn', ':Neorg mode norg<CR>' },
          { leader .. 'nmh', ':Neorg mode traverse-heading<CR>' },

          -- Keys for managing journal
          { localleader .. 'jm', ':Neorg journal tomorrow<CR>' },
          { localleader .. 'jt', ':Neorg journal today<CR>' },
          { localleader .. 'jy', ':Neorg journal yesterday<CR>' },
          { leader .. 'njm', ':Neorg journal tomorrow<CR>' },
          { leader .. 'njt', ':Neorg journal today<CR>' },
          { leader .. 'njy', ':Neorg journal yesterday<CR>' },

          -- Keys for managing presenter
          { localleader .. 'ps', ':Neorg presenter start<CR>' },
          { leader .. 'np', ':Neorg presenter start<CR>' },
        },
      }, {
        silent = true,
        noremap = true,
      })
    end)
  end,
}

vim.cmd 'autocmd VimEnter * NeorgStart silent=true'

vim.api.nvim_set_keymap('n', '<leader>nc', '<cmd>Neorg gtd capture<cr>', { desc = 'capture' })
vim.api.nvim_set_keymap('n', '<leader>nv', '<cmd>Neorg gtd views<cr>', { desc = 'view' })
vim.api.nvim_set_keymap('n', '<leader>nwg', '<cmd>Neorg workspace gtd<cr>', { desc = 'gtd' })
vim.api.nvim_set_keymap('n', '<leader>nwp', '<cmd>Neorg workspace personal<cr>', { desc = 'personal' })
vim.api.nvim_set_keymap('n', '<leader>nww', '<cmd>Neorg workspace work<cr>', { desc = 'work' })
