local Plugin = { "norcalli/nvim-colorizer.lua" }
Plugin.event = "BufEnter"
Plugin.opts = { "*" }
Plugin.config = function(_, opts)
  require("colorizer").setup(opts)
end

return Plugin
