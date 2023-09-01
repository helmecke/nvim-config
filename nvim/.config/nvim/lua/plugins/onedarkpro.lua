return {
  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd("colorscheme onedark")
      vim.cmd("hi clear Folded")
      vim.cmd("hi clear FoldedNC")
    end,
    opts = {
      colors = {
        float_bg = "#282c34",
        git_add = "#98C379",
        git_change = "#E5C07B",
        git_delete = "#E06C75",
        selection_fg = "require('onedarkpro.helpers').lighten('white', 20, 'onedark')",
      },
      styles = {
        comments = "italic",
        virtual_text = "NONE",
      },
      filetypes = {
        all = false,
      },
      plugins = {
        all = false,
        gitsigns = true,
        indentline = true,
        nvim_lsp = true,
        which_key = true,
      },
      highlights = {
        -- editor
        CursorLineNr = { link = "Normal" },
        PmenuSel = { fg = "${selection_fg}", bg = "${cursorline}" },
        PmenuThumb = { bg = "${comment}" },
        StatusLine = { fg = "${white}", bg = "${bg_statusline}" },
        StatusLineNC = { fg = "${comment}", bg = "${bg_statusline}" },
        -- plugins
        NotifyDEBUGBorder = { link = "FloatBorder" },
        NotifyERRORBorder = { link = "FloatBorder" },
        NotifyINFOBorder = { link = "FloatBorder" },
        NotifyTRACEBorder = { link = "FloatBorder" },
        NotifyWARNBorder = { link = "FloatBorder" },
        TelescopeBorder = { link = "FloatBorder" },
        WhichKey = { fg = "${blue}" },
        WhichKeyGroup = { fg = "${green}" },
        WhichKeySeparator = { fg = "${comment}" },
        UfoFoldedEllipsis = { link = "FoldColumn" },
        FoldColumn = { link = "Question" },
        MiniIndentscopeSymbol = { link = "Todo" },
        MiniIndentscopeSymbolOff = { link = "Error" },
      },
    },
  },
  {
    "folke/lazy.nvim",
    opts = {
      install = {
        colorscheme = { "onedark", "habamax" },
      },
    },
  },
}
