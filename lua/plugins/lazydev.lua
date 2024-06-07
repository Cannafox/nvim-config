local Plugin = { "folke/lazydev.nvim" }

Plugin.ft = "lua"
Plugin.cmd = "LazyDev"
Plugin.opts = {
  library = {
    { path = "luvit-meta/library", words = { "vim%.uv" } },
    { path = "LazyVim", words = { "LazyVim" } },
    { path = "lazy.nvim", words = { "LazyVim" } },
  },
}

return Plugin
