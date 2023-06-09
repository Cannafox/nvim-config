local api = vim.api

local packer = require("packer")
packer.startup({function(use)
  use { "folke/neoconf.nvim", cmd = "Neoconf"}
  use {"folke/neodev.nvim"}
  use { "wbthomason/packer.nvim" }
  use { "onsails/lspkind-nvim", event = "VimEnter" }
  use { "hrsh7th/nvim-cmp", after = "lspkind-nvim", config = [[require('config.nvim-cmp')]] }
  use { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" }
  use { "hrsh7th/cmp-path", after = "nvim-cmp" }
  use { "hrsh7th/cmp-buffer", after = "nvim-cmp" }
  use { "hrsh7th/cmp-calc", after = "nvim-cmp" }
  -- use { "amarakon/nvim-cmp-buffer-lines", after = "nvim-cmp", config = [[require('config.nvim-cmp-buffer-lines')]] }
  use { "hrsh7th/cmp-cmdline", after = "nvim-cmp" }
  use { "hrsh7th/cmp-omni", after = "nvim-cmp" }
  use { "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" }
  use { "quangnguyen30192/cmp-nvim-ultisnips", after = { "nvim-cmp", "ultisnips" } }
  use { "neovim/nvim-lspconfig", after = "cmp-nvim-lsp", config = [[require('config.lspconfig')]] }
  use { "gelguy/wilder.nvim", opt = true, setup = [[vim.cmd('packadd wilder.nvim')]] }
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

  use { "Vimjas/vim-python-pep8-indent", ft = "python" }
  use { "jeetsukumaran/vim-pythonsense", ft = "python" }
  use { "machakann/vim-swap", event = "VimEnter" }

  use { "nvim-lua/plenary.nvim" }
  use {'davidmh/cspell.nvim'}
  use {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = [[require('config.telescope')]]
  }
  use { "nvim-telescope/telescope-symbols.nvim", after = "telescope.nvim" }
  use {"nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use {'tiagovla/scope.nvim', config = [[require('config.scope')]] }
  use {
    "ruifm/gitlinker.nvim",
    requires = "nvim-lua/plenary.nvim",
    event = "User InGitRepo",
    config = [[require('config.git-linker')]],
  }
  use { "tpope/vim-fugitive", event = "User InGitRepo", config = [[require('config.fugitive')]] }
  use { "lewis6991/gitsigns.nvim", config = [[require('config.gitsigns')]] }
  -- Better git log display
  use { "rbong/vim-flog", requires = "tpope/vim-fugitive", cmd = { "Flog" } }

  use { "christoomey/vim-conflicted", requires = "tpope/vim-fugitive", cmd = "Conflicted" }
  use {
    "jose-elias-alvarez/null-ls.nvim",
    config = [[require('config.null-ls')]],
    requires = "nvim-lua/plenary.nvim",
  }
  use { "dyng/ctrlsf.vim" }
  use {
    'junegunn/fzf.vim',
    requires = 'junegunn/fzf',
    run = ':call fzf#install()'
  }
  use { 'folke/trouble.nvim', requires = "nvim-tree/nvim-web-devicons"}
  use {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    config = [[require('config.lualine')]],
  }
  use {
    "akinsho/bufferline.nvim",
    event = "VimEnter",
    config = [[require('config.bufferline')]]
  }
  use {'kyazdani42/nvim-web-devicons', event = 'VimEnter'}
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'nvim-tree/nvim-web-devicons',
    config = [[ require('config.nvim-tree') ]]
  }
  use {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    config = [[require('config.dashboard')]]
  }
  use {
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function()
      vim.defer_fn(function()
        require("config.which-key")
      end, 2000)
    end,
  }
  use {
    "madox2/vim-ai",
    config = [[require("config.vim-ai")]]
  }
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && yarn install",
    ft = "markdown"
  }
  use {
    "williamboman/mason.nvim",
    run = ":MasonUpdate",
    config = [[require('config.mason')]]
  }
  use {"williamboman/mason-lspconfig.nvim"}
  use {'rcarriga/nvim-notify', config=[[require('config.nvim-notify')]]}
  use {'liuchengxu/vista.vim'}
  use {'simnalamburt/vim-mundo', cmd = {'MundoToggle', 'MundoShow'} }
  use {'sbdchd/neoformat', cmd = 'Neoformat'}
  use {'michaeljsmith/vim-indent-object', event = 'VimEnter'}
  use {'skywind3000/asyncrun.vim', cmd = 'AsyncRun', ft = 'vim'}
  use {'j-hui/fidget.nvim'}
  use {'neomake/neomake'}
  use {'sakhnik/nvim-gdb', run = ':!./install.sh' }
  use {'junegunn/rainbow_parentheses.vim'}
  use {'Pocco81/auto-save.nvim', config = [[require('config.auto-save')]] }
  use { "andymass/vim-matchup", event = "VimEnter" }
  use { "tmux-plugins/vim-tmux", ft = { "tmux" } }
  use { "machakann/vim-sandwich", event = "VimEnter" }
  use { "Raimondi/delimitMate", event = "InsertEnter" }
  use {
    'norcalli/nvim-colorizer.lua',
    event = "BufEnter",
    config = [[ require('config.colorizer') ]]
  }
  -- use { 'mhinz/vim-signify' }

  use { 'ii14/emmylua-nvim'}
  use { "catppuccin/nvim", as="catppuccin", config= [[require('config.catppuccin')]]}
end,
config = {
    max_jobs = 16,
  },
})
api.nvim_create_augroup("PackerAutoCompile", {clear = true})
api.nvim_create_autocmd({"BufWritePost"}, {
  pattern = {"*.config/nvim/lua/plugins.lua","*init.lua"},
  group = "PackerAutoCompile",
  callback = function(ctx)
    local cmd = "source " .. ctx.file
    vim.cmd(cmd)
    vim.cmd("PackerCompile")
    vim.notify("PackerCompile done!", vim.log.levels.INFO, {title = "nvim-config"})
  end,
})
