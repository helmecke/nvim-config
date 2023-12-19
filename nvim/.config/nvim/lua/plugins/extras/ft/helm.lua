return {
  {
    "towolf/vim-helm",
    ft = "helm",
  },
  -- correctly setup lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- make sure mason installs the server
      servers = {
        helm_ls = {
          settings = {
            yamlls = {
              path = "yaml-language-server",
              config = {
                keyOrdering = false,
                hover = true,
                completion = true,
                format = {
                  enable = true,
                },
                validate = true,
              },
            },
          },
        },
      },
    },
  },
}
