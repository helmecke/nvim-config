return {
  "echasnovski/mini.indentscope",
  version = false, -- wait till new 0.7.0 release to put it back on semver
  event = { "BufReadPost", "BufNewFile", "StdinReadPost" },
  opts = function(_, _)
    return {
      symbol = "│",
      options = { try_as_border = true },
      draw = {
        delay = 0,
        animation = require("mini.indentscope").gen_animation.none(),
        priority = 12,
      },
    }
  end,
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
        "fugitive",
        "oil_preview",
        "norg",
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
}
