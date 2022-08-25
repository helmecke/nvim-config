local success, lspconfig = pcall(require, 'lspconfig')
if not success then
  return
end

local util = require 'lspconfig.util'

local custom_init = function(client)
  client.config.flags = client.config.flags or {}
  client.config.flags.allow_incremental_sync = true
end

local custom_exit = function(_, bufnr)
  vim.schedule(function()
    vim.api.nvim_create_augroup(('_lsp_formatting_%d'):format(bufnr), { clear = true })
    vim.api.nvim_create_augroup(('_lsp_imports_%d'):format(bufnr), { clear = true })
    vim.api.nvim_create_augroup(('_lsp_highlight_%d'):format(bufnr), { clear = true })
    vim.api.nvim_create_augroup(('_lsp_codelens_%d'):format(bufnr), { clear = true })
  end)
end

local custom_attach = function(client, bufnr)
  if vim.api.nvim_buf_get_name(bufnr):match '^%a+://' then
    return
  end

  if vim.bo[bufnr].filetype == 'yaml.helm' then
    vim.diagnostic.disable()
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

  vim.keymap.set('n', ']g', vim.diagnostic.goto_next, { desc = 'Next diagnostic', buffer = bufnr })
  vim.keymap.set('n', '[g', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic', buffer = bufnr })
  vim.keymap.set('n', '<leader>lq', vim.diagnostic.setqflist, { desc = 'Diagnostics', buffer = bufnr })

  if client.server_capabilities.hoverProvider then
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
  end

  if client.server_capabilities.signatureHelpProvider then
    vim.keymap.set('n', '<c-k>', vim.lsp.buf.signature_help, { buffer = bufnr })

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

  if client.server_capabilities.definitionProvider then
    vim.api.nvim_buf_set_option(bufnr, 'tagfunc', 'v:lua.vim.lsp.tagfunc')
    vim.keymap.set('n', '<c-]>', vim.lsp.buf.definition, { buffer = bufnr })
  end

  if client.server_capabilities.implementationProvider then
    vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation, { desc = 'implementations', buffer = bufnr })
  end

  if client.server_capabilities.declarationProvider then
    vim.keymap.set('n', 'gd', vim.lsp.buf.declaration, { buffer = bufnr })
  end

  if client.server_capabilities.typeDefinitionProvider then
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { desc = 'Definition of the type', buffer = bufnr })
  end

  if client.server_capabilities.documentSymbolProvider then
    vim.keymap.set('n', '<leader>ls', vim.lsp.buf.document_symbol, { desc = 'document symbols', buffer = bufnr })
  end

  -- ['textDocument/prepareCallHierarchy'] = { 'callHierarchyProvider' },

  if client.server_capabilities.renameProvider then
    vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { desc = 'rename', buffer = bufnr })
  end

  -- ['textDocument/prepareRename'] = { 'renameProvider', 'prepareProvider' },

  if client.server_capabilities.codeActionProvider then
    vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { desc = 'code action', buffer = bufnr })
    vim.keymap.set('v', '<leader>la', vim.lsp.buf.range_code_action, { desc = 'code action', buffer = bufnr })
  end

  if client.server_capabilities.codeLensProvider then
    vim.keymap.set('n', '<leader>lcd', vim.lsp.codelens.display, { desc = 'display', buffer = bufnr })
    vim.keymap.set('n', '<leader>lcr', vim.lsp.codelens.run, { desc = 'run', buffer = bufnr })

    local group = vim.api.nvim_create_augroup(('_lsp_codelens_%d'):format(bufnr), { clear = true })
    vim.api.nvim_create_autocmd(
      { 'BufEnter', 'CursorHold', 'InsertLeave' },
      { callback = vim.lsp.codelens.refresh, group = group, buffer = bufnr }
    )
  end

  -- ['codeLens/resolve'] = { 'codeLensProvider', 'resolveProvider' },

  -- ['workspace/executeCommand'] = { 'executeCommandProvider' },

  if client.server_capabilities.workspaceSymbolProvider then
    vim.keymap.set('n', '<leader>lS', vim.lsp.buf.workspace_symbol, { desc = 'workspace symbols', buffer = bufnr })
  end

  -- ['textDocument/references'] = { 'referencesProvider' },

  if client.server_capabilities.documentRangeFormattingProvider then
    vim.keymap.set('v', '<leader>lf', vim.lsp.buf.range_formatting, { desc = 'format', buffer = bufnr })
  end

  if client.server_capabilities.documentFormattingProvider then
    vim.keymap.set('n', '<leader>lf', vim.lsp.buf.formatting, { desc = 'format', buffer = bufnr })

    local group = vim.api.nvim_create_augroup(('_lsp_formatting_%d'):format(bufnr), { clear = true })
    vim.api.nvim_create_autocmd(
      'BufWritePre',
      { callback = vim.lsp.buf.formatting_sync, group = group, buffer = bufnr }
    )
  end

  -- ['textDocument/completion'] = { 'completionProvider' },

  if client.server_capabilities.documentHighlightProvider then
    local group = vim.api.nvim_create_augroup(('_lsp_highlight_%d'):format(bufnr), { clear = true })
    vim.api.nvim_create_autocmd(
      'CursorHold,CursorHoldI',
      { callback = vim.lsp.buf.document_highlight, group = group, buffer = bufnr }
    )
    vim.api.nvim_create_autocmd(
      'CursorMoved',
      { callback = vim.lsp.buf.clear_references, group = group, buffer = bufnr }
    )
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
  on_attach = function(client, bufnr)
    -- INFO: not yet supported https://github.com/hashicorp/terraform-ls/issues/857
    client.server_capabilities.signatureHelpProvider = false
    custom_attach(client, bufnr)
  end,
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
        ['https://raw.githubusercontent.com/ansible/schemas/main/f/ansible.json#/$defs/playbook'] = {
          'playbook*.{yml,yaml}',
          'converge.{yml,yaml}',
        },
        ['https://raw.githubusercontent.com/ansible/schemas/main/f/ansible.json#/$defs/tasks'] = '{tasks,handlers}/*.{yml,yaml}',
        ['https://raw.githubusercontent.com/ansible/schemas/main/f/ansible-requirements.json'] = 'requirements.{yml,yaml}',
        ['https://raw.githubusercontent.com/ansible/schemas/main/f/ansible-meta.json'] = 'meta/main.yml',
        ['https://raw.githubusercontent.com/ansible/schemas/main/f/ansible-vars.json'] = '{playbooks/vars/,vars/,defaults/,host_vars/,group_vars/}*.{yml,yaml}',
        ['https://raw.githubusercontent.com/ansible/schemas/main/f/molecule.json'] = 'molecule/*/molecule.{yml,yaml}',
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
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    custom_attach(client, bufnr)
  end,
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
  root_dir = util.root_pattern('ansible.cfg', '.ansible-lint', 'group_vars', 'host_vars'),
}

lspconfig.tflint.setup {
  on_init = custom_init,
  on_attach = custom_attach,
  on_exit = custom_exit,
  capabilities = capabilities,
}

lspconfig.gopls.setup {
  on_init = custom_init,
  on_attach = function(client, bufnr)
    client.server_capabilities.codeLensProvider = true
    client.resolved_capabilities.code_lens = true
    custom_attach(client, bufnr)
  end,
  on_exit = custom_exit,
  capabilities = capabilities,
  settings = {
    gopls = {
      gofumpt = true,
    },
  },
}

lspconfig.golangci_lint_ls.setup {}

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
    null_ls.builtins.formatting.stylua,
  },
}
