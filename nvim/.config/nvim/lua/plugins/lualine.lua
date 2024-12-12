return {
  "nvim-lualine/lualine.nvim",
  opts = function()
    -- PERF: we don't need this lualine require madness 🤷
    local lualine_require = require("lualine_require")
    lualine_require.require = require

    vim.o.laststatus = vim.g.lualine_laststatus

    local colors = require("onedark.helpers").get_colors("onedark")

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
      check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
    }

    local opts = {
      options = {
        icons_enabled = false,
        -- Disable sections and component separators
        component_separators = "",
        section_separators = "",
        theme = {
          -- We are going to use lualine_c an lualine_x as left and
          -- right section. Both are highlighted by c theme .  So we
          -- are just setting default looks o statusline
          normal = { c = { fg = colors.fg, bg = colors.level_3_active } },
          inactive = { c = { fg = colors.bg, bg = colors.level_3_active } },
        },
        globalstatus = vim.o.laststatus == 3,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
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
      table.insert(opts.sections.lualine_c, component)
      local inactive_component = vim.deepcopy(component)
      if type(inactive_component.color) == "table" then
        inactive_component.color.fg = colors.gray
      else
        inactive_component.color = { fg = colors.gray }
      end
      table.insert(opts.inactive_sections.lualine_c, inactive_component)
    end

    -- Inserts a component in lualine_x at right section
    local function ins_right(component)
      table.insert(opts.sections.lualine_x, component)
      local inactive_component = vim.deepcopy(component)
      if type(inactive_component.color) == "table" then
        inactive_component.color.fg = colors.gray
      else
        inactive_component.color = { fg = colors.gray }
      end
      table.insert(opts.inactive_sections.lualine_x, inactive_component)
    end

    ins_left({
      function()
        return "▍"
      end,
      color = { fg = colors.blue },
      padding = { left = 0, right = 1 },
    })

    ins_left({
      function()
        return ""
      end,
      color = function()
        -- auto change color according to neovims mode
        local mode_color = {
          n = colors.red,
          i = colors.green,
          v = colors.blue,
          [""] = colors.blue,
          V = colors.blue,
          c = colors.magenta,
          no = colors.red,
          s = colors.orange,
          S = colors.orange,
          ic = colors.yellow,
          R = colors.violet,
          Rv = colors.violet,
          cv = colors.red,
          ce = colors.red,
          r = colors.cyan,
          rm = colors.cyan,
          ["r?"] = colors.cyan,
          ["!"] = colors.red,
          t = colors.red,
        }
        return { fg = mode_color[vim.fn.mode()] }
      end,
      padding = { right = 1 },
    })

    ins_left({
      "filesize",
    })

    ins_left({
      "searchcount",
      color = { fg = colors.blue },
      padding = { left = 0, right = 0 },
    })

    ins_left({
      "filename",
      color = { fg = "#FFFFFF", gui = "bold" },
    })

    ins_left({ "location" })

    ins_left({ "progress", color = { fg = colors.fg, gui = "bold" } })

    -- Insert mid section. You can make any number of sections in neovim :)
    -- for lualine it's any number greater then 2
    ins_left({
      function()
        return "%="
      end,
    })

    -- Add components to right sections
    ins_right({
      "o:encoding", -- option component same as &encoding in viml
      fmt = string.upper,
      cond = conditions.hide_in_width,
    })

    ins_right({
      "fileformat",
      fmt = string.upper,
      icons_enabled = false,
    })

    ins_right({
      "filetype",
      color = { fg = colors.blue },
    })

    ins_right({
      function()
        return ""
      end,
      color = { fg = colors.green },
      padding = { left = 1, right = 0 },
    })

    ins_right({ "branch", color = { fg = colors.green } })

    ins_right({
      function()
        return "▐"
      end,
      color = { fg = colors.blue },
      padding = { left = 0 },
    })

    -- do not add trouble symbols if aerial is enabled
    -- And allow it to be overriden for some buffer types (see autocmds)
    if vim.g.trouble_lualine and LazyVim.has("trouble.nvim") then
      local trouble = require("trouble")
      local symbols = trouble.statusline({
        mode = "symbols",
        groups = {},
        title = false,
        filter = { range = true },
        format = "{kind_icon}{symbol.name:Normal}",
        hl_group = "lualine_c_normal",
      })
      table.insert(opts.sections.lualine_c, {
        symbols and symbols.get,
        cond = function()
          return vim.b.trouble_lualine ~= false and symbols.has()
        end,
      })
    end

    return opts
  end,
}
