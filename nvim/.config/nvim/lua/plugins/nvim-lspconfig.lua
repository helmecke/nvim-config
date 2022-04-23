local success, lspconfig = pcall(require, 'lspconfig')
if not success then
  return
end

local util = require 'lspconfig.util'

local custom_init = function(client)
  client.config.flags = client.config.flags or {}
  client.config.flags.allow_incremental_sync = true
end

local custom_exit = function(_, _)
  vim.schedule(function()
    vim.api.nvim_create_augroup('lsp_document_formatting', { clear = true })
    vim.api.nvim_create_augroup('lsp_document_highlight', { clear = true })
  end)
end

local custom_attach = function(client, bufnr)
  if vim.api.nvim_buf_get_name(bufnr):match '^%a+://' then
    return
  end

  -- Set log level
  --    See `:lua vim.cmd('e'..vim.lsp.get_log_path())`
  vim.lsp.set_log_level 'info'

  -- Use LSP as the handler for omnifunc.
  --    See `:help omnifunc` and `:help ins-completion` for more information.
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Use LSP as the handler for formatexpr.
  --    See `:help formatexpr` for more information.
  vim.api.nvim_buf_set_option(bufnr, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')

  vim.keymap.set('n', '<leader>ls', '<cmd>LspStop<cr>', { buffer = bufnr, desc = 'stop' })
  vim.keymap.set('n', ']g', '<cmd>lua vim.diagnostic.goto_next()<CR>', { buffer = bufnr })
  vim.keymap.set('n', '[g', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { buffer = bufnr })
  vim.keymap.set('n', '<leader>lg', '<cmd>lua vim.diagnostic.setloclist()<CR>', { buffer = bufnr })
  vim.keymap.set('n', '<leader>lq', '<cmd>lua vim.diagnostic.setqflist()<CR>', { buffer = bufnr })
  vim.keymap.set('n', '<leader>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', { buffer = bufnr })
  vim.keymap.set('n', '<leader>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', { buffer = bufnr })
  vim.keymap.set(
    'n',
    '<leader>lwl',
    '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
    { buffer = bufnr }
  )
  vim.cmd [[command! -buffer LspDocumentDiagnostics lua vim.lsp.buf.document_diagnostic()]]
  vim.keymap.set('n', '<leader>ltg', '<cmd>Telescope diagnostics<CR>', { buffer = bufnr })

  if client.resolved_capabilities.document_formatting then
    vim.cmd [[command! -buffer LspFormat lua vim.lsp.buf.formatting()]]
    vim.keymap.set('n', '<leader>lf', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', { buffer = bufnr })
    local group = vim.api.nvim_create_augroup('lsp_document_formatting', { clear = true })
    vim.api.nvim_create_autocmd(
      'BufWritePost',
      { command = 'lua vim.lsp.buf.formatting_sync()', group = group, buffer = 0 }
    )
  end

  if client.resolved_capabilities.document_range_formatting then
    vim.cmd [[command! -buffer LspFormat lua vim.lsp.buf.formatting()]]
    vim.keymap.set('v', '<leader>lf', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', { buffer = bufnr })
  end

  if client.resolved_capabilities.code_action then
    vim.cmd [[command! -buffer LspCodeAction lua vim.lsp.buf.code_action()]]
    vim.keymap.set('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', { buffer = bufnr })
    vim.keymap.set('n', '<leader>lta', '<cmd>Telescope lsp_code_actions<CR>', { buffer = bufnr })
    vim.keymap.set('n', '<leader>ltA', '<cmd>Telescope lsp_range_code_actions<CR>', { buffer = bufnr })
  end

  if client.resolved_capabilities.rename then
    vim.cmd [[command! -buffer LspRename lua vim.lsp.buf.rename()]]
    vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', { buffer = bufnr })
  end

  if client.resolved_capabilities.find_references then
    vim.cmd [[command! -buffer LspReferences lua vim.lsp.buf.references()]]
    vim.keymap.set('n', '<leader>ltr', '<cmd>Telescope lsp_references<CR>', { buffer = bufnr })
  end

  if client.resolved_capabilities.implementation then
    vim.cmd [[command! -buffer LspImplementation lua vim.lsp.buf.implementation()]]
    vim.keymap.set('n', '<leader>lti', '<cmd>Telescope lsp_implementations<CR>', { buffer = bufnr })
  end

  if client.resolved_capabilities.hover then
    vim.cmd [[command! -buffer LspHover lua vim.lsp.buf.hover()]]
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { buffer = bufnr })
  end

  if client.resolved_capabilities.goto_definition then
    vim.cmd [[command! -buffer LspDefinition lua vim.lsp.buf.definition()]]
    vim.keymap.set('n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', { buffer = bufnr })
    vim.keymap.set('n', '<leader>ltd', '<cmd>Telescope lsp_definitions<CR>', { buffer = bufnr })
  end

  if client.resolved_capabilities.workspace_symbol then
    vim.cmd [[command! -buffer LspWorkspaceSymbol lua vim.lsp.buf.workspace_symbol()]]
    vim.keymap.set('n', '<leader>ltS', '<cmd>Telescope lsp_workspace_symbols<CR>', { buffer = bufnr })
    vim.keymap.set('n', '<leader>ltw', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>', { buffer = bufnr })
  end

  if client.resolved_capabilities.document_symbol then
    vim.cmd [[command! -buffer LspDocumentSymbol lua vim.lsp.buf.document_symbol()]]
    vim.keymap.set('n', '<leader>lts', '<cmd>Telescope lsp_document_symbols<CR>', { buffer = bufnr })
  end

  if client.resolved_capabilities.type_definition then
    vim.cmd [[command! -buffer LspTypeDefinition lua vim.lsp.buf.type_definition()]]
    vim.keymap.set('n', '<leader>ltt', '<cmd>Telescope lsp_type_definitions<CR>', { buffer = bufnr })
  end

  if client.resolved_capabilities.declaration then
    vim.cmd [[command! -buffer LspDeclaration lua vim.lsp.buf.declaration()]]
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { buffer = bufnr })
  end

  -- You will likely want to reduce updatetime which affects CursorHold
  -- note: this setting is global and should be set only once
  vim.o.updatetime = 250
  -- vim.cmd [[
  --         augroup lsp_diagnostics
  --             autocmd! * <buffer>
  --             autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float()
  --         augroup END
  --     ]]

  if client.resolved_capabilities.document_highlight then
    local group = vim.api.nvim_create_augroup('lsp_document_highlight', { clear = true })
    vim.api.nvim_create_autocmd(
      'CursorHold,CursorHoldI',
      { command = 'lua vim.lsp.buf.document_highlight()', group = group, buffer = 0 }
    )
    vim.api.nvim_create_autocmd(
      'CursorMoved',
      { command = 'lua vim.lsp.buf.clear_references()', group = group, buffer = 0 }
    )
  end

  if client.resolved_capabilities.signature_help then
    vim.keymap.set('n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { buffer = bufnr })
    -- vim.cmd([[autocmd CursorHoldI <buffer> silent! lua vim.lsp.buf.signature_help()]])
    require('lsp_signature').setup {}
    require('lsp_signature').on_attach {
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      handler_opts = {
        border = 'none',
      },
      hint_enable = false,
      hi_parameter = 'DiagnosticUnderlineWarn',
      toggle_key = '<c-k>',
    }
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

vim.diagnostic.config {
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
  float = {
    source = 'always',
    focusable = false,
    header = '',
  },
}

local signs = { Error = '', Warn = '', Hint = '', Info = '' }
-- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

lspconfig.terraformls.setup {
  on_init = custom_init,
  on_attach = custom_attach,
  on_exit = custom_exit,
  capabilities = capabilities,
}

lspconfig.gopls.setup {
  on_init = custom_init,
  on_attach = custom_attach,
  on_exit = custom_exit,
  capabilities = capabilities,
}

lspconfig.dotls.setup {
  on_init = custom_init,
  on_attach = custom_attach,
  on_exit = custom_exit,
  capabilities = capabilities,
}

lspconfig.pylsp.setup {
  on_init = custom_init,
  on_attach = custom_attach,
  on_exit = custom_exit,
  capabilities = capabilities,
  settings = {
    pylsp = {
      configurationSources = { 'flake8' },
      plugins = {
        jedi_completion = {
          include_params = true,
          enabled = true,
        },
        flake8 = { enabled = true },
        autopep8 = { enabled = false },
        yapf = { enabled = false },
        pyflakes = { enabled = false },
        pycodestyle = { enabled = false },
      },
    },
  },
}

lspconfig.yamlls.setup {
  on_init = custom_init,
  on_attach = custom_attach,
  on_exit = custom_exit,
  capabilities = capabilities,
  settings = {
    yaml = {
      schemas = {
        kubernetes = {
          '/tmp/kubectl-edit-*.yaml',
        },
        ['https://json.schemastore.org/ansible-role-2.9.json'] = {
          'roles/**/*.{yml,yaml}',
          'de.hacon.hafas.ansible.roles.*/**/*.{yml,yaml}',
        },
        ['https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible-playbook.json'] = 'playbook*.{yml,yaml}',
        ['https://json.schemastore.org/dependabot-2.0'] = '.github/dependabot.{yml,yaml}',
        ['https://json.schemastore.org/github-workflow'] = '.github/workflows/*.{yml,yaml}',
        ['https://json.schemastore.org/github-action'] = '.github/**/action.{yml,yaml}',
        ['https://json.schemastore.org/circleciconfig'] = '.circleci/**/*.{yml,yaml}',
        ['https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json'] = {
          'gitlab-ci.{yml,yaml}',
          'gitlab-ci-templates/**/*.{yml,yaml}',
        },
        ['https://json.schemastore.org/chart.json'] = '**/Chart.yaml',
      },
    },
  },
}

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = '/usr/share/lua-language-server'
local sumneko_binary = '/usr/bin/lua-language-server'

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

require('lspconfig').sumneko_lua.setup {
  on_init = custom_init,
  on_attach = custom_attach,
  on_exit = custom_exit,
  capabilities = capabilities,
  cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim', 'describe', 'use', 'awesome', 'client', 'root' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          -- vim.api.nvim_get_runtime_file('', true),
          ['/usr/share/nvim/runtime/lua'] = true,
          ['/usr/share/nvim/runtime/lua/lsp'] = true,
          ['/usr/share/awesome/lib'] = true,
        },
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

lspconfig.ansiblels.setup {
  on_init = custom_init,
  on_attach = custom_attach,
  on_exit = custom_exit,
  capabilities = capabilities,
  filetypes = { 'yaml.ansible' },
  root_dir = util.root_pattern('ansible.cfg', '.ansible-lint', 'group_vars'),
}

lspconfig.tflint.setup {
  on_init = custom_init,
  on_attach = custom_attach,
  on_exit = custom_exit,
  capabilities = capabilities,
}

lspconfig.gopls.setup {
  on_init = custom_init,
  on_attach = custom_attach,
  on_exit = custom_exit,
  capabilities = capabilities,
}

local null_ls = require 'null-ls'

null_ls.setup {
  on_init = custom_init,
  on_attach = custom_attach,
  on_exit = custom_exit,
  capabilities = capabilities,
  sources = {
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.code_actions.shellcheck,
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.diagnostics.yamllint,
  },
}
