return {
  "CopilotC-Nvim/CopilotChat.nvim",
  opts = {
    model = "claude-3.5-sonnet",
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
  },
}
