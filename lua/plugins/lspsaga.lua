local keymap = vim.keymap

local Plugin = { "nvimdev/lspsaga.nvim" }

Plugin.event = "LspAttach"
Plugin.dependencies = {
  "nvim-treesitter/nvim-treesitter",
  "nvim-tree/nvim-web-devicons",
}
Plugin.opts = {
  finder = {
    max_height = 0.6,
    keys = {
      vsplit = "v",
    },
  },
  diagnostic = {
    max_height = 0.8,
    keys = {
      quit = { "q", "<ESC>" },
    },
  },
  hover = {},
  definition = {
    keys = {
      edit = "o",
    },
  },
  rename = {},
  codeaction = { show_server_name = true, extend_gitsigns = true },
  symbol_in_winbar = { enable = true },
  outline = {},
  implement = { enable = true },
}
Plugin.config = function(_, opts)
  local lspsaga = require("lspsaga")
  keymap.set("n", "[E", function()
    require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
  end)
  keymap.set("n", "K", "<cmd>Lspsaga hover_doc")
  lspsaga.setup(opts)
end

return Plugin
