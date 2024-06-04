local load = function(mod)
  package.loaded[mod] = nil
  require(mod)
end
load("config.autocmds")
load("config.options")
load("config.globals")
load("config.keymaps")
require("config.colors")

require("config.lazy")
