local Plugin = { "catppuccin/nvim" }
Plugin.lazy = true
Plugin.name = "catppuccin"
Plugin.priority = 1000
Plugin.opts = {
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  background = { -- :h background
    light = "latte",
    dark = "mocha",
  },
  transparent_background = true, -- disables setting the background color.
  show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
  term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
  no_italic = false, -- Force no italic
  no_bold = false, -- Force no bold
  no_underline = false, -- Force no underline
  dim_inactive = {
    enabled = true, -- dims the background color of inactive window
    shade = "dark",
    percentage = 0.15, -- percentage of the shade to apply to the inactive window
  },
  styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
    comments = { "italic" }, -- Change the style of comments
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  color_overrides = {
    all = {
      surface2 = "#585b70",
      overlay0 = "#6c7086",
      surface1 = "#45475a",
      rosewater = "#f5e0dc",
      mauve = "#cba6f7",
      peach = "#fab387",
      green = "#a6e3a1",
      surface0 = "#313244",
      mantle = "#181825",
      blue = "#89b4fa",
      teal = "#94e2d5",
      maroon = "#eba0ac",
      red = "#f38ba8",
      overlay1 = "#7f849c",
      sky = "#89dceb",
      pink = "#f5c2e7",
      subtext0 = "#a6adc8",
      text = "#cdd6f4",
      overlay2 = "#9399b2",
      crust = "#11111b",
      sapphire = "#74c7ec",
      lavender = "#b4befe",
      flamingo = "#f2cdcd",
      subtext1 = "#bac2de",
      base = "#1e1e2e",
      yellow = "#f9e2af",
    },
  },
  custom_highlights = {},
  default_integrations = true,
  integrations = {
    aerial = true,
    alpha = true,
    headlines = true,
    cmp = true,
    gitsigns = true,
    diffview = true,
    nvimtree = true,
    notify = true,
    indent_blankline = true,
    semantic_tokens = true,
    fidget = true,
    lsp_saga = true,
    mini = false,
    dashboard = true,
    which_key = true,
    lsp_trouble = true,
    telescope = true,
    treesitter = true,
    treesitter_context = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "undercurl" },
        hints = { "undercurl" },
        warnings = { "undercurl" },
        information = { "undercurl" },
      },
      inlay_hints = {
        background = true,
      },
    },
  },
}

Plugin.config = function(_, opts)
  require("catppuccin").setup(opts)
  vim.cmd.colorscheme("catppuccin")
end

return Plugin
