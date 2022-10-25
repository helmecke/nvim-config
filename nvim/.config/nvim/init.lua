local present, impatient = pcall(require, 'impatient')

if present then
  impatient.enable_profile()
end

-- disable some builtin vim plugins
local default_plugins = {
  '2html_plugin',
  'getscript',
  'getscriptPlugin',
  'gzip',
  'logipat',
  -- 'netrw', -- needed for fugitives :GB
  'netrwPlugin',
  'netrwSettings',
  -- 'netrwFileHandlers', -- needed for fugitives :GB
  'matchit',
  'tar',
  'tarPlugin',
  'rrhelper',
  'spellfile_plugin',
  'vimball',
  'vimballPlugin',
  'zip',
  'zipPlugin',
  'fzf',
}

for _, plugin in pairs(default_plugins) do
  vim.g['loaded_' .. plugin] = 1
end

require 'config' -- ./lua/config/init.lua
require 'plugin' -- ./lua/plugin/init.lua
