-- Sokrati's neovim config

-- Byte compiling lua files to load them faster
vim.loader.enable()

require("plugins")
-- List with every config file
-- local core_config_files = vim.split(vim.fn.glob("~/.config/nvim/lua/core/*.lua"), "\n")
local core_config_files = {
  "autocommands.lua",
  "colors.lua",
  "functions.lua",
  "globals.lua",
  "options.lua",
  "mappings.lua"
}
for _, fn in ipairs(core_config_files) do
  local module_name, _ = "core/" .. string.gsub(fn, "%.lua", "")
  package.loaded[module_name] = nil
  require(module_name)
end
