local context = require("CopilotChat.context")
local utils = require("CopilotChat.utils")

return {
  "CopilotC-Nvim/CopilotChat.nvim",
  opts = {
    -- model = "claude-3.5-sonnet",
    mappings = {
      reset = {
        normal = "<C-x>",
        insert = "<C-x>",
      },
    },
    prompts = {
      Commit = {
        prompt = "> #git:staged\n\nWrite commit message for the change with conventional commits convention. Set the scope of the commit if possible. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.",
      },
    },
    contexts = {
      diagnostics = {
        description = "Includes diagnostics in chat context. Supports input (default document).",
        input = function(callback)
          vim.ui.select({ "document", "workspace" }, {
            prompt = "Select diff type> ",
          }, callback)
        end,
        resolve = function(input)
          input = input or "document"
          local diagnostics = {}
          -- Get diagnostics from all buffers
          local buf_diagnostics = vim.diagnostic.get()

          -- Format each diagnostic
          for _, diagnostic in ipairs(buf_diagnostics) do
            local severity = vim.diagnostic.severity[diagnostic.severity]
            local message = diagnostic.message
            local source = diagnostic.source or "LSP"
            local line = diagnostic.lnum + 1

            table.insert(diagnostics, string.format("[%s] %s: line %d - %s", severity, source, line, message))
          end
          return {
            content = table.concat(diagnostics, "\n"),
            filename = "DIAGNOSTICS_" .. string.upper(input),
            filetype = "diff",
          }
        end,
      },
    },
  },
}
