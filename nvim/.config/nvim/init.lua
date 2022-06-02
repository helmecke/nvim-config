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
  'netrwFileHandlers',
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

require 'configs' -- ./lua/configs/init.lua
require 'plugins' -- ./lua/plugins/init.lua
