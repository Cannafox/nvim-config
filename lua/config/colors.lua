local api = vim.api

-- Moje kolorki

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
  red = "#ff0000",
  darker_red = "#900F16",
  yellow = "#ffff00",
  darker_yellow = "#909016",
  green = "#00ff00",
  darker_green = "#0F9016"
}

-- Syntax
api.nvim_set_hl(0, 'Italic', {})
api.nvim_set_hl(0, 'Conditional', {fg=colors.blue, bold=true})
api.nvim_set_hl(0, 'Comment', {fg=colors.darker_blue})
api.nvim_set_hl(0, 'Boolean', {fg=colors.bright_blue})
api.nvim_set_hl(0, 'Number', {fg=colors.bright_blue})
api.nvim_set_hl(0, 'String', {fg=colors.bright_blue})
api.nvim_set_hl(0, 'Delimiter', {fg=colors.blue})
api.nvim_set_hl(0, 'Operator', {fg=colors.blue})
api.nvim_set_hl(0, 'Special', {fg=colors.bright_blue})
api.nvim_set_hl(0, '@variable', {fg=colors.pink})
api.nvim_set_hl(0, 'Function', {fg=colors.bright_pink})
api.nvim_set_hl(0, 'Keyword', {fg=colors.darker_pink, bold=true})
api.nvim_set_hl(0, 'Include', {fg=colors.darker_pink})
api.nvim_set_hl(0, '@property', {fg=colors.bright_pink, bold=true})
api.nvim_set_hl(0, '@string.documentation', {fg=colors.dark_blue})
api.nvim_set_hl(0, 'Type', {fg=colors.pink})
api.nvim_set_hl(0, '@keyword.function', {fg=colors.darker_pink})
api.nvim_set_hl(0, '@constructor', {fg=colors.bright_pink})
api.nvim_set_hl(0, '@variable.builtin', {fg=colors.dark_pink})
api.nvim_set_hl(0, '@constant.builtin', {fg=colors.bright_blue})
api.nvim_set_hl(0, '@function.builtin', {fg=colors.bright_pink})
api.nvim_set_hl(0, 'Constant', {fg=colors.pink})
api.nvim_set_hl(0, '@variable.parameter', {fg=colors.pink})
api.nvim_set_hl(0, '@variable.member', {fg=colors.pink})



-- -- Buffer specific
api.nvim_set_hl(0, 'EndOfBuffer', {fg=colors.very_dark_pink})
api.nvim_set_hl(0, 'LineNr', {fg=colors.bright_pink, bold=true})
api.nvim_set_hl(0, 'LineNrAbove', {fg=colors.dark_pink})
api.nvim_set_hl(0, 'LineNrBelow', {fg=colors.dark_pink})
api.nvim_set_hl(0, 'NonText', {fg=colors.very_dark_pink})
api.nvim_set_hl(0, 'Pmenu', {fg=colors.bright_pink})
api.nvim_set_hl(0, 'PmenuSel', {fg=colors.background, bg=colors.bright_pink, bold=true})
api.nvim_set_hl(0, 'BufferLineBufferSelected', {fg=colors.very_bright_pink, bold=true})
api.nvim_set_hl(0, 'BufferLineNumbersSelected', {bg=colors.background})
-- api.nvim_set_hl(0, 'Cursor', {bg=colors.bright_pink})
-- api.nvim_set_hl(0, 'TermCursor', {bg=colors.bright_pink})
-- api.nvim_set_hl(0, 'BufferLinePick', {fg=colors.background, bg=colors.bright_pink, bold=true})

api.nvim_set_hl(0, 'DashboardFooter', {})

-- -- -- Git
api.nvim_set_hl(0, 'GitSignsAdd', {fg=colors.green})
api.nvim_set_hl(0, 'GitSignsChange', {fg=colors.yellow})
api.nvim_set_hl(0, 'GitSignsDelete', {fg=colors.red})
api.nvim_set_hl(0, 'GitSignsUntracked', {fg=colors.dark_pink})

-- -- -- Diagnostic / LSP

api.nvim_set_hl(0, 'DiagnosticSignError', {fg=colors.red})
api.nvim_set_hl(0, 'DiagnosticSignWarn', {fg=colors.yellow})
api.nvim_set_hl(0, 'DiagnosticSignInformation', {fg=colors.yellow})
api.nvim_set_hl(0, 'DiagnosticSignHint', {fg=colors.green})

api.nvim_set_hl(0, 'LspDiagnosticsVirtualTextInformation', {bg=colors.background, fg=colors.darker_blue})
api.nvim_set_hl(0, 'LspDiagnosticsVirtualTextWarning', {bg=colors.background, fg=colors.darker_yellow})
api.nvim_set_hl(0, 'LspDiagnosticsVirtualTextError', {bg=colors.background, fg=colors.darker_red})
api.nvim_set_hl(0, 'LspDiagnosticsVirtualTextHint', {bg=colors.background, fg=colors.darker_green})

api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', {bg=colors.background, fg=colors.darker_blue})
api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', {bg=colors.background, fg=colors.darker_yellow})
api.nvim_set_hl(0, 'DiagnosticVirtualTextError', {bg=colors.background, fg=colors.darker_red})
api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', {bg=colors.background, fg=colors.darker_green})
