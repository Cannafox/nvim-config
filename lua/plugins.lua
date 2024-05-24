local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugin_specs = {
    {"folke/neodev.nvim", opts={}},
    "onsails/lspkind-nvim",
    "mg979/vim-visual-multi",
    { "SirVer/ultisnips", dependencies= {
      "honza/vim-snippets",
      "rafamadriz/friendly-snippets"
      }, event = "InsertEnter"
    },
    -- {
    --     "williamboman/mason.nvim",
    --     config = function()
    --         require('config.mason')
    --     end,
    -- },
    -- "williamboman/mason-lspconfig.nvim",
    {
        'nvimdev/lspsaga.nvim',
        config = function()
            require('lspsaga').setup({})
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons'
        }
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-emoji",
            "octaltree/cmp-look",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-calc",
            "hrsh7th/cmp-omni",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "quangnguyen30192/cmp-nvim-ultisnips"
        },
        config = function()
            require("config.nvim-cmp")
        end,
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufRead", "BufNewFile" },
        config = function()
            require('config.lspconfig')
        end,
    },
    {
        "gelguy/wilder.nvim",
        build = ":UpdateRemotePlugins"
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = "VeryLazy",
        config = function()
            require('config.treesitter')
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter-refactor",
            "nvim-treesitter/nvim-treesitter-textobjects",
            {
                "nvim-treesitter/nvim-treesitter-context",
                config = function()
                    require('config.ts-context')
                end,
            },
            "theHamsta/nvim-treesitter-pairs",
        }
    },
    {
        "Vimjas/vim-python-pep8-indent",
        ft = {"python"}
    },
    {
        "jeetsukumaran/vim-pythonsense",
        ft = {"python"}
    },
    {
        "machakann/vim-swap",
        event = "VeryLazy"
    },
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = {
            "nvim-telescope/telescope-symbols.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
            "nvim-telescope/telescope-file-browser.nvim"
        },
        config = function()
            require("config.telescope")
        end
    },
    {
        "kevinhwang91/nvim-hlslens",
        branch = "main",
        keys = { "*", "#", "n", "N" },
        config = function()
            require("config.hlslens")
        end,
    },
    {
        "lukas-reineke/headlines.nvim",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = true, -- or `opts = {}`
    },
    {
        "tiagovla/scope.nvim",
        config = function()
            require("config.scope")
        end
    },
    {
        "tpope/vim-fugitive",
        event = "User InGitRepo",
        config = function()
            require("config.fugitive")
        end,
    },
    {
        "rbong/vim-flog",
        cmd = { "Flog" }
    },
    {
        "ruifm/gitlinker.nvim",
        event = "User InGitRepo",
        config = function()
            require("config.git-linker")
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("config.gitsigns")
        end,
    },
    "dyng/ctrlsf.vim",
    {
        "folke/trouble.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
    },
    {
      "nvim-lualine/lualine.nvim",
      event = "VeryLazy",
      config = function()
          require('config.lualine')
      end
    },
    {
        "akinsho/bufferline.nvim",
        event = { "BufEnter" },
        config = function()
        require("config.bufferline")
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        keys = { "\\" },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("config.nvim-tree")
        end,
    },
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        config = function()
            require("config.dashboard")
        end,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("config.which-key")
        end,
    },
    {
      "madox2/vim-ai",
      config = function()
          require("config.vim-ai")
      end
    },
    {
        "rcarriga/nvim-notify",
        event = "VeryLazy",
        config = function()
            require('config.nvim-notify')
        end
    },
    "liuchengxu/vista.vim",
    {
        "simnalamburt/vim-mundo",
        cmd = { "MundoToggle", "MundoShow" }
    },
    "sbdchd/neoformat",
    { "michaeljsmith/vim-indent-object", event = "VeryLazy" },
    {
      "lukas-reineke/indent-blankline.nvim",
      event = "VeryLazy",
      config = function()
        require("config.indent-blankline")
      end,
    },
    { "skywind3000/asyncrun.vim", lazy = true, cmd = { "AsyncRun" } },
    { "cespare/vim-toml", ft = { "toml" }, branch = "main" },
    { "ii14/emmylua-nvim", ft = "lua" },
    {
        "j-hui/fidget.nvim",
        event = "VeryLazy",
        tag = "legacy",
        config = function()
            require("config.fidget")
        end,
    },
    "neomake/neomake",
    "chrisbra/unicode.vim",
    {
        "HiPhish/rainbow-delimiters.nvim",
        config = function()
            require('config.rainbow')
        end
    },
    { "sindrets/diffview.nvim" },
    { "wellle/targets.vim", event = "VeryLazy" },
    { "andymass/vim-matchup", event = "BufRead" },
    { "tpope/vim-scriptease", cmd = { "Scriptnames", "Message", "Verbose" } },
    { "tmux-plugins/vim-tmux", ft = { "tmux" } },
    { "Raimondi/delimitMate", event = "InsertEnter" },
    {
      "norcalli/nvim-colorizer.lua",
      event = "BufEnter",
      config = function()
          require('config.colorizer')
      end
    },
    "voldikss/vim-floaterm",
    { "machakann/vim-sandwich", event = "VeryLazy" },
    {
        "catppuccin/nvim",
        config = function()
            require('config.catppuccin')
        end
    },
    "tpope/vim-commentary",
    {
        "onsails/diaglist.nvim",
        config = function()
            require("diaglist").init({
                debug = false,
                debounce_ms = 150,
            })
        end
    },
    'lervag/vimtex',
    'arkav/lualine-lsp-progress',
    'averms/black-nvim'
}
local lazy_opts = {
    ui = {
        border = "rounded",
        title = "Lazy Plugin Manager",
        title_pos = "center",
    },
}

require("lazy").setup(plugin_specs, lazy_opts)
