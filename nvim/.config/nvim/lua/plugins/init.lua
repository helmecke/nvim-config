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
  use {
    'helmecke/onedark.nvim',
    config = function()
      vim.cmd 'colorscheme onedark'
    end,
  }
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tjdevries/nlua.nvim'
  use 'google/vim-jsonnet'
  use {
    'tpope/vim-fugitive',
    config = [[require'plugins.fugitive']], -- ./fugitive.lua
    requires = {
      'tpope/vim-rhubarb',
      {
        'shumphrey/fugitive-gitlab.vim',
        config = [[require'plugins.fugitive-gitlab']], -- ./fugitive-gitlab.lua
      },
    },
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = [[require'plugins.treesitter']], -- ./treesitter.lua
    requires = {
      'nvim-treesitter/playground',
    },
  }
  use {
    'moll/vim-bbye',
    config = [[require'plugins.bbye']], -- ./bbye.lua
  }
  use {
    'kyazdani42/nvim-tree.lua',
    config = [[require'plugins.nvim-tree']], -- ./nvim-tree.lua
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
  }
  use {
    'neovim/nvim-lspconfig',
    config = [[require'plugins.nvim-lspconfig']], -- ./nvim-lspconfig.lua
    after = 'nvim-cmp',
  }
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }
  use {
    'hrsh7th/nvim-cmp',
    config = [[require'plugins.nvim-cmp']], -- ./nvim-cmp.lua
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
    config = [[require'plugins.luasnip']], -- ./luasnip.lua
    requires = 'rafamadriz/friendly-snippets',
  }
  use {
    'stevearc/vim-arduino',
    setup = [[require'plugins.vim-arduino']], -- ./vim-arduino.lua
    ft = 'arduino',
  }
  use {
    'nvim-telescope/telescope.nvim',
    config = [[require'plugins.telescope']], -- ./telescope.lua
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-github.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
      'helmecke/telescope-git-worktree.nvim',
      {
        'helmecke/telescope-ghq.nvim',
        branch = 'refactor',
      },
    },
  }
  use {
    'hkupty/iron.nvim',
    config = [[require'plugins.iron']], -- ./iron.lua
  }
  use {
    disable = true,
    'vimwiki/vimwiki',
    config = [[require'plugins.vimwiki']], -- ./vimwiki.lua
  }
  use { disable = true, 'npxbr/glow.nvim', cmd = 'Glow', ft = { 'markdown', 'vimwiki' } }
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app & yarn install',
    ft = { 'markdown', 'vimwiki' },
    cmd = 'MarkdownPreview',
  }
  use {
    'tpope/vim-dadbod',
    requires = {
      'kristijanhusak/vim-dadbod-completion',
      {
        'kristijanhusak/vim-dadbod-ui',
        config = [[require'plugins.vim-dadbod-ui']], -- ./vim-dadbod-ui.lua
      },
    },
  }
  use {
    'NTBBloodbath/rest.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = [[require'plugins.rest']], -- ./rest.lua
  }
  use {
    'windwp/nvim-autopairs',
    config = [[require'plugins.nvim-autopairs']], -- ./nvim-autopairs.lua
    requires = { 'nvim-cmp' },
  }
  use {
    'akinsho/nvim-bufferline.lua',
    config = [[require'plugins.nvim-bufferline']], -- ./nvim-bufferline.lua
    requires = 'kyazdani42/nvim-web-devicons',
  }
  use {
    'nvim-lualine/lualine.nvim',
    config = [[require'plugins.lualine']], -- ./lualine.lua
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }
  use { 'Glench/Vim-Jinja2-Syntax', ft = { 'jinja' } }
  use {
    'norcalli/nvim-colorizer.lua',
    config = [[require'plugins.nvim-colorizer']], -- ./nvim-colorizer.lua
  }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  }
  use {
    'folke/which-key.nvim',
    config = [[require'plugins.which-key']], -- ./which-key.lua
  }
  use {
    'folke/zen-mode.nvim',
    config = [[require'plugins.zen-mode']], -- ./zen-mode.lua
  }
  use {
    disable = true,
    'vhyrro/neorg',
    branch = 'main',
    config = [[require'plugins.neorg']], -- ./neorg.lua
    requires = {
      'nvim-lua/plenary.nvim',
      'vhyrro/neorg-telescope',
    },
    after = 'nvim-treesitter',
  }
  use {
    'will133/vim-dirdiff',
    opt = true,
    cmd = { 'DirDiff' },
  }
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup {
        buftype_exclude = { 'terminal' },
        filetype_exclude = { 'help', 'packer', 'NvimTree' },
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
    config = [[require'plugins.gitsigns']], -- ./gitsigns.lua
  }
  use {
    'folke/todo-comments.nvim',
    config = [[require'plugins.todo-comments']], -- ./todo-comments.lua
    requires = {
      'nvim-lua/plenary.nvim',
    },
  }
  use {
    'stevearc/qf_helper.nvim',
    config = [[require'plugins.qf_helper']], -- ./qf_helper.lua
  }
  use {
    'anuvyklack/pretty-fold.nvim',
    requires = {
      'anuvyklack/nvim-keymap-amend',
    },
    config = function()
      require('pretty-fold').setup {}
      require('pretty-fold.preview').setup()
    end,
  }
  use {
    'mickael-menu/zk-nvim',
    config = [[require'plugins.zk-nvim']], -- ./zk-nvim.lua
  }
  use {
    'rcarriga/vim-ultest',
    requires = { 'vim-test/vim-test' },
    opt = true,
    keys = { '<localleader>t' },
    cmd = {
      'TestNearest',
      'TestFile',
      'TestSuite',
      'TestLast',
      'TestVisit',
      'Ultest',
      'UltestNearest',
      'UltestDebug',
      'UltestLast',
      'UltestSummary',
    },
    module = 'ultest',
    run = ':UpdateRemotePlugins',
    config = function()
      require('config.test').setup()
    end,
  }
  use {
    'ray-x/go.nvim',
    config = function()
      require('go').setup()
    end,
  }
end)
