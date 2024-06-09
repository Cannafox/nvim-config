local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
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

package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.4/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.4/?.lua;"

require("lazy").setup({
  spec = {
    {"LazyVim/LazyVim", import = "lazyvim.plugins", news = {colorscheme = "catppuccin", lazyvim = true, neovim = true}},
    { import = "plugins" },
  },
  defaults = {
    lazy = true,
    version = false, -- always use the latest git commit
  },
  install = { colorscheme = { "catppuccin" } },
  checker = { enabled = true },
  performance = {
    cache = {
      enabled = true
    },
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
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
