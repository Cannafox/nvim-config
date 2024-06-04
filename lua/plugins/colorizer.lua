local Plugin = { "norcalli/nvim-colorizer.lua" }
Plugin.opts = {}
Plugin.config = function(_, opts)
  require("colorizer").setup(opts)
end

return Plugin
