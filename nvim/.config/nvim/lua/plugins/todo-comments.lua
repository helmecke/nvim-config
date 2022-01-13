require('todo-comments').setup {
  search = {
    command = 'rg',
    args = {
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--hidden',
    },
  },
  highlight = {
    before = '', -- "fg" or "bg" or empty
    keyword = 'fg', -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
    after = '', -- "fg" or "bg" or empty
  },
  colors = {
    error = { 'Todo', 'ErrorMsg', '#DC2626' },
    warning = { 'Todo', 'WarningMsg', '#FBBF24' },
    info = { 'Todo', '#2563EB' },
    hint = { 'Todo', '#10B981' },
    default = { 'Todo', '#7C3AED' },
  },
}
