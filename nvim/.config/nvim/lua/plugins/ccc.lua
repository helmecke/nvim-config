return {
  {
    "uga-rosa/ccc.nvim",
    opts = function(_, opts)
      opts = {
        win_opts = {
          border = "none",
        },
        highlighter = {
          auto_enable = not vim.g.ccc_disable,
        },
      }

      local highlighter = require("ccc.highlighter")
      Snacks.toggle({
        name = "Colors",
        get = function()
          return vim.g.ccc_disable ~= true
        end,
        set = function(state)
          vim.g.ccc_disable = not state
          if state then
            highlighter.enable(highlighter, 0)
          else
            highlighter.disable(highlighter, 0)
          end
        end,
      }):map("<leader>uP")
      vim.keymap.set({ "n" }, "<leader>P", "<cmd>CccPick<cr>", { desc = "Pick Color" })

      return opts
    end,
  },
}
