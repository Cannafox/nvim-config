local colors = {
  very_bright_pink = "#FC93C8",
  bright_pink = "#FB77BA",
  pink = "#D20A74",
  dark_pink = "#AE0E66",
  darker_pink = "#8A1258",
  very_dark_pink = "#421A3C",
  bright_blue = "#5BCEFA",
  blue = "#50AFD8",
  dark_blue = "#4696BA",
  darker_blue = "#366682",
  very_dark_blue = "#26364A",
  background = "#1E1E2E",
  red = "#ff4b78",
  darker_red = "#900F16",
  yellow = "#ffff00",
  darker_yellow = "#909016",
  green = "#00ff00",
  darker_green = "#0F9016",
}

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
  term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
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
      surface2 = colors.bright_pink,
      overlay0 = colors.dark_blue,
      surface1 = colors.dark_pink,
      rosewater = "#f5e0dc",
      mauve = "#cba6f7",
      peach = "#fab387",
      green = "#a6e3a1",
      surface0 = colors.darker_pink,
      mantle = colors.dark_blue,
      blue = colors.blue,
      teal = "#94e2d5",
      maroon = "#eba0ac",
      red = colors.red,
      overlay1 = colors.darker_blue,
      sky = colors.bright_blue,
      pink = colors.pink,
      subtext0 = colors.darker_pink,
      text = colors.very_bright_pink,
      overlay2 = colors.bright_pink,
      crust = colors.dark_blue,
      sapphire = colors.blue,
      lavender = colors.dark_blue,
      flamingo = colors.bright_pink,
      subtext1 = colors.dark_blue,
      base = colors.very_dark_pink,
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
