local Plugin = {"rbong/vim-flog"}
Plugin.lazy = true 
Plugin.cmd = {"Flog", "Flogsplit", "Floggit"}
Plugin.dependencies = {"tpope/vim-fugitive"}

return Plugin
