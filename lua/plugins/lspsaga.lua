return {
  {
    "nvimdev/lspsaga.nvim",
    opts = function(_, opts)
      require("lspsaga").setup({})
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
}
