local lualine = require 'lualine'
local colors = require 'onedark.colors'

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand '%:t') ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  hl_search = function()
    local searchcount = vim.fn.searchcount { maxcount = 9999 }
    return (vim.v.hlsearch ~= 0 and searchcount.current > 0)
  end,
  no_hl_search = function()
    local searchcount = vim.fn.searchcount { maxcount = 9999 }
    return (vim.v.hlsearch == 0 or searchcount.current == 0)
  end,
}

local config = {
  options = {
    component_separators = '',
    section_separators = '',
    theme = {
      normal = { c = { fg = colors.white.gui, bg = colors.vertsplit.gui } },
      inactive = { c = { fg = colors.comment_grey.gui, bg = '#23272E' } },
    },
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        function()
          return '▍'
        end,
        color = { fg = colors.blue.gui },
        padding = { left = 0, right = 0 }, -- we don't need space before this
      },
      {
        function()
          local mode_color = {
            n = colors.red.gui,
            i = colors.yellow.gui,
            v = colors.purple.gui,
            [''] = colors.purple.gui,
            V = colors.purple.gui,
            c = colors.white.gui,
            no = colors.white.gui,
            s = colors.dark_yellow.gui,
            S = colors.dark_yellow.gui,
            [''] = colors.dark_yellow.gui,
            ic = colors.yellow.gui,
            R = colors.red.gui,
            Rv = colors.red.gui,
            cv = colors.white.gui,
            ce = colors.white.gui,
            r = colors.cyan.gui,
            rm = colors.cyan.gui,
            ['r?'] = colors.cyan.gui,
            ['!'] = colors.white.gui,
            t = colors.blue.gui,
          }
          vim.api.nvim_command(
            'hi! LualineMode guifg=' .. mode_color[vim.fn.mode()] .. ' guibg=' .. colors.vertsplit.gui
          )
          return ''
        end,
        color = 'LualineMode',
        padding = { right = 1 },
      },
      {
        function()
          local searchcount = vim.fn.searchcount { maxcount = 9999 }
          return searchcount.current .. '/' .. searchcount.total
        end,
        color = { fg = colors.vertsplit.gui, bg = colors.blue.gui },
        cond = conditions.hl_search,
      },
      {
        'filesize',
        cond = conditions.no_hl_search,
      },
      {
        'filename',
        file_status = false,
        path = 1,
        shorting_target = 60,
        cond = conditions.buffer_not_empty,
        color = { fg = colors.white.gui, gui = 'bold' },
      },
      {
        function()
          local file = vim.fn.expand '%:t'
          if vim.fn.empty(file) == 1 then
            return ''
          end
          if vim.bo.filetype == 'help' then
            return ''
          end
          if vim.bo.readonly == true then
            return ''
          end
          return ''
        end,
        cond = conditions.buffer_not_empty,
        color = { fg = colors.red.gui, gui = 'bold' },
        padding = { left = 0, right = 0 },
      },
      {
        function()
          local file = vim.fn.expand '%:t'
          if vim.fn.empty(file) == 1 then
            return ''
          end
          if vim.bo.modifiable then
            if vim.bo.modified then
              return '●'
            end
          end
          return ''
        end,
        cond = conditions.buffer_not_empty,
        color = { fg = colors.blue.gui, gui = 'bold' },
        padding = { left = 0, right = 1 },
      },
      {
        'location',
        cond = conditions.buffer_not_empty,
        padding = { left = 0, right = 0 },
      },
    },
    lualine_x = {
      {
        function()
          local space_indent = vim.fn.search([[\v^ +]], 'nwc')
          local tab_indent = vim.fn.search([[\v^\t+]], 'nwc')
          return (space_indent > 0 and tab_indent > 0) and '!MI' or ''
        end,
      },
      {
        function()
          local space = vim.fn.search([[\s\+$]], 'nwc')
          return space > 0 and '!TW' or ''
        end,
      },
      {
        function()
          return vim.bo.eol and '' or '!EOL'
        end,
      },
      {
        'fileformat',
        icons_enabled = true,
        symbols = {
          unix = 'LF',
          dos = 'CRLF',
          mac = 'CR',
        },
      },
      {
        'o:encoding',
        fmt = string.upper,
      },
      {
        'FugitiveHead',
        icon = '',
        color = { fg = colors.green.gui, gui = 'bold' },
      },
      {
        function()
          return vim.bo.filetype:gsub('^%l', string.upper) or ''
        end,
        cond = conditions.buffer_not_empty,
        color = { fg = '#FFFFFF', gui = 'bold' },
      },
    },
    lualine_y = {},
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        function()
          return '▍'
        end,
        padding = { left = 0, right = 0 }, -- We don't need space before this
      },
      {
        function()
          return ''
        end,
        padding = { right = 1 },
      },
      {
        'filesize',
        cond = conditions.buffer_not_empty,
      },
      {
        'filename',
        file_status = false,
        path = 1,
        shorting_target = 60,
        cond = conditions.buffer_not_empty,
      },
      {
        function()
          local file = vim.fn.expand '%:t'
          if vim.fn.empty(file) == 1 then
            return ''
          end
          if vim.bo.filetype == 'help' then
            return ''
          end
          if vim.bo.readonly == true then
            return ''
          end
          return ''
        end,
        cond = conditions.buffer_not_empty,
        padding = { left = 0, right = 0 },
      },
      {
        function()
          local file = vim.fn.expand '%:t'
          if vim.fn.empty(file) == 1 then
            return ''
          end
          if vim.bo.modifiable then
            if vim.bo.modified then
              return '●'
            end
          end
          return ''
        end,
        cond = conditions.buffer_not_empty,
        padding = { left = 0, right = 1 },
      },
      {
        'location',
        cond = conditions.buffer_not_empty,
        padding = { left = 0, right = 0 },
      },
    },
    lualine_x = {
      {
        'fileformat',
        icons_enabled = true,
        symbols = {
          unix = 'LF',
          dos = 'CRLF',
          mac = 'CR',
        },
      },
      {
        'o:encoding',
        fmt = string.upper,
      },
      {
        'FugitiveHead',
        icon = '',
      },
      {
        function()
          return vim.bo.filetype:gsub('^%l', string.upper) or ''
        end,
        cond = conditions.buffer_not_empty,
      },
    },
    lualine_y = {},
    lualine_z = {},
  },
  extensions = {
    {
      sections = {
        lualine_c = {
          {
            function()
              return '▍'
            end,
            color = { fg = colors.blue.gui },
            padding = { left = 0, right = 0 },
          },
          {
            function()
              return ''
            end,
            padding = { right = 1 },
            color = { fg = colors.red.gui },
          },
          {
            function()
              return 'Fugitive'
            end,
            color = { gui = 'bold' },
          },
        },
        lualine_x = { { 'FugitiveHead', icon = '', color = { fg = colors.green.gui, gui = 'bold' } } },
      },
      filetypes = { 'fugitive' },
    },
    'quickfix',
    { sections = {}, filetypes = { 'NvimTree' } },
  },
}

lualine.setup(config)
