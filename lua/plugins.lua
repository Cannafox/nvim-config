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
  use { "onsails/lspkind-nvim", event = "VimEnter" }
  use { "hrsh7th/nvim-cmp", after = "lspkind-nvim", config = [[require('config.nvim-cmp')]] }
  use { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" }
  use { "hrsh7th/cmp-path", after = "nvim-cmp" }
  use { "hrsh7th/cmp-buffer", after = "nvim-cmp" }
  use { "hrsh7th/cmp-cmdline", after = "nvim-cmp" }
  use { "hrsh7th/cmp-omni", after = "nvim-cmp" }
  use { "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" }
  use { "quangnguyen30192/cmp-nvim-ultisnips", after = { "nvim-cmp", "ultisnips" } }
  use { "neovim/nvim-lspconfig", after = "cmp-nvim-lsp", config = [[require('config.lsp')]] }

  use { "SirVer/ultisnips", event = "InsertEnter" }
  use { "honza/vim-snippets", after = "ultisnips" }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
