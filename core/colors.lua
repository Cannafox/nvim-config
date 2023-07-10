local api = vim.api

-- Moje kolorki

local colors = {
  dusty_pink = "#ba7b7c",
  bright_pink = "#f70780",
  red = "#ff0000",
  black = "#000000",
  blue = "#00AAFF",
  green = "#00FF00",
  yellow = "#FFFF00",
  very_bright_pink = "#f70071"
}

-- Syntax
api.nvim_set_hl(0, 'Comment', {italic=true, fg=colors.dusty_pink})

-- Buffer specific
api.nvim_set_hl(0, 'EndOfBuffer', {fg=colors.dusty_pink})
api.nvim_set_hl(0, 'LineNr', {fg=colors.bright_pink})
api.nvim_set_hl(0, 'LineNrAbove', {fg=colors.dusty_pink})
api.nvim_set_hl(0, 'LineNrBelow', {fg=colors.dusty_pink})
api.nvim_set_hl(0, 'NonText', {fg=colors.dusty_pink})
api.nvim_set_hl(0, 'Pmenu', {fg=colors.bright_pink, bg=colors.black})
api.nvim_set_hl(0, 'PmenuSel', {fg=colors.black, bg=colors.dusty_pink})
api.nvim_set_hl(0, 'SignColumn', {bg = colors.black})

-- Git
api.nvim_set_hl(0, 'GitSignsAdd', {fg=colors.green})
api.nvim_set_hl(0, 'GitSignsChange', {fg=colors.yellow})
api.nvim_set_hl(0, 'GitSignsDelete', {fg=colors.red})
api.nvim_set_hl(0, 'GitSignsUntracked', {fg=colors.red})

-- Diagnostic / LSP

api.nvim_set_hl(0, 'DiagnosticSignError', {fg=colors.red})
api.nvim_set_hl(0, 'DiagnosticSignWarn', {fg=colors.yellow})
api.nvim_set_hl(0, 'DiagnosticSignInformation', {fg=colors.blue})
api.nvim_set_hl(0, 'DiagnosticSignHint', {fg=colors.green})
