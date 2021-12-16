local lualine = require 'lualine'
local colors = require 'onedark.colors'

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand '%:t') ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand '%:p:h'
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    component_separators = '',
    section_separators = '',
    theme = {
      normal = { c = { fg = colors.white.gui, bg = colors.vertsplit.gui } },
      inactive = { c = { fg = colors.white.gui, bg = colors.vertsplit.gui } },
    },
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  function()
    return '▎'
  end,
  color = { fg = colors.white.gui }, -- Sets highlighting of component
  padding = { left = 0, right = 0 }, -- We don't need space before this
}

ins_left {
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
    vim.api.nvim_command('hi! LualineMode guifg=' .. mode_color[vim.fn.mode()] .. ' guibg=' .. colors.vertsplit.gui)
    return ''
  end,
  color = 'LualineMode',
  padding = { right = 1 },
}

ins_left {
  -- filesize component
  'filesize',
  cond = conditions.buffer_not_empty,
}

ins_left {
  -- filesize component
  'filetype',
  icon_only = true,
  cond = conditions.buffer_not_empty,
  padding = { left = 0, right = 0 },
}

ins_left {
  'filename',
  file_status = false,
  path = 1,
  shorting_target = 60,
  cond = conditions.buffer_not_empty,
  color = { fg = colors.white.gui },
}

ins_left {
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
}

ins_left {
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
}

ins_left {
  'location',
  cond = conditions.buffer_not_empty,
  padding = { left = 0, right = 0 },
}

ins_right {
  'fileformat',
  icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
  color = { fg = colors.green.gui, gui = 'bold' },
}

ins_right {
  'branch',
  icon = '',
}

lualine.setup(config)
