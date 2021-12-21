local lspconfig = require 'lspconfig'
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
  if vim.api.nvim_buf_get_name(bufnr):match '^%a+://' then
    return
  end

  local noremap = { noremap = true, silent = true }

  -- Set log level
  --    See `:lua vim.cmd('e'..vim.lsp.get_log_path())`
  vim.lsp.set_log_level 'info'

  -- Use LSP as the handler for omnifunc.
  --    See `:help omnifunc` and `:help ins-completion` for more information.
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Use LSP as the handler for formatexpr.
  --    See `:help formatexpr` for more information.
  vim.api.nvim_buf_set_option(bufnr, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')

  -- See `:help nvim_buf_set_keymap()` for more information
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']g', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', noremap)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[g', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', noremap)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lg', '<cmd>lua vim.diagnostic.setloclist()<CR>', noremap)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lq', '<cmd>lua vim.diagnostic.setqflist()<CR>', noremap)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', noremap)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', noremap)
  vim.api.nvim_buf_set_keymap(
    bufnr,
    'n',
    '<leader>lwl',
    '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
    noremap
  )
  vim.cmd [[command! -buffer LspDocumentDiagnostics lua vim.lsp.buf.document_diagnostic()]]
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ltg', '<cmd>Telescope lsp_document_diagnostics<CR>', noremap)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ltQ', '<cmd>Telescope lsp_workspace_diagnostics<CR>', noremap)

  if client.resolved_capabilities.document_formatting then
    vim.cmd [[command! -buffer LspFormat lua vim.lsp.buf.formatting()]]
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lf', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', noremap)
  end

  if client.resolved_capabilities.document_range_formatting then
    vim.cmd [[command! -buffer LspFormat lua vim.lsp.buf.formatting()]]
    vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>lf', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', noremap)
  end

  if client.resolved_capabilities.code_action then
    vim.cmd [[command! -buffer LspCodeAction lua vim.lsp.buf.code_action()]]
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', noremap)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lta', '<cmd>Telescope lsp_code_actions<CR>', noremap)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ltA', '<cmd>Telescope lsp_range_code_actions<CR>', noremap)
  end

  if client.resolved_capabilities.rename then
    vim.cmd [[command! -buffer LspRename lua vim.lsp.buf.rename()]]
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', noremap)
  end

  if client.resolved_capabilities.find_references then
    vim.cmd [[command! -buffer LspReferences lua vim.lsp.buf.references()]]
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ltr', '<cmd>Telescope lsp_references<CR>', noremap)
  end

  if client.resolved_capabilities.implementation then
    vim.cmd [[command! -buffer LspImplementation lua vim.lsp.buf.implementation()]]
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lti', '<cmd>Telescope lsp_implementations<CR>', noremap)
  end

  if client.resolved_capabilities.hover then
    vim.cmd [[command! -buffer LspHover lua vim.lsp.buf.hover()]]
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', noremap)
  end

  if client.resolved_capabilities.goto_definition then
    vim.cmd [[command! -buffer LspDefinition lua vim.lsp.buf.definition()]]
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', noremap)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ltd', '<cmd>Telescope lsp_definitions<CR>', noremap)
  end

  if client.resolved_capabilities.workspace_symbol then
    vim.cmd [[command! -buffer LspWorkspaceSymbol lua vim.lsp.buf.workspace_symbol()]]
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ltS', '<cmd>Telescope lsp_workspace_symbols<CR>', noremap)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ltg', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>', noremap)
  end

  if client.resolved_capabilities.document_symbol then
    vim.cmd [[command! -buffer LspDocumentSymbol lua vim.lsp.buf.document_symbol()]]
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lts', '<cmd>Telescope lsp_document_symbols<CR>', noremap)
  end

  if client.resolved_capabilities.type_definition then
    vim.cmd [[command! -buffer LspTypeDefinition lua vim.lsp.buf.type_definition()]]
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ltt', '<cmd>Telescope lsp_type_definitions<CR>', noremap)
  end

  if client.resolved_capabilities.declaration then
    vim.cmd [[command! -buffer LspDeclaration lua vim.lsp.buf.declaration()]]
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', noremap)
  end

  -- You will likely want to reduce updatetime which affects CursorHold
  -- note: this setting is global and should be set only once
  vim.o.updatetime = 250
  -- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})]]
  -- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_position_diagnostics({focusable=false})]]

  if client.resolved_capabilities.document_highlight then
    vim.cmd [[autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()]]
    vim.cmd [[autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]]
    vim.cmd [[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]]
  end

  if client.resolved_capabilities.signature_help then
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', noremap)
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

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  -- virtual_text = {
  --   source = "always",  -- Or "if_many"
  -- },
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
})

vim.diagnostic.config {
  float = {
    source = 'always',
  },
}

local signs = { Error = '', Warn = '', Hint = '', Info = '' }
-- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

lspconfig.terraformls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.dotls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.pylsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    pylsp = {
      plugins = {
        flake8 = { enabled = true },
      },
    },
  },
}

lspconfig.yamlls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    yaml = {
      validate = true,
      hover = true,
      completion = true,
      format = {
        enable = true,
      },
      schemaStore = {
        enable = true,
        url = 'https://www.schemastore.org/api/json/catalog.json',
      },
      schemas = {
        kubernetes = {
          'kubectl-edit-*.yaml',
          'daemon.{yml,yaml}',
          'manager.{yml,yaml}',
          'restapi.{yml,yaml}',
          'role.{yml,yaml}',
          'role_binding.{yml,yaml}',
          '*onfigma*.{yml,yaml}',
          '*ngres*.{yml,yaml}',
          '*ecre*.{yml,yaml}',
          '*eployment*.{yml,yaml}',
          '*ervic*.{yml,yaml}',
          'kubectl-edit*.yaml',
        },
        ['https://json.schemastore.org/ansible-role-2.9.json'] = 'roles/**/{yml,yaml}',
        ['https://json.schemastore.org/ansible-playbook.json'] = 'playbook*.{yml,yaml}',
        ['https://json.schemastore.org/dependabot-2.0'] = '.github/dependabot.{yml,yaml}',
        ['https://json.schemastore.org/github-workflow'] = '.github/workflows/*.{yml,yaml}',
        ['https://json.schemastore.org/github-action'] = '.github/**/action.{yml,yaml}',
        ['https://json.schemastore.org/circleciconfig'] = '.circleci/**/*.{yml,yaml}',
        ['https://json.schemastore.org/gitlab-ci.json'] = {
          'gitlab-ci.{yml,yaml}',
          'gitlab-ci-templates/**/*.{yml,yaml}',
        },
      },
    },
  },
}

local shfmt = require 'lsp.diagnosticls.formatters.shfmt'
local shellcheck = require 'lsp.diagnosticls.linters.shellcheck'
local yamllint = require 'lsp.diagnosticls.linters.yamllint'

lspconfig.diagnosticls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'sh', 'yaml', 'lua' },
  init_options = {
    filetypes = {
      sh = 'shellcheck',
      yaml = 'yamllint',
    },
    formatFiletypes = {
      sh = 'shfmt',
      lua = 'stylua',
    },
    formatters = {
      shfmt = shfmt,
      stylua = {
        rootPatterns = { '.git' },
        command = 'stylua',
        args = { '-' },
      },
    },
    linters = {
      shellcheck = shellcheck,
      yamllint = yamllint,
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
  on_attach = on_attach,
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
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    ansible = {
      ansibleLint = {
        enabled = false,
      },
    },
  },
}

lspconfig.tflint.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
