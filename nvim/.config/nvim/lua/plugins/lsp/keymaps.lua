local M = {}

function M.on_attach(client, buffer)
  local Util = require("util")

  ---@param keys string
  ---@param func any
  ---@param desc string
  local nmap = function(keys, func, desc)
    vim.keymap.set("n", keys, func, { buffer = buffer, desc = desc })
  end

  -- diagnostic
  nmap("]d", vim.diagnostic.goto_next, "Next diagnostic")
  nmap("[d", vim.diagnostic.goto_prev, "Previous diagnostic")
  nmap("<leader>cd", vim.diagnostic.open_float, "Line Diagnostics")

  -- lsp
  nmap("<leader>cl", "<cmd>LspInfo<cr>", "Lsp Info")

  if client.supports_method("textDocument/rename") then
    nmap("<leader>cr", vim.lsp.buf.rename, "Rename")
  end

  if client.supports_method("textDocument/codeAction") then
    nmap("<leader>ca", vim.lsp.buf.code_action, "Code action")
  end

  nmap("<leader>cA", function()
    vim.lsp.buf.code_action({ context = { only = { "source" }, diagnostics = {} } })
  end, "Source Action")

  if client.supports_method("textDocument/declaration") then
    nmap("gD", vim.lsp.buf.declaration, "Goto Declaration")
  end

  -- See `:help K` for why this keymap
  if client.supports_method("textDocument/hover") then
    -- TODO: Remove mapping after dropping support for Neovim v0.9, it's automatic
    if vim.fn.has("nvim-0.10") == 0 then
      nmap("K", vim.lsp.buf.hover, "Hover Documentation")
    end
  end
  if client.supports_method("textDocument/signatureHelp") then
    nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
  end

  if client.supports_method("textDocument/formatting") then
    nmap("<leader>cf", vim.lsp.buf.format, "Format Document")
  end

  -- telescope
  if Util.has("telescope.nvim") then
    if client.supports_method("textDocument/references") then
      nmap("gr", require("telescope.builtin").lsp_references, "References")
    end
    if client.supports_method("textDocument/definition") then
      nmap("gd", function()
        require("telescope.builtin").lsp_definitions({ reuse_win = true })
      end, "Goto definition")
    end
    if client.supports_method("textDocument/implementation") then
      nmap("gI", function()
        require("telescope.builtin").lsp_implementations({ reuse_win = true })
      end, "Goto implementation")
    end
    if client.supports_method("textDocument/typeDefinition") then
      nmap("gy", function()
        require("telescope.builtin").lsp_type_definitions({ reuse_win = true })
      end, "Goto type definition")
    end
  else
    if client.supports_method("textDocument/references") then
      nmap("gr", vim.lsp.buf.references(), "References")
    end
    if client.supports_method("textDocument/definition") then
      nmap("gd", vim.lsp.buf.definition, "Goto definition")
    end
    if client.supports_method("textDocument/implementation") then
      nmap("gI", vim.lsp.buf.implementation, "Goto implementation")
    end
    if client.supports_method("textDocument/typeDefinition") then
      nmap("gy", vim.lsp.buf.type_definition, "Goto Type definition")
    end
  end
end

return M
