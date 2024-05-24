return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
    opts = {
      rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
    },
  },
  {
    "rest-nvim/rest.nvim",
    enable = false,
    dependencies = {
      "luarocks.nvim",
    },
    ft = "http",
    keys = {
      { "<C-cr>", "<Plug>RestNvim", desc = "Run request under cursor" },
      { "<C-S-cr>", "<Plug>RestNvimPreview", desc = "Run request under cursor" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "lua",
        "xml",
        "http",
        "json",
        "graphql",
      })
    end,
  },
}
