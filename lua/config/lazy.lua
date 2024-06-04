local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  spec = {
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      dependencies = { "catppuccin/nvim" },
      opts = { colorscheme = "catppuccin" },
    },
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
    version = false, -- always use the latest git commit
  },
  install = { colorscheme = { "catppuccin" } },
  checker = { enabled = true },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
-- require("lazy").setup(Plugins.opts)
-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- if not (vim.uv or vim.loop).fs_stat(lazypath) then
--   vim.notify("Installing lazy.nvim...")
--   vim.fn.system({
--     "git",
--     "clone",
--     "--filter=blob:none",
--     "https://github.com/folke/lazy.nvim.git",
--     "--branch=stable", -- latest stable release
--     lazypath,
--   })
--   vim.notify("Done.")
-- end

-- vim.opt.rtp:prepend(lazypath)

-- load('config.autocmds')
-- load('config.options')
-- load('config.globals')
-- load('config.keymaps')
-- require('config.colors')
-- local require('config.colors')
-- -- load('config.colors')

-- require("lazy").setup("plugins")

-- pcall(vim.cmd.colorscheme, 'catppuccin')
