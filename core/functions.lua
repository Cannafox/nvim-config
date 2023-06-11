function TransparentBackground()
  vim.api.nvim_set_hl(0, 'Normal', {guibg="NONE", ctermbg="NONE"})
  vim.api.nvim_set_hl(0, 'LineNr', {guibg="NONE", ctermbg="NONE"})
  vim.opt.fillchars:append({"vert:│"})
  vim.api.nvim_set_hl(0, 'WinSeparator', {gui="NONE", guibg="NONE", ctermbg="NONE", cterm="NONE", guifg="#ca7986", ctermfg="gray"})
  vim.api.nvim_set_hl(0, 'VertSplit', {gui="NONE", guibg="NONE", ctermbg="NONE", cterm="NONE", guifg="#ca7986", ctermfg="gray"})
end
