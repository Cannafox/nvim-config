local api = vim.api

local packer = require("packer")
packer.startup({
  function(use)
    use({ "wbthomason/packer.nvim" })

    use({ "folke/neodev.nvim" })
    use({ "mfussenegger/nvim-dap" })
    use({ "rcarriga/nvim-dap-ui" })
    use({ "onsails/lspkind-nvim" })
    use({ "SirVer/ultisnips" })
    use({ "rafamadriz/friendly-snippets" })

    use({ "williamboman/mason.nvim", config = [[require('config.mason')]]})
    use({ "williamboman/mason-lspconfig.nvim" })

    use({ "neovim/nvim-lspconfig", config = [[require('config.lspconfig')]] })
    use({ "hrsh7th/cmp-nvim-lsp" })
    use({
      "glepnir/lspsaga.nvim",
      branch = "main",
      requires = {
        { "nvim-tree/nvim-web-devicons" },
        { "nvim-treesitter/nvim-treesitter" },
      },
    })

    use({ "hrsh7th/cmp-emoji", after = "nvim-cmp" })
    use({ "f3fora/cmp-spell", after = "nvim-cmp" })
    use({ "octaltree/cmp-look", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-calc", after = "nvim-cmp" })
    -- use { "amarakon/nvim-cmp-buffer-lines", after = "nvim-cmp", config = [[require('config.nvim-cmp-buffer-lines')]] }
    use({ "hrsh7th/cmp-cmdline", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-omni", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" })
    use({ "quangnguyen30192/cmp-nvim-ultisnips", after = { "nvim-cmp", "ultisnips" } })
    use({
      "hrsh7th/nvim-cmp",
      config = [[require('config.nvim-cmp')]],
    })

    use({ "gelguy/wilder.nvim", opt = true, setup = [[vim.cmd('packadd wilder.nvim')]] })

    use({ "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" })
    use({ "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" })
    use({
      "nvim-treesitter/nvim-treesitter-context",
      after = "nvim-treesitter",
      config = [[require('config.ts-context')]],
    })
    use({ "theHamsta/nvim-treesitter-pairs", after = "nvim-treesitter" })
    use({ "neovim/tree-sitter-vim", run = "make" })
    use({
      "nvim-treesitter/nvim-treesitter",
      run = function()
        local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
        ts_update()
      end,
      config = [[require('config.treesitter')]],
    })
    use({ "nvim-treesitter/playground", after = "nvim-treesitter" })

    use({ "Vimjas/vim-python-pep8-indent", ft = "python" })
    use({
      "theHamsta/nvim-dap-virtual-text",
      after = "nvim-treesitter",
      config = [[require('config.nvim-dap-virt')]],
    })

    use({ "jeetsukumaran/vim-pythonsense", ft = "python" })
    use({ "machakann/vim-swap", event = "VimEnter" })

    use({ "nvim-lua/plenary.nvim" })
    use({
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
      },
      config = [[require('config.telescope')]],
    })
    -- use({ "nvim-telescope/telescope-symbols.nvim", after = "telescope.nvim" })
    use({ "tiagovla/scope.nvim", config = [[require('config.scope')]] })
    use({
      "ruifm/gitlinker.nvim",
      requires = "nvim-lua/plenary.nvim",
      event = "User InGitRepo",
      config = [[require('config.git-linker')]],
    })
    use({ "tpope/vim-fugitive", event = "User InGitRepo", config = [[require('config.fugitive')]] })
    use({ "lewis6991/gitsigns.nvim", config = [[require('config.gitsigns')]] })
    -- Better git log display
    use({ "rbong/vim-flog", requires = "tpope/vim-fugitive", cmd = { "Flog" } })

    use({ "christoomey/vim-conflicted", requires = "tpope/vim-fugitive", cmd = "Conflicted" })
    use({ "dyng/ctrlsf.vim" })

    use({ "folke/trouble.nvim", requires = "nvim-tree/nvim-web-devicons" })

    use({
      "nvim-lualine/lualine.nvim",
      event = "VimEnter",
      config = [[require('config.lualine')]],
    })

    use({
      "akinsho/bufferline.nvim",
      event = "VimEnter",
      config = [[require('config.bufferline')]],
    })

    use({ "nvim-tree/nvim-web-devicons", event = "VimEnter" })

    use({
      "kyazdani42/nvim-tree.lua",
      requires = "nvim-tree/nvim-web-devicons",
      config = [[ require('config.nvim-tree') ]],
    })

    use({
      "glepnir/dashboard-nvim",
      event = "VimEnter",
      config = [[require('config.dashboard')]],
    })

    use({
      "folke/which-key.nvim",
      event = "VimEnter",
      config = [[require("config.which-key")]],
    })

    use({
      "madox2/vim-ai",
      config = [[require("config.vim-ai")]],
    })
    use({
      "iamcco/markdown-preview.nvim",
      run = "cd app && yarn install",
      ft = "markdown",
    })
    use({ "rcarriga/nvim-notify", config = [[require('config.nvim-notify')]] })
    use({ "liuchengxu/vista.vim" })
    use({ "simnalamburt/vim-mundo", cmd = { "MundoToggle", "MundoShow" } })
    use({ "sbdchd/neoformat" })
    use({ "michaeljsmith/vim-indent-object", event = "VimEnter" })
    use({
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require("config.indent-blankline")
      end,
    })
    use({ "skywind3000/asyncrun.vim", cmd = "AsyncRun", ft = "vim" })
    use({
      "j-hui/fidget.nvim",
      config = [[require('config.fidget')]],
    })
    use({ "neomake/neomake" })
    use({ "chrisbra/unicode.vim" })
    -- use {'sakhnik/nvim-gdb'}
    -- use {'junegunn/rainbow_parentheses.vim'}
    use({ "HiPhish/rainbow-delimiters.nvim", config = [[require('config.rainbow')]] })
    -- use {'Pocco81/auto-save.nvim', config = [[require('config.auto-save')]] }
    use({ "andymass/vim-matchup", event = "VimEnter" })
    use({ "tmux-plugins/vim-tmux", ft = { "tmux" } })
    use({ "Raimondi/delimitMate", event = "InsertEnter" })
    use({
      "norcalli/nvim-colorizer.lua",
      event = "BufEnter",
      config = [[ require('config.colorizer') ]],
    })
    use({
      "kylechui/nvim-surround",
      tag = "*", -- Use for stability; omit to use `main` branch for the latest features
      config = function()
        require("nvim-surround").setup({})
      end,
    })
    -- use { 'mhinz/vim-signify' }

    use({ "ii14/emmylua-nvim" })
    use({ "catppuccin/nvim", as = "catppuccin", config = [[require('config.catppuccin')]] })
    use({ "voldikss/vim-floaterm" })
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    use { "nvim-telescope/telescope-file-browser.nvim", requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"}}
    use({ "tpope/vim-commentary" })
    use({
        "onsails/diaglist.nvim",
        config = function()
            require("diaglist").init({
                debug = false,
                debounce_ms = 150,
            })
        end
    })
    use({'lervag/vimtex'})
    use({'arkav/lualine-lsp-progress'})
  end,
  config = {
    max_jobs = 16,
  },
})
api.nvim_create_augroup("PackerAutoCompile", { clear = true })
api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "*.config/nvim/lua/plugins.lua", "*init.lua" },
  group = "PackerAutoCompile",
  callback = function(ctx)
    local cmd = "source " .. ctx.file
    vim.cmd(cmd)
    vim.cmd("PackerCompile")
    vim.notify("PackerCompile done!", vim.log.levels.INFO, { title = "nvim-config" })
  end,
})
