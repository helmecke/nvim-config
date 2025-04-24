return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        python = {
          -- To fix auto-fixable lint errors.
          "ruff_fix",
          -- To organize the imports.
          "ruff_organize_imports",
          -- To run the Ruff formatter.
          "ruff_format",
        },
      },
    },
  },
}
