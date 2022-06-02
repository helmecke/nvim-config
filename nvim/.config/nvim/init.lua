local present, impatient = pcall(require, 'impatient')

if present then
  impatient.enable_profile()
end

require 'configs' -- ./lua/configs/init.lua
require 'plugins' -- ./lua/plugins/init.lua
