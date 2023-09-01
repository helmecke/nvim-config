return {
  "iamcco/markdown-preview.nvim",
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  ft = "markdown",
  cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
  config = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
}
