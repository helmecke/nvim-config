local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  { 'folke/lazy.nvim', tag = 'stable' },
  'lewis6991/impatient.nvim',
  {
    'helmecke/onedark.nvim',
    priority = 1000,
    config = function()
      vim.cmd 'colorscheme onedark'
    end,
  },
  {
    'tpope/vim-fugitive',
    tag = 'v3.7',
    config = function()
      require 'plugin.fugitive' -- ./fugitive.lua
    end,
    dependencies = {
      'tpope/vim-rhubarb',
      {
        'shumphrey/fugitive-gitlab.vim',
        config = function()
          require 'plugin.fugitive-gitlab' -- ./fugitive-gitlab.lua
        end,
      },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require 'plugin.treesitter' -- ./treesitter.lua
    end,
    dependencies = {
      'nvim-treesitter/playground',
    },
  },
  {
    'moll/vim-bbye',
    config = function()
      require 'plugin.bbye' -- ./bbye.lua
    end,
  },
  {
    'nvim-tree/nvim-tree.lua',
    enabled = false,
    config = function()
      require 'plugin.nvim-tree' -- ./nvim-tree.lua
    end,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      require 'plugin.nvim-lspconfig' -- ./nvim-lspconfig.lua
    end,
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'hrsh7th/nvim-cmp',
    commit = '1cad30f', -- https://github.com/hrsh7th/nvim-cmp/pull/1563
    config = function()
      require 'plugin.nvim-cmp' -- ./nvim-cmp.lua
    end,
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'f3fora/cmp-spell',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind-nvim',
    },
  },
  {
    'L3MON4D3/LuaSnip',
    config = function()
      require 'plugin.luasnip' -- ./luasnip.lua
    end,
    dependencies = 'rafamadriz/friendly-snippets',
  },
  {
    'nvim-telescope/telescope.nvim',
    config = function()
      require 'plugin.telescope' -- ./telescope.lua
    end,
    dependencies = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-github.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      'helmecke/telescope-git-worktree.nvim',
      {
        'helmecke/telescope-ghq.nvim',
        branch = 'refactor',
      },
    },
  },
  {
    'princejoogie/dir-telescope.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
      require 'plugin.telescope-dir' -- ./telescope-dir.lua
    end,
  },
  {
    'iamcco/markdown-preview.nvim',
    init = function()
      require 'plugin.markdown-preview' -- ./markdown-preview.lua
    end,
    build = 'cd app & npm install',
    ft = { 'markdown', 'vimwiki' },
  },
  {
    'rest-nvim/rest.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require 'plugin.rest' -- ./rest.lua
    end,
  },
  {
    'windwp/nvim-autopairs',
    config = function()
      require 'plugin.nvim-autopairs' -- ./nvim-autopairs.lua
    end,
    dependencies = { 'nvim-cmp' },
  },
  {
    'akinsho/nvim-bufferline.lua',
    config = function()
      require 'plugin.nvim-bufferline' -- ./nvim-bufferline.lua
    end,
    dependencies = 'nvim-tree/nvim-web-devicons',
  },
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require 'plugin.lualine' -- ./lualine.lua
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require 'plugin.nvim-colorizer' -- ./nvim-colorizer.lua
    end,
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },
  {
    'folke/which-key.nvim',
    config = function()
      require 'plugin.which-key' -- ./which-key.lua
    end,
  },
  {
    'folke/zen-mode.nvim',
    config = function()
      require 'plugin.zen-mode' -- ./zen-mode.lua
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup {
        buftype_exclude = { 'terminal' },
        filetype_exclude = { 'help', 'packer', 'NvimTree', 'alpha', 'norg' },
        show_current_context = true,
        show_first_indent_level = false,
      }
    end,
  },
  {
    'ray-x/lsp_signature.nvim',
  },
  {
    'lewis6991/gitsigns.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require 'plugin.gitsigns' -- ./gitsigns.lua
    end,
  },
  {
    'folke/todo-comments.nvim',
    config = function()
      require 'plugin.todo-comments' -- ./todo-comments.lua
    end,
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
  {
    'stevearc/qf_helper.nvim',
    config = function()
      require 'plugin.qf_helper' -- ./qf_helper.lua
    end,
  },
  {
    'anuvyklack/pretty-fold.nvim',
    config = function()
      require('pretty-fold').setup {}
    end,
  },
  {
    'mickael-menu/zk-nvim',
    enabled = false,
    config = function()
      require 'plugin.zk-nvim' -- ./zk-nvim.lua
    end,
  },
  {
    'Shatur/neovim-session-manager',
    enabled = false,
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require 'plugin.session-manager' -- ./session-manager.lua
    end,
  },
  -- bug in CursorHold and CursorHoldI https://github.com/neovim/neovim/issues/12587
  'antoinemadec/FixCursorHold.nvim',
  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end,
  },
  {
    'kylechui/nvim-surround',
    config = function()
      require('nvim-surround').setup {
        keymaps = {
          insert = '<C-g>r',
          insert_line = '<C-g>R',
          normal = 'yr',
          normal_cur = 'yrr',
          normal_line = 'yR',
          normal_cur_line = 'yRR',
          visual = 'R',
          visual_line = 'gR',
          delete = 'dr',
          change = 'cr',
        },
      }
    end,
  },
  {
    'junegunn/vim-easy-align',
    config = function()
      require 'plugin.vim-easy-align' -- ./vim-easy-align.lua
    end,
  },
  {
    'williamboman/mason.nvim',
    build = ':MasonUpdate',
    config = function()
      require('mason').setup()
    end,
  },
  {
    'nvim-neorg/neorg',
    build = ':Neorg sync-parsers',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-neorg/neorg-telescope',
    },
    config = function()
      require 'plugin.neorg' -- ./neorg.lua
    end,
  },
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require 'plugin.oil' -- ./oil.lua
    end,
  },
}
