return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  event = {
    "BufReadPre  " .. vim.fn.expand("~") .. "/Documents/notes/**.md",
    "BufNewFile  " .. vim.fn.expand("~") .. "/Documents/notes/**.md",
    "BufReadPre  " .. vim.fn.expand("~") .. "/Documents/nordlb/**.md",
    "BufNewFile  " .. vim.fn.expand("~") .. "/Documents/nordlb/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "notes",
        path = "~/Documents/notes",
      },
      {
        name = "nordlb",
        path = "~/Documents/nordlb",
      },
    },
    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = "journal",
      -- Optional, if you want to change the date format for the ID of daily notes.
      date_format = "%Y-%m-%d",
      -- Optional, if you want to change the date format of the default alias of daily notes.
      alias_format = "%B %-d, %Y",
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = nil,
    },
    note_id_func = function(title)
      local suffix = ""
      if title ~= nil then
        suffix = title:gsub("[^A-Za-z0-9-]", "")
      else
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return suffix
    end,
    disable_frontmatter = true,
    ui = {
      enable = false,
    },
  },
}
