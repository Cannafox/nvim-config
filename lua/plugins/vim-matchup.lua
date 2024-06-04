local Plugin = { "andymass/vim-matchup" }

Plugin.event = "BufRead"
Plugin.config = function()
  vim.g.loaded_tutor_mode_plugin = 1
  vim.g.loaded_matchit = 1
  vim.g.loaded_matchparen = 1
  vim.g.matchup_matchparen_deferred = 1
  vim.g.matchup_matchparen_timeout = 100
end

return Plugin
