-- Sokrati's neovim config

-- Byte compiling lua files to load them faster
vim.loader.enable()

local api = vim.api
require("plugins")
-- List with every config file
local config_files = vim.split(vim.fn.glob("~/.config/nvim/lua/core/*.lua"), "\n")

-- Source all config files
for _, path in ipairs(config_files) do
  config_file_path = vim.fn.split(path, "/")
  file = string.gsub(config_file_path[#config_file_path], "%.lua?$", "")
  if file ~= "init" then
    require("core." .. file)
  end
end
