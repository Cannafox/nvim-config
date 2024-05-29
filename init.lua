-- Sokrati's neovim config

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

local load = function(mod)
  package.loaded[mod] = nil
  require(mod)
end

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.notify("Installing lazy.nvim...")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
  vim.notify("Done.")
end

vim.opt.rtp:prepend(lazypath)

load('config.autocmds')
load('config.options')
load('config.globals')
load('config.keymaps')
load('config.colors')

require("lazy").setup("plugins")

pcall(vim.cmd.colorscheme, 'catppuccin')



