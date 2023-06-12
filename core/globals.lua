local set = vim.opt
set.termguicolors = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.smarttab = true
set.autoindent = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true
set.hlsearch = true
set.wildmode = {'longest', 'list', 'full'}
set.wildmenu = true
set.ruler = false
set.laststatus = 2
set.showcmd = true
set.showmode = true
set.list = true
set.listchars = {
  eol = '⤶',
  trail = '❤',
  extends = '◀',
  precedes = '▶',
}
set.wrap = false
set.breakindent = true
set.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'
set.textwidth = 0
set.hidden = true
set.number = true
set.relativenumber = true
set.title = true

vim.g['vista#renderer#icons'] = {member = ''}

vim.g.vista_echo_cursor = 1
vim.g.vista_stay_on_open = 1
vim.g.neoformat_enabled_python = {'black', 'yapf'}
vim.g.neoformat_cpp_clangformat = {
      exe = 'clang-format',
      args = {'--style="{IndentWidth: 4}"'}
}
vim.g.neoformat_c_clangformat = {
      exe = 'clang-format',
      args = {'--style="{IndentWidth: 4}"'}
}

vim.g.neoformat_enabled_cpp = {'clangformat'}
vim.g.neoformat_enabled_c = {'clangformat'}

vim.g.vim_markdown_folding_disabled = 1
vim.g.vim_markdown_conceal = 1
vim.g.vim_markdown_math = 0
vim.g.vim_markdown_frontmatter = 1
vim.g.vim_markdown_toml_frontmatter = 1
vim.g.vim_markdown_json_frontmatter = 1
vim.g.vim_markdown_toc_autofit = 1

vim.g.matchup_matchparen_deferred = 1
vim.g.matchup_matchparen_timeout = 100
vim.g.matchup_matchparen_insert_timeout = 30

vim.g.matchup_override_vimtex = 1

vim.g.matchup_delim_noskips = 0

vim.g.matchup_matchparen_offscreen = {method = 'popup'}
vim.g.asyncrun_open = 4
