local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
  if vim.fn.input 'Download Packer? (y for yes)' ~= 'y' then
    return
  end

  local directory = string.format('%s/site/pack/packer/opt/', vim.fn.stdpath 'data')

  vim.fn.mkdir(directory, 'p')

  local out = vim.fn.system(
    string.format('git clone %s %s', 'https://github.com/wbthomason/packer.nvim', directory .. '/packer.nvim')
  )

  print(out)
  print 'Downloading packer.nvim...'

  return
end

local packer = require 'packer'
local use = packer.use

return packer.startup(function()
  -- Packer can manage itself as an optional plugin
  use { 'wbthomason/packer.nvim', opt = true }
  use { 'lewis6991/impatient.nvim' }
  use {
    'helmecke/onedark.nvim',
    config = function()
      vim.cmd 'colorscheme onedark'
    end,
  }
  use {
    'tpope/vim-fugitive',
    tag = 'v3.7',
    config = [[require'plugin.fugitive']], -- ./fugitive.lua
    requires = {
      'tpope/vim-rhubarb',
      {
        'shumphrey/fugitive-gitlab.vim',
        config = [[require'plugin.fugitive-gitlab']], -- ./fugitive-gitlab.lua
      },
    },
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = [[require'plugin.treesitter']], -- ./treesitter.lua
    requires = {
      'nvim-treesitter/playground',
    },
  }
  use {
    'moll/vim-bbye',
    config = [[require'plugin.bbye']], -- ./bbye.lua
  }
  use {
    'kyazdani42/nvim-tree.lua',
    config = [[require'plugin.nvim-tree']], -- ./nvim-tree.lua
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
  }
  use {
    'neovim/nvim-lspconfig',
    config = [[require'plugin.nvim-lspconfig']], -- ./nvim-lspconfig.lua
    after = 'nvim-cmp',
  }
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }
  use {
    'hrsh7th/nvim-cmp',
    config = [[require'plugin.nvim-cmp']], -- ./nvim-cmp.lua
    requires = {
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'f3fora/cmp-spell', after = 'nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      { 'onsails/lspkind-nvim' },
    },
  }
  use {
    'L3MON4D3/LuaSnip',
    config = [[require'plugin.luasnip']], -- ./luasnip.lua
    requires = 'rafamadriz/friendly-snippets',
  }
  use {
    'nvim-telescope/telescope.nvim',
    config = [[require'plugin.telescope']], -- ./telescope.lua
    requires = {
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
  }
  use {
    'iamcco/markdown-preview.nvim',
    setup = [[require'plugin.markdown-preview']], -- ./markdown-preview.lua
    run = 'cd app & npm install',
    ft = { 'markdown', 'vimwiki' },
  }
  use {
    'rest-nvim/rest.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = [[require'plugin.rest']], -- ./rest.lua
  }
  use {
    'windwp/nvim-autopairs',
    config = [[require'plugin.nvim-autopairs']], -- ./nvim-autopairs.lua
    requires = { 'nvim-cmp' },
  }
  use {
    'akinsho/nvim-bufferline.lua',
    config = [[require'plugin.nvim-bufferline']], -- ./nvim-bufferline.lua
    requires = 'kyazdani42/nvim-web-devicons',
  }
  use {
    'nvim-lualine/lualine.nvim',
    config = [[require'plugin.lualine']], -- ./lualine.lua
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }
  use {
    'norcalli/nvim-colorizer.lua',
    config = [[require'plugin.nvim-colorizer']], -- ./nvim-colorizer.lua
  }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  }
  use {
    'folke/which-key.nvim',
    config = [[require'plugin.which-key']], -- ./which-key.lua
  }
  use {
    'folke/zen-mode.nvim',
    config = [[require'plugin.zen-mode']], -- ./zen-mode.lua
  }
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup {
        buftype_exclude = { 'terminal' },
        filetype_exclude = { 'help', 'packer', 'NvimTree', 'alpha' },
        show_current_context = true,
        show_first_indent_level = false,
      }
    end,
  }
  use {
    'ray-x/lsp_signature.nvim',
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = [[require'plugin.gitsigns']], -- ./gitsigns.lua
  }
  use {
    'folke/todo-comments.nvim',
    config = [[require'plugin.todo-comments']], -- ./todo-comments.lua
    requires = {
      'nvim-lua/plenary.nvim',
    },
  }
  use {
    'stevearc/qf_helper.nvim',
    config = [[require'plugin.qf_helper']], -- ./qf_helper.lua
  }
  use {
    'anuvyklack/pretty-fold.nvim',
    config = function()
      require('pretty-fold').setup {}
    end,
  }
  use {
    'mickael-menu/zk-nvim',
    config = [[require'plugin.zk-nvim']], -- ./zk-nvim.lua
  }
  use {
    'Shatur/neovim-session-manager',
    requires = { 'nvim-lua/plenary.nvim' },
    config = [[require'plugin.session-manager']], -- ./session-manager.lua
  }
  -- bug in CursorHold and CursorHoldI https://github.com/neovim/neovim/issues/12587
  use 'antoinemadec/FixCursorHold.nvim'
  use {
    'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end,
  }
  use {
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
  }
end)
