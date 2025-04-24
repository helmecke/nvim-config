---@module "lazy"
---@type LazySpec
return {
  "saghen/blink.cmp",
  dependencies = {
    "mikavilpas/blink-ripgrep.nvim",
  },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "ripgrep" },
      providers = {
        ripgrep = {
          module = "blink-ripgrep",
          name = "Ripgrep",
        },
      },
    },
    completion = {
      list = {
        selection = {
          preselect = false,
          auto_insert = false,
        },
      },
      menu = {
        -- border = "rounded",
        draw = {
          columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "source_name" } },
        },
      },
      -- documentation = {
      --   window = {
      --     border = "rounded",
      --   },
      -- },
    },
    -- signature = {
    --   window = {
    --     border = "rounded",
    --   },
    -- },
    keymap = {
      ["<Esc>"] = { "hide", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<C-g>"] = {
        function()
          require("blink-cmp").show({ providers = { "ripgrep" } })
        end,
      },
    },
  },
}
