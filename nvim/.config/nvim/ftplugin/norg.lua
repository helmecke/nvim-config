vim.opt_local.tabstop = 1
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.breakindent = true
vim.opt_local.breakindentopt = "list:-1"
vim.opt_local.formatlistpat = "^\\s*[-~>]\\+\\s\\((.)\\s\\)\\?"
vim.opt_local.showbreak = "NONE"
vim.opt_local.concealcursor = "nv"
vim.opt_local.smartindent = false

local status_ok, wk = pcall(require, "which-key")
if status_ok then
  wk.register({
    name = "Neorg",
    c = { name = "+code" },
    f = { name = "+find" },
    i = { name = "+insert" },
    l = { name = "+list" },
    m = { name = "+mode" },
    n = { name = "+note" },
    t = { name = "+task" },
  }, {
    mode = "n",
    prefix = "<localleader>",
    buffer = 0,
    silent = true,
    noremap = true,
    nowait = true,
  })
end
