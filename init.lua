-- Sokrati's neovim config

-- Byte compiling lua files to load them faster
vim.loader.enable()

local api = vim.api

-- List with every config file
local config_files = {
  "plugins-config.lua",
  "globals.lua",
  "autocommands.lua",
  "mappings.lua",
  "options.lua",
  "functions.lua"
}

-- Source all config files
for _, name in ipairs(config_files) do
  local config_file_path = string.format("%s/core/%s", vim.fn.stdpath("config"), name)
  local source_cmd = "source " .. config_file_path
  vim.cmd(source_cmd)
end
