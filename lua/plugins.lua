local api = vim.api
local fn = vim.fn

-- Plugin home directory
vim.g.plugin_home = fn.stdpath("data") .. "/site/pack/packer"

-- Function to check if packer is installed
local function packer_ensure()
  local packer_dir = vim.g.plugin_home .. "/opt/packer.nvim"
  if fn.empty(fn.glob(install_dir)) > 0 then
    vim.api.nvim_echo({ { "Installing packer.nvim", "Type" } }, true, {})
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_dir})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = packer_ensure()

return require('packer').startup(function(use)
  
  use 'wbthomason/packer.nvim'
  

  if packer_bootstrap then
    require('packer').sync()
  end
end)
