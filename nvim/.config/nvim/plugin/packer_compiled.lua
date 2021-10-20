-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', { 'nvim-0.5' }) ~= 1 then
  vim.api.nvim_command 'echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"'
  return
end

vim.api.nvim_command 'packadd packer.nvim'

local no_errors, error_msg = pcall(function()
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end

  local function save_profiles(threshold)
    local sorted_times = {}
    for chunk_name, time_taken in pairs(profile_info) do
      sorted_times[#sorted_times + 1] = { chunk_name, time_taken }
    end
    table.sort(sorted_times, function(a, b)
      return a[2] > b[2]
    end)
    local results = {}
    for i, elem in ipairs(sorted_times) do
      if not threshold or threshold and elem[2] > threshold then
        results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
      end
    end

    _G._packer = _G._packer or {}
    _G._packer.profile_output = results
  end

  time([[Luarocks path setup]], true)
  local package_path_str =
    '/home/jahe/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/jahe/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/jahe/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/jahe/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua'
  local install_cpath_pattern = '/home/jahe/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so'
  if not string.find(package.path, package_path_str, 1, true) then
    package.path = package.path .. ';' .. package_path_str
  end

  if not string.find(package.cpath, install_cpath_pattern, 1, true) then
    package.cpath = package.cpath .. ';' .. install_cpath_pattern
  end

  time([[Luarocks path setup]], false)
  time([[try_loadstring definition]], true)
  local function try_loadstring(s, component, name)
    local success, result = pcall(loadstring(s))
    if not success then
      vim.schedule(function()
        vim.api.nvim_notify(
          'packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result,
          vim.log.levels.ERROR,
          {}
        )
      end)
    end
    return result
  end

  time([[try_loadstring definition]], false)
  time([[Defining packer_plugins]], true)
  _G.packer_plugins = {
    ['Vim-Jinja2-Syntax'] = {
      loaded = false,
      needs_bufread = true,
      only_cond = false,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/opt/Vim-Jinja2-Syntax',
    },
    ['cmp-buffer'] = {
      after_files = { '/home/jahe/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua' },
      load_after = {},
      loaded = true,
      needs_bufread = false,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/opt/cmp-buffer',
    },
    ['cmp-nvim-lsp'] = {
      after_files = { '/home/jahe/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua' },
      load_after = {},
      loaded = true,
      needs_bufread = false,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp',
    },
    ['cmp-nvim-lua'] = {
      after_files = { '/home/jahe/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua' },
      load_after = {},
      loaded = true,
      needs_bufread = false,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua',
    },
    ['cmp-path'] = {
      after_files = { '/home/jahe/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua' },
      load_after = {},
      loaded = true,
      needs_bufread = false,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/opt/cmp-path',
    },
    ['cmp-spell'] = {
      after_files = { '/home/jahe/.local/share/nvim/site/pack/packer/opt/cmp-spell/after/plugin/cmp-spell.lua' },
      load_after = {},
      loaded = true,
      needs_bufread = false,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/opt/cmp-spell',
    },
    ['cmp-vsnip'] = {
      after_files = { '/home/jahe/.local/share/nvim/site/pack/packer/opt/cmp-vsnip/after/plugin/cmp_vsnip.vim' },
      load_after = {},
      loaded = true,
      needs_bufread = false,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/opt/cmp-vsnip',
    },
    ['diagnosticls-nvim'] = {
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/diagnosticls-nvim',
    },
    ['friendly-snippets'] = {
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/friendly-snippets',
    },
    ['fugitive-gitlab.vim'] = {
      config = { "require'plugins.fugitive-gitlab'" },
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/fugitive-gitlab.vim',
    },
    ['galaxyline.nvim'] = {
      config = { "require'plugins.galaxyline'" },
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/galaxyline.nvim',
    },
    ['git-worktree.nvim'] = {
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/git-worktree.nvim',
    },
    ['glow.nvim'] = {
      commands = { 'Glow' },
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/opt/glow.nvim',
    },
    ['iron.nvim'] = {
      config = { "require'plugins.iron'" },
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/iron.nvim',
    },
    kommentary = {
      config = { "require'plugins.kommentary'" },
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/kommentary',
    },
    ['lspkind-nvim'] = {
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/lspkind-nvim',
    },
    ['markdown-preview.nvim'] = {
      commands = { 'MarkdownPreview' },
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim',
    },
    neorg = {
      config = { "require'plugins.neorg'" },
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/neorg',
    },
    ['neorg-telescope'] = {
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/neorg-telescope',
    },
    ['neuron.nvim'] = {
      config = { "require'plugins.neuron'" },
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/neuron.nvim',
    },
    ['nlua.nvim'] = {
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/nlua.nvim',
    },
    ['nvim-autopairs'] = {
      config = { "require'plugins.nvim-autopairs'" },
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/nvim-autopairs',
    },
    ['nvim-bufferline.lua'] = {
      config = { "require'plugins.nvim-bufferline'" },
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua',
    },
    ['nvim-cmp'] = {
      after = { 'cmp-vsnip', 'cmp-spell', 'cmp-nvim-lsp', 'cmp-nvim-lua', 'cmp-buffer', 'cmp-path' },
      loaded = true,
      only_config = true,
    },
    ['nvim-colorizer.lua'] = {
      config = { "require'plugins.nvim-colorizer'" },
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua',
    },
    ['nvim-lspconfig'] = {
      config = { "require'plugins.nvim-lspconfig'" },
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/nvim-lspconfig',
    },
    ['nvim-lspinstall'] = {
      config = { "require'plugins.nvim-lspinstall'" },
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/nvim-lspinstall',
    },
    ['nvim-tree.lua'] = {
      config = { "require'plugins.nvim-tree'" },
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/nvim-tree.lua',
    },
    ['nvim-treesitter'] = {
      config = { "require'plugins.treesitter'" },
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/nvim-treesitter',
    },
    ['nvim-web-devicons'] = {
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/nvim-web-devicons',
    },
    ['onedark.nvim'] = {
      config = { '\27LJ\1\0027\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0\24colorscheme onedark\bcmd\bvim\0' },
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/onedark.nvim',
    },
    ['packer.nvim'] = {
      loaded = false,
      needs_bufread = false,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/opt/packer.nvim',
    },
    playground = {
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/playground',
    },
    ['plenary.nvim'] = {
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/plenary.nvim',
    },
    ['popup.nvim'] = {
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/popup.nvim',
    },
    taskwiki = {
      config = { "require'plugins.taskwiki'" },
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/taskwiki',
    },
    ['telescope-fzy-native.nvim'] = {
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim',
    },
    ['telescope-ghq.nvim'] = {
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/telescope-ghq.nvim',
    },
    ['telescope-github.nvim'] = {
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/telescope-github.nvim',
    },
    ['telescope.nvim'] = {
      config = { "require'plugins.telescope'" },
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/telescope.nvim',
    },
    ['vim-arduino'] = {
      loaded = false,
      needs_bufread = true,
      only_cond = false,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/opt/vim-arduino',
    },
    ['vim-bbye'] = {
      config = {
        '\27LJ\1\2t\0\0\5\0\a\0\t4\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\4\0%\3\5\0003\4\6\0>\0\5\1G\0\1\0\1\0\2\vsilent\2\fnoremap\2\21<cmd>Bdelete<cr>\15<leader>bd\5\20nvim_set_keymap\bapi\bvim\0',
      },
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/vim-bbye',
    },
    ['vim-dadbod'] = {
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/vim-dadbod',
    },
    ['vim-dadbod-completion'] = {
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/vim-dadbod-completion',
    },
    ['vim-dadbod-ui'] = {
      config = { "require'plugins.vim-dadbod-ui'" },
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/vim-dadbod-ui',
    },
    ['vim-dirdiff'] = {
      commands = { 'DirDiff' },
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/opt/vim-dirdiff',
    },
    ['vim-fugitive'] = {
      config = { "require'plugins.fugitive'" },
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/vim-fugitive',
    },
    ['vim-jsonnet'] = {
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/vim-jsonnet',
    },
    ['vim-plugin-AnsiEsc'] = {
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/vim-plugin-AnsiEsc',
    },
    ['vim-repeat'] = {
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/vim-repeat',
    },
    ['vim-rest-console'] = {
      loaded = false,
      needs_bufread = true,
      only_cond = false,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/opt/vim-rest-console',
    },
    ['vim-rhubarb'] = {
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/vim-rhubarb',
    },
    ['vim-surround'] = {
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/vim-surround',
    },
    ['vim-terraform'] = {
      config = { "require'plugins.vim-terraform'" },
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/vim-terraform',
    },
    ['vim-unimpaired'] = {
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/vim-unimpaired',
    },
    ['vim-vsnip'] = {
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/vim-vsnip',
    },
    vimwiki = {
      config = { "require'plugins.vimwiki'" },
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/vimwiki',
    },
    ['which-key.nvim'] = {
      config = { "require'plugins.which-key'" },
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/which-key.nvim',
    },
    ['zen-mode.nvim'] = {
      config = { "require'plugins.zen-mode'" },
      loaded = true,
      path = '/home/jahe/.local/share/nvim/site/pack/packer/start/zen-mode.nvim',
    },
  }

  time([[Defining packer_plugins]], false)
  -- Setup for: vim-arduino
  time([[Setup for vim-arduino]], true)
  require 'plugins.vim-arduino'
  time([[Setup for vim-arduino]], false)
  -- Config for: nvim-treesitter
  time([[Config for nvim-treesitter]], true)
  require 'plugins.treesitter'
  time([[Config for nvim-treesitter]], false)
  -- Config for: nvim-cmp
  time([[Config for nvim-cmp]], true)
  require 'plugins.nvim-cmp'
  time([[Config for nvim-cmp]], false)
  -- Config for: which-key.nvim
  time([[Config for which-key.nvim]], true)
  require 'plugins.which-key'
  time([[Config for which-key.nvim]], false)
  -- Config for: vim-bbye
  time([[Config for vim-bbye]], true)
  try_loadstring(
    '\27LJ\1\2t\0\0\5\0\a\0\t4\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\4\0%\3\5\0003\4\6\0>\0\5\1G\0\1\0\1\0\2\vsilent\2\fnoremap\2\21<cmd>Bdelete<cr>\15<leader>bd\5\20nvim_set_keymap\bapi\bvim\0',
    'config',
    'vim-bbye'
  )
  time([[Config for vim-bbye]], false)
  -- Config for: galaxyline.nvim
  time([[Config for galaxyline.nvim]], true)
  require 'plugins.galaxyline'
  time([[Config for galaxyline.nvim]], false)
  -- Config for: onedark.nvim
  time([[Config for onedark.nvim]], true)
  try_loadstring(
    '\27LJ\1\0027\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0\24colorscheme onedark\bcmd\bvim\0',
    'config',
    'onedark.nvim'
  )
  time([[Config for onedark.nvim]], false)
  -- Config for: nvim-autopairs
  time([[Config for nvim-autopairs]], true)
  require 'plugins.nvim-autopairs'
  time([[Config for nvim-autopairs]], false)
  -- Config for: nvim-colorizer.lua
  time([[Config for nvim-colorizer.lua]], true)
  require 'plugins.nvim-colorizer'
  time([[Config for nvim-colorizer.lua]], false)
  -- Config for: iron.nvim
  time([[Config for iron.nvim]], true)
  require 'plugins.iron'
  time([[Config for iron.nvim]], false)
  -- Config for: telescope.nvim
  time([[Config for telescope.nvim]], true)
  require 'plugins.telescope'
  time([[Config for telescope.nvim]], false)
  -- Config for: kommentary
  time([[Config for kommentary]], true)
  require 'plugins.kommentary'
  time([[Config for kommentary]], false)
  -- Config for: vimwiki
  time([[Config for vimwiki]], true)
  require 'plugins.vimwiki'
  time([[Config for vimwiki]], false)
  -- Config for: neorg
  time([[Config for neorg]], true)
  require 'plugins.neorg'
  time([[Config for neorg]], false)
  -- Config for: fugitive-gitlab.vim
  time([[Config for fugitive-gitlab.vim]], true)
  require 'plugins.fugitive-gitlab'
  time([[Config for fugitive-gitlab.vim]], false)
  -- Config for: vim-dadbod-ui
  time([[Config for vim-dadbod-ui]], true)
  require 'plugins.vim-dadbod-ui'
  time([[Config for vim-dadbod-ui]], false)
  -- Config for: nvim-bufferline.lua
  time([[Config for nvim-bufferline.lua]], true)
  require 'plugins.nvim-bufferline'
  time([[Config for nvim-bufferline.lua]], false)
  -- Config for: vim-terraform
  time([[Config for vim-terraform]], true)
  require 'plugins.vim-terraform'
  time([[Config for vim-terraform]], false)
  -- Config for: vim-fugitive
  time([[Config for vim-fugitive]], true)
  require 'plugins.fugitive'
  time([[Config for vim-fugitive]], false)
  -- Config for: taskwiki
  time([[Config for taskwiki]], true)
  require 'plugins.taskwiki'
  time([[Config for taskwiki]], false)
  -- Config for: nvim-tree.lua
  time([[Config for nvim-tree.lua]], true)
  require 'plugins.nvim-tree'
  time([[Config for nvim-tree.lua]], false)
  -- Config for: neuron.nvim
  time([[Config for neuron.nvim]], true)
  require 'plugins.neuron'
  time([[Config for neuron.nvim]], false)
  -- Config for: nvim-lspconfig
  time([[Config for nvim-lspconfig]], true)
  require 'plugins.nvim-lspconfig'
  time([[Config for nvim-lspconfig]], false)
  -- Config for: zen-mode.nvim
  time([[Config for zen-mode.nvim]], true)
  require 'plugins.zen-mode'
  time([[Config for zen-mode.nvim]], false)
  -- Config for: nvim-lspinstall
  time([[Config for nvim-lspinstall]], true)
  require 'plugins.nvim-lspinstall'
  time([[Config for nvim-lspinstall]], false)
  -- Load plugins in order defined by `after`
  time([[Sequenced loading]], true)
  vim.cmd [[ packadd cmp-spell ]]
  vim.cmd [[ packadd cmp-nvim-lua ]]
  vim.cmd [[ packadd cmp-path ]]
  vim.cmd [[ packadd cmp-vsnip ]]
  vim.cmd [[ packadd cmp-nvim-lsp ]]
  vim.cmd [[ packadd cmp-buffer ]]
  time([[Sequenced loading]], false)

  -- Command lazy-loads
  time([[Defining lazy-load commands]], true)
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file Glow lua require("packer.load")({'glow.nvim'}, { cmd = "Glow", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file DirDiff lua require("packer.load")({'vim-dirdiff'}, { cmd = "DirDiff", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  time([[Defining lazy-load commands]], false)

  vim.cmd [[augroup packer_load_aucmds]]
  vim.cmd [[au!]]
  -- Filetype lazy-loads
  time([[Defining lazy-load filetype autocommands]], true)
  vim.cmd [[au FileType arduino ++once lua require("packer.load")({'vim-arduino'}, { ft = "arduino" }, _G.packer_plugins)]]
  vim.cmd [[au FileType markdown ++once lua require("packer.load")({'glow.nvim', 'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
  vim.cmd [[au FileType vimwiki ++once lua require("packer.load")({'glow.nvim', 'markdown-preview.nvim'}, { ft = "vimwiki" }, _G.packer_plugins)]]
  vim.cmd [[au FileType jinja ++once lua require("packer.load")({'Vim-Jinja2-Syntax'}, { ft = "jinja" }, _G.packer_plugins)]]
  vim.cmd [[au FileType rest ++once lua require("packer.load")({'vim-rest-console'}, { ft = "rest" }, _G.packer_plugins)]]
  time([[Defining lazy-load filetype autocommands]], false)
  vim.cmd 'augroup END'
  vim.cmd [[augroup filetypedetect]]
  time(
    [[Sourcing ftdetect script at: /home/jahe/.local/share/nvim/site/pack/packer/opt/vim-arduino/ftdetect/arduino.vim]],
    true
  )
  vim.cmd [[source /home/jahe/.local/share/nvim/site/pack/packer/opt/vim-arduino/ftdetect/arduino.vim]]
  time(
    [[Sourcing ftdetect script at: /home/jahe/.local/share/nvim/site/pack/packer/opt/vim-arduino/ftdetect/arduino.vim]],
    false
  )
  time(
    [[Sourcing ftdetect script at: /home/jahe/.local/share/nvim/site/pack/packer/opt/vim-rest-console/ftdetect/rest.vim]],
    true
  )
  vim.cmd [[source /home/jahe/.local/share/nvim/site/pack/packer/opt/vim-rest-console/ftdetect/rest.vim]]
  time(
    [[Sourcing ftdetect script at: /home/jahe/.local/share/nvim/site/pack/packer/opt/vim-rest-console/ftdetect/rest.vim]],
    false
  )
  time(
    [[Sourcing ftdetect script at: /home/jahe/.local/share/nvim/site/pack/packer/opt/Vim-Jinja2-Syntax/ftdetect/jinja.vim]],
    true
  )
  vim.cmd [[source /home/jahe/.local/share/nvim/site/pack/packer/opt/Vim-Jinja2-Syntax/ftdetect/jinja.vim]]
  time(
    [[Sourcing ftdetect script at: /home/jahe/.local/share/nvim/site/pack/packer/opt/Vim-Jinja2-Syntax/ftdetect/jinja.vim]],
    false
  )
  vim.cmd 'augroup END'
  if should_profile then
    save_profiles()
  end
end)

if not no_errors then
  vim.api.nvim_command(
    'echohl ErrorMsg | echom "Error in packer_compiled: '
      .. error_msg
      .. '" | echom "Please check your config for correctness" | echohl None'
  )
end
