return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSUpdateSync" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  keys = {
    { "<Enter>", desc = "Increment selection" },
    { "<S-Enter>", desc = "Decrement selection", mode = "x" },
  },
  opts = {
    highlight = {
      enable = true,
      use_languagetree = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
      disable = { "yaml" },
    },
    ensure_installed = {
      "bash",
      "c",
      "html",
      "javascript",
      "json",
      "http",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<Enter>",
        node_incremental = "<Enter>",
        scope_incremental = false,
        node_decremental = "<S-Enter>",
      },
    },
  },
  config = function(_, opts)
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

    parser_config.gotmpl = {
      install_info = {
        url = "https://github.com/msvechla/tree-sitter-go-template",
        branch = "fix_brackets",
        files = { "src/parser.c" },
      },
      filetype = "gotmpl",
      used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl" },
    }

    parser_config.markdown = {
      install_info = {
        url = "~/Git/github.com/MDeiml/tree-sitter-markdown",
        files = { "src/parser.c", "src/scanner.c" },
        location = "tree-sitter-markdown",
        branch = "split_parser",
      },
    }

    parser_config.markdown_inline = {
      install_info = {
        url = "~/Git/github.com/MDeiml/tree-sitter-markdown",
        files = { "src/parser.c", "src/scanner.c" },
        location = "tree-sitter-markdown-inline",
        branch = "split_parser",
      },
    }

    if type(opts.ensure_installed) == "table" then
      ---@type table<string, boolean>
      local added = {}
      opts.ensure_installed = vim.tbl_filter(function(lang)
        if added[lang] then
          return false
        end
        added[lang] = true
        return true
      end, opts.ensure_installed)
    end
    require("nvim-treesitter.configs").setup(opts)

    local opt = vim.opt

    opt.foldmethod = "expr"
    opt.foldexpr = "nvim_treesitter#foldexpr()"
  end,
}
