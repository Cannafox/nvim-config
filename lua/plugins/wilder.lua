local Plugin = { "gelguy/wilder.nvim" }

Plugin.build = ":UpdateRemotePlugins"
Plugin.event = "VeryLazy"
Plugin.opts = {
  modes = {":", "/\v", "?"},
  next_key = "<Tab",
  previous_key = "<S-Tab>",
  accept_key = "<C-y>",
  reject_key = "<C-e>"
}
Plugin.config = function(_, opts)
  local wilder = require('wilder')
  wilder.setup(opts)

  wilder.set_option('pipeline', {
    wilder.branch(
      wilder.cmdline_pipeline({
        language = "python",
        fuzzy = 1,
      }),
      wilder.python_search_pipeline({
        pattern = wilder.python_fuzzy_pattern(),
        sorter = wilder.python_difflib_sorter()
      })
    )
  })
  local hl = wilder.make_hl('WilderAccent', 'Pmenu', {{a = 1}, {a = 1}, {foreground = "#f4468f"}})
  local hls = {wilder.pcre2_highlighter(), wilder.basic_highlighter()}
  local popupmenu_renderer = wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
      border = "rounded",
      highlighter = hls, -- wilder.basic_highlighter(),
      empty_message = wilder.popupmenu_empty_message_with_spinner(),
      pumblend = 20,
      max_height = 15,
      highlights = { accent = hl },
      left = { ' ', wilder.popupmenu_devicons()},
      right = { ' ', wilder.popupmenu_scrollbar()}
  }))
  local wildmenu_renderer = wilder.wildmenu_renderer({
    highlighter = hls
  })

  wilder.set_option('renderer', wilder.renderer_mux({
    [':'] = popupmenu_renderer,
    ['/'] = wildmenu_renderer
  }))
end

return Plugin
