local api = vim.api
local fn = vim.fn

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

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
  use { "neovim/nvim-lspconfig", after = "cmp-nvim-lsp", config = [[require('config.lspconfig')]] }

  use { "SirVer/ultisnips", event = "InsertEnter" }
  use { "honza/vim-snippets", after = "ultisnips" }
  
  use {"nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter"}
  use {"nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter"}
  use {"nvim-treesitter/nvim-treesitter-context", after = "nvim-treesitter"}
  use {'neovim/tree-sitter-vim', run = 'make' }
  
  
  use {
    "nvim-treesitter/nvim-treesitter",
    event = "BufEnter",
    run = ":TSUpdate",
    config = [[require('config.treesitter')]]
  }

  use { "Vimjas/vim-python-pep8-indent", ft = { "python" } }
  use { "jeetsukumaran/vim-pythonsense", ft = { "python" } }
  use { "machakann/vim-swap", event = "VimEnter" }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
