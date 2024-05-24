return {
  "rebelot/heirline.nvim",
  event = "VeryLazy",
  config = function()
    local conditions = require("heirline.conditions")
    local utils = require("heirline.utils")

    conditions["buffer_not_empty"] = function()
      return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end

    conditions["hl_search"] = function()
      local searchcount = vim.fn.searchcount({ maxcount = 9999 })
      if searchcount.current == nil then
        searchcount.current = 0
      end
      return (vim.v.hlsearch ~= 0 and searchcount.current > 0)
    end

    conditions["no_hl_search"] = function()
      local searchcount = vim.fn.searchcount({ maxcount = 9999 })
      if searchcount.current == nil then
        searchcount.current = 0
      end
      return (vim.v.hlsearch == 0 or searchcount.current == 0)
    end

    string["surround"] = function(str)
      return " " .. str .. " "
    end

    local colors = {
      active_bg = utils.get_highlight("StatusLine").bg,
      active_fg = utils.get_highlight("StatusLine").fg,
      inactive_bg = utils.get_highlight("StatusLineNC").bg,
      inactive_fg = utils.get_highlight("StatusLineNC").fg,
      red = utils.get_highlight("DiagnosticError").fg,
      dark_red = utils.get_highlight("DiffDelete").bg,
      green = utils.get_highlight("String").fg,
      blue = utils.get_highlight("Function").fg,
      gray = utils.get_highlight("NonText").fg,
      orange = utils.get_highlight("Constant").fg,
      purple = utils.get_highlight("Statement").fg,
      cyan = utils.get_highlight("Special").fg,
      diag_warn = utils.get_highlight("DiagnosticWarn").fg,
      diag_error = utils.get_highlight("DiagnosticError").fg,
      diag_hint = utils.get_highlight("DiagnosticHint").fg,
      diag_info = utils.get_highlight("DiagnosticInfo").fg,
      git_del = utils.get_highlight("diffDeleted").fg,
      git_add = utils.get_highlight("diffAdded").fg,
      git_change = utils.get_highlight("diffChanged").fg,
    }

    local Align = { provider = "%=" }

    local Start = {
      provider = "▍",
      hl = { fg = "blue" },
    }

    local ViMode = {
      -- get vim current mode, this information will be required by the provider
      -- and the highlight functions, so we compute it only once per component
      -- evaluation and store it as a component attribute
      init = function(self)
        self.mode = vim.fn.mode(1) -- :h mode()
      end,
      -- Now we define some dictionaries to map the output of mode() to the
      -- corresponding string and color. We can put these into `static` to compute
      -- them at initialisation time.
      static = {
        mode_names = { -- change the strings if you like it vvvvverbose!
          n = "N",
          no = "N?",
          nov = "N?",
          noV = "N?",
          ["no\22"] = "N?",
          niI = "Ni",
          niR = "Nr",
          niV = "Nv",
          nt = "Nt",
          v = "V",
          vs = "Vs",
          V = "V_",
          Vs = "Vs",
          ["\22"] = "^V",
          ["\22s"] = "^V",
          s = "S",
          S = "S_",
          ["\19"] = "^S",
          i = "I",
          ic = "Ic",
          ix = "Ix",
          R = "R",
          Rc = "Rc",
          Rx = "Rx",
          Rv = "Rv",
          Rvc = "Rv",
          Rvx = "Rv",
          c = "C",
          cv = "Ex",
          r = "...",
          rm = "M",
          ["r?"] = "?",
          ["!"] = "!",
          t = "T",
        },
        mode_colors = {
          n = "red",
          i = "green",
          v = "cyan",
          V = "cyan",
          ["\22"] = "cyan",
          c = "orange",
          s = "purple",
          S = "purple",
          ["\19"] = "purple",
          R = "orange",
          r = "orange",
          ["!"] = "red",
          t = "red",
        },
      },
      -- We can now access the value of mode() that, by now, would have been
      -- computed by `init()` and use it to index our strings dictionary.
      -- note how `static` fields become just regular attributes once the
      -- component is instantiated.
      -- To be extra meticulous, we can also add some vim statusline syntax to
      -- control the padding and make sure our string is always at least 2
      -- characters long. Plus a nice Icon.
      provider = function()
        -- return " %2(" .. self.mode_names[self.mode] .. "%)"
        return " "
      end,
      -- Same goes for the highlight. Now the foreground will change according to the current mode.
      hl = function(self)
        local mode = self.mode:sub(1, 1) -- get only the first mode character
        return { fg = self.mode_colors[mode], bold = true }
      end,
      -- Re-evaluate the component only on ModeChanged event!
      -- Also allows the statusline to be re-evaluated when entering operator-pending mode
      update = {
        "ModeChanged",
        pattern = "*:*",
        callback = vim.schedule_wrap(function()
          vim.cmd("redrawstatus")
        end),
      },
    }

    local FileNameBlock = {
      -- let's first set up some attributes needed by this component and it's children
      init = function(self)
        self.filename = vim.api.nvim_buf_get_name(0)
      end,
    }
    -- We can now define some children separately and add them later

    local FileName = {
      provider = function(self)
        -- first, trim the pattern relative to the current directory. For other
        -- options, see :h filename-modifers
        local filename = vim.fn.fnamemodify(self.filename, ":t")
        if filename == "" then
          return "unnamed"
        end
        return filename .. " "
      end,
      hl = { fg = "white", bold = true },
    }

    local FileFlags = {
      {
        condition = function()
          return vim.bo.modified
        end,
        provider = " ",
        hl = { fg = "red" },
      },
      {
        condition = function()
          return not vim.bo.modifiable or vim.bo.readonly
        end,
        provider = " ",
        hl = { fg = "yellow" },
      },
    }

    local WorkDir = {
      init = function(self)
        local cwd = vim.fn.getcwd(0)
        self.cwd = vim.fn.fnamemodify(cwd, ":~")
        self.path = vim.fn.fnamemodify(cwd, ":p:~:h")
        self.cwd_tail = vim.fn.fnamemodify(cwd, ":t")
        self.head = string.sub(vim.fn.fnamemodify(self.filename, ":p:~:h"), string.len(self.path) + 2)
      end,

      flexible = 1,

      {
        {
          provider = function(self)
            local trail = self.cwd_tail:sub(-1) == "/" and "" or "/"
            return " " .. self.cwd_tail .. trail
          end,
          hl = { fg = "green", bold = true },
        },
        {
          provider = function(self)
            local trail = string.len(self.head) == 0 and "" or "/"
            return self.head .. trail
          end,
          hl = { fg = "blue", bold = true },
        },
      },
      {
        -- evaluates to the shortened path
        {
          provider = function(self)
            local trail = self.cwd_tail:sub(-1) == "/" and "" or "/"
            return " " .. self.cwd_tail .. trail
          end,
          hl = { fg = "green", bold = true },
        },
        -- TODO: fix head outside of cwd
        {
          provider = function(self)
            local head = vim.fn.pathshorten(self.head)
            local trail = string.len(head) == 0 and "" or "/"
            return head .. trail
          end,
          hl = { fg = "blue", bold = true },
        },
      },
      {
        -- evaluates to "", hiding the component
        provider = " ",
      },
    }

    -- Now, let's say that we want the filename color to change if the buffer is
    -- modified. Of course, we could do that directly using the FileName.hl field,
    -- but we'll see how easy it is to alter existing components using a "modifier"
    -- component

    local FileNameModifer = {
      hl = function()
        if vim.bo.modified then
          -- use `force` because we need to override the child's hl foreground
          return { fg = "red", bold = true, force = true }
        end
      end,
    }

    -- let's add the children to our FileNameBlock component
    FileNameBlock = utils.insert(
      FileNameBlock,
      FileFlags,
      utils.insert(FileNameModifer, WorkDir, FileName), -- a new table where FileName is a child of FileNameModifier
      { provider = "%<" } -- this means that the statusline is cut here when there's not enough space
    )

    local FileType = {
      condition = conditions.buffer_not_empty,
      provider = function()
        return string.surround(vim.bo.filetype:gsub("^%l", string.upper) or "")
      end,
      hl = { fg = "blue", bold = true },
    }

    local FileEncoding = {
      condition = conditions.buffer_not_empty,
      provider = function()
        local enc = (vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc -- :h 'enc'
        return enc ~= "utf-8" and string.surround(enc:upper())
      end,
    }

    local FileFormat = {
      condition = conditions.buffer_not_empty,
      provider = function()
        local fmt = vim.bo.fileformat
        return fmt ~= "unix" and string.surround(fmt:upper())
      end,
    }

    local FileSize = {
      condition = function()
        return vim.fn.getfsize(vim.api.nvim_buf_get_name(0)) > 0 and vim.v.hlsearch == 0
      end,
      provider = function()
        -- stackoverflow, compute human readable file size
        local suffix = { "b", "k", "M", "G", "T", "P", "E" }
        local fsize = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))
        fsize = (fsize < 0 and 0) or fsize
        if fsize < 1024 then
          return fsize .. suffix[1]
        end
        local i = math.floor((math.log(fsize) / math.log(1024)))
        return string.surround(string.format("%.2g%s", fsize / math.pow(1024, i), suffix[i + 1]))
      end,
    }

    local SearchCount = {
      condition = function()
        return vim.v.hlsearch ~= 0
      end,
      init = function(self)
        local ok, search = pcall(vim.fn.searchcount)
        if ok and search.total then
          self.search = search
        end
      end,
      provider = function(self)
        local search = self.search
        return string.surround(string.format("%d/%d", search.current, math.min(search.total, search.maxcount)))
      end,
      hl = { fg = "active_bg", bg = "blue" },
    }

    local Git = {
      condition = function()
        return (string.len(vim.fn.FugitiveHead()) > 0)
      end,

      init = function(self)
        self.head = vim.fn.FugitiveHead()
      end,

      provider = function(self)
        return string.surround(" " .. self.head)
      end,

      on_click = {
        callback = function()
          -- If you want to use Fugitive:
          vim.cmd("G")

          -- If you prefer Lazygit
          -- use vim.defer_fn() if the callback requires
          -- opening of a floating window
          -- (this also applies to telescope)
          -- vim.defer_fn(function()
          --     vim.cmd("Lazygit")
          -- end, 100)
        end,
        name = "heirline_git",
      },

      hl = { fg = "green" },
    }

    -- We're getting minimalists here!
    local Ruler = {
      condition = conditions.buffer_not_empty,
      -- %l = current line number
      -- %L = number of lines in the buffer
      -- %c = column number
      -- %P = percentage through file of displayed window
      provider = string.surround("%l:%c %P"),
    }

    -- local Diagnostics = {
    --   static = {
    --     diag_icons = {
    --       ok = " ",
    --       error = require("lazyvim.config").icons.diagnostics.Error,
    --       warn = require("lazyvim.config").icons.diagnostics.Warn,
    --       info = require("lazyvim.config").icons.diagnostics.Info,
    --       hint = require("lazyvim.config").icons.diagnostics.Hint,
    --     },
    --     diag_colors = {
    --       ok = "green",
    --       error = colors.diag_error,
    --       warn = colors.diag_warn,
    --       info = colors.diag_info,
    --       hint = colors.diag_hint,
    --     },
    --   },
    --
    --   init = function(self)
    --     self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    --     self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    --     self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
    --     self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
    --   end,
    --
    --   update = { "DiagnosticChanged", "BufEnter" },
    --
    --   provider = function(self)
    --     local diag = "ok"
    --     if self.hints > 0 then
    --       diag = "hint"
    --     end
    --     if self.info > 0 then
    --       diag = "info"
    --     end
    --     if self.warnings > 0 then
    --       diag = "warn"
    --     end
    --     if self.errors > 0 then
    --       diag = "error"
    --     end
    --     return " " .. self.diag_icons[diag] .. " "
    --   end,
    --
    --   hl = function(self)
    --     local diag = "ok"
    --     if self.hints > 0 then
    --       diag = "hint"
    --     end
    --     if self.info > 0 then
    --       diag = "info"
    --     end
    --     if self.warnings > 0 then
    --       diag = "warn"
    --     end
    --     if self.errors > 0 then
    --       diag = "error"
    --     end
    --     return { fg = self.diag_colors[diag] }
    --   end,
    -- }

    local TerminalName = {
      -- we could add a condition to check that buftype == 'terminal'
      -- or we could do that later (see #conditional-statuslines below)
      provider = function()
        local tname, _ = vim.api.nvim_buf_get_name(0):gsub(".*:", "")
        return " " .. tname
      end,
      hl = { fg = "blue", bold = true },
    }

    local HelpFileName = {
      condition = function()
        return vim.bo.filetype == "help"
      end,
      provider = function()
        local filename = vim.api.nvim_buf_get_name(0)
        return vim.fn.fnamemodify(filename, ":t")
      end,
      hl = { fg = colors.blue },
    }

    ViMode = utils.surround({ " ", " " }, "active_bg", { ViMode })

    local DefaultStatusline = {
      Start,
      ViMode,
      FileSize,
      SearchCount,
      FileNameBlock,
      Ruler,
      Align,
      FileFormat,
      FileEncoding,
      FileType,
      Git,
      -- Diagnostics,
    }

    local InactiveStatusline = {
      condition = conditions.is_not_active,
      hl = { fg = "inactive_fg", force = true },
      Start,
      ViMode,
      FileSize,
      SearchCount,
      FileNameBlock,
      Ruler,
      Align,
      FileFormat,
      FileEncoding,
      FileType,
      Git,
      -- Diagnostics,
    }

    local SpecialStatusline = {
      condition = function()
        return conditions.buffer_matches({
          buftype = { "nofile", "prompt", "help", "quickfix" },
          filetype = { "^git.*", "fugitive" },
        })
      end,

      FileType,
      HelpFileName,
      Align,
    }

    local DashboardStatusline = {
      condition = function()
        return conditions.buffer_matches({
          buftype = { "alpha", "dashboard" },
        })
      end,

      FileType,
      WorkDir,
      Align,
    }

    local TerminalStatusline = {

      condition = function()
        return conditions.buffer_matches({ buftype = { "terminal" } })
      end,

      hl = { bg = "dark_red" },

      -- Quickly add a condition to the ViMode to only show it when buffer is active!
      { condition = conditions.is_active, ViMode },
      FileType,
      TerminalName,
      Align,
    }

    local StatusLines = {

      hl = function()
        if conditions.is_active() then
          return "StatusLine"
        else
          return "StatusLineNC"
        end
      end,

      -- the first statusline with no condition, or which condition returns true is used.
      -- think of it as a switch case with breaks to stop fallthrough.
      fallthrough = false,

      DashboardStatusline,
      SpecialStatusline,
      TerminalStatusline,
      InactiveStatusline,
      DefaultStatusline,
    }

    local Navic = {
      condition = function()
        return require("nvim-navic").is_available()
      end,
      static = {
        -- create a type highlight map
        type_hl = {
          File = "Directory",
          Module = "@include",
          Namespace = "@namespace",
          Package = "@include",
          Class = "@structure",
          Method = "@method",
          Property = "@property",
          Field = "@field",
          Constructor = "@constructor",
          Enum = "@field",
          Interface = "@type",
          Function = "@function",
          Variable = "@variable",
          Constant = "@constant",
          String = "@string",
          Number = "@number",
          Boolean = "@boolean",
          Array = "@field",
          Object = "@type",
          Key = "@keyword",
          Null = "@comment",
          EnumMember = "@field",
          Struct = "@structure",
          Event = "@keyword",
          Operator = "@operator",
          TypeParameter = "@type",
        },
        -- bit operation dark magic, see below...
        enc = function(line, col, winnr)
          return bit.bor(bit.lshift(line, 16), bit.lshift(col, 6), winnr)
        end,
        -- line: 16 bit (65535); col: 10 bit (1023); winnr: 6 bit (63)
        dec = function(c)
          local line = bit.rshift(c, 16)
          local col = bit.band(bit.rshift(c, 6), 1023)
          local winnr = bit.band(c, 63)
          return line, col, winnr
        end,
      },
      init = function(self)
        local data = require("nvim-navic").get_data() or {}
        local children = {}
        -- create a child for each level
        for i, d in ipairs(data) do
          -- encode line and column numbers into a single integer
          local pos = self.enc(d.scope.start.line, d.scope.start.character, self.winnr)
          local child = {
            {
              provider = d.icon,
              hl = self.type_hl[d.type],
            },
            {
              -- escape `%`s (elixir) and buggy default separators
              provider = d.name:gsub("%%", "%%%%"):gsub("%s*->%s*", ""),
              -- highlight icon only or location name as well
              -- hl = self.type_hl[d.type],

              on_click = {
                -- pass the encoded position through minwid
                minwid = pos,
                callback = function(_, minwid)
                  -- decode
                  local line, col, winnr = self.dec(minwid)
                  vim.api.nvim_win_set_cursor(vim.fn.win_getid(winnr), { line, col })
                end,
                name = "heirline_navic",
              },
            },
          }
          -- add a separator only if needed
          if #data > 1 and i < #data then
            table.insert(child, {
              provider = " » ",
              hl = { fg = utils.get_highlight("WhichKeySeparator").fg },
            })
          end
          table.insert(children, child)
        end
        -- instantiate the new child, overwriting the previous one
        self.child = self:new(children, 1)
      end,
      -- evaluate the children containing navic components
      provider = function(self)
        return self.child:eval()
      end,
      hl = { fg = utils.get_highlight("Comment").fg },
      update = { "CursorMoved", "CursorHold" },
    }

    local WinBars = {
      fallthrough = false,
      { -- A special winbar for terminals
        condition = function()
          return conditions.buffer_matches({ buftype = { "terminal" } })
        end,
        utils.surround({ "", "" }, "dark_red", {
          FileType,
          TerminalName,
        }),
      },
      { -- An inactive winbar for regular files
        condition = function()
          return not conditions.is_active()
        end,
        utils.surround({ "", "" }, "inactive_bg", { hl = { fg = "gray", force = true }, Navic }),
      },
      -- A winbar for regular files
      utils.surround({ "", "" }, "active_bg", Navic),
    }

    require("heirline").load_colors(colors)
    require("heirline").setup({
      statusline = StatusLines,
      -- winbar = WinBars,
      opts = {
        -- if the callback returns true, the winbar will be disabled for that window
        -- the args parameter corresponds to the table argument passed to autocommand callbacks. :h nvim_lua_create_autocmd()
        disable_winbar_cb = function(args)
          return conditions.buffer_matches({
            buftype = { "nofile", "prompt", "help", "quickfix" },
            filetype = { "^git.*", "fugitive", "Trouble", "dashboard" },
          }, args.buf)
        end,
      },
    })
  end,
}
