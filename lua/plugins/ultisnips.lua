local Plugin = {"SirVer/ultisnips"}

Plugin.dependencies = {
  "honza/vim-snippets",
  "rafamadriz/friendly-snippets"
}
Plugin.event = "InsertEnter"

return Plugin
