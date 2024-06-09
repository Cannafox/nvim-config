local Plugin = {'L3MON4D3/LuaSnip'}
Plugin.event = { "InsertEnter", "CmdlineEnter"}
Plugin.dependencies = {
'rafamadriz/friendly-snippets',
  config = function()
      -- EDIT: /Users/agou-ops/.local/share/nvim/lazy/friendly-snippets/snippets
      require('luasnip.loaders.from_vscode').lazy_load()
  end,
}
Plugin.opts = {
  history = false,
  enable_autosnippets = true,
  update_events = {'TextChanged', 'TextChangedI'},
  region_check_events = {'CursorMoved', 'CursorMovedI', 'CursorHold'}
}
Plugin.config = function(_, opts)
  local luasnip = require('luasnip')
  luasnip.setup(opts)
end

return Plugin
