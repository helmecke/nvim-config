local M = {}

local function python_debugger(cmd)
  local non_modules = { 'python', 'pipenv', 'poetry' }
  local module_index = 1
  if vim.tbl_contains(non_modules, cmd[1]) then
    module_index = 3
  end
  local module = cmd[module_index]

  local args = vim.list_slice(cmd, module_index + 1)
  return {
    dap = {
      type = 'python',
      request = 'launch',
      module = module,
      args = args,
    },
  }
end

local function go_debugger(cmd)
  local args = {}
  for i = 3, #cmd - 1, 1 do
    local arg = cmd[i]
    if vim.startswith(arg, '-') then
      arg = '-test.' .. string.sub(arg, 2)
    end
    args[#args + 1] = arg
  end
  return {
    dap = {
      type = 'go',
      request = 'launch',
      mode = 'test',
      program = '${workspaceFolder}',
      dlvToolPath = vim.fn.exepath 'dlv',
      args = args,
    },
    parse_result = function(lines)
      return lines[#lines] == 'FAIL' and 1 or 0
    end,
  }
end

function M.setup()
  require('ultest').setup {
    builders = {
      ['python#pytest'] = python_debugger,
      ['python#pyunit'] = python_debugger,
      ['go#gotest'] = go_debugger,
      ['go#richgo'] = go_debugger,
    },
  }
  vim.g.ultest_use_pty = 1
  vim.g.preserve_screen = 1
  vim.g['test#strategy'] = 'neovim'
  vim.keymap.set('n', '[t', '<Plug>(ultest-prev-fail)', {})
  vim.keymap.set('n', ']t', '<Plug>(ultest-next-fail)', {})
  vim.keymap.set('n', '<localleader>tS', '<cmd>UltestSummary<cr>', {})
  vim.keymap.set('n', '<localleader>ta', '<cmd>Ultest<cr>', {})
  vim.keymap.set('n', '<localleader>td', '<cmd>UltestDebug<cr>', {})
  vim.keymap.set('n', '<localleader>to', '<cmd>UltestOutput<cr>', {})
  vim.keymap.set('n', '<localleader>tf', '<cmd>TestFile<cr>', {})
  vim.keymap.set('n', '<localleader>tl', '<cmd>TestLast<cr>', {})
  vim.keymap.set('n', '<localleader>tn', '<cmd>TestNearest<cr>', {})
  vim.keymap.set('n', '<localleader>ts', '<cmd>TestSuite<cr>', {})
  vim.keymap.set('n', '<localleader>tv', '<cmd>TestVisit<cr>', {})
end

return M
