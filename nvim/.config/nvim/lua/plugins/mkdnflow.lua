return {
  "jakewvincent/mkdnflow.nvim",
  ft = "markdown",
  opts = {
    modules = {
      bib = false,
      buffers = false,
      conceal = false,
      cursor = false,
      folds = false,
      links = true,
      lists = true,
      maps = true,
      paths = true,
      tables = true,
      yaml = false,
    },
    links = {
      style = "wiki",
      name_is_source = true,
    },
    to_do = {
      symbols = { " ", "-", "x" },
      not_started = " ",
      in_progress = "-",
      complete = "x",
    },
  },
}
