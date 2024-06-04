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
  transparent_background = false, -- disables setting the background color.
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
  color_overrides = {},
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
