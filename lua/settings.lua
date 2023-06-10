local set = vim.opt
vim.scriptencoding = 'utf-8'
vim.color = 'dracula'
set.tabstop=4
set.softtabstop=4
set.shiftwidth=4
set.expandtab=true
set.smarttab=true
set.autoindent=true
set.incsearch=true
set.ignorecase=true
set.smartcase=true
set.hlsearch=true
set.wildmode={'longest', 'list', 'full'}
set.wildmenu=true
set.ruler=true
set.laststatus=2
set.showcmd=true
set.showmode=true
set.list=true
set.wrap=true
set.breakindent=true
set.encoding='utf-8'
set.textwidth=0
set.hidden=true
set.number = true
set.title=true
set.completeopt={'menu', 'menuone', 'noselect'}

vim.g.perl_host_prog = '/usr/bin/perl'
vim.g.python3_host_prog = '/usr/bin/python'
vim.g.pydocstring_doq_path = '~/.local/bin/doq'

vim.g.signify_sign_add = '+'
vim.g.signify_sign_delete = '-'
vim.g.signify_sign_change = '!'

vim.g.indentLine_char_list = {'|', '¦', '┆', '┊'}
vim.g.indentLine_defaultGroup = 'NonText'
vim.g.vim_json_syntax_conceal = 0
vim.g.vim_markdown_syntax_conceal = 0
vim.g.vim_markdown_conceal_code_blocks = 0

vim.g.cursorhold_updatetime = 100
vim.g.context_nvim_no_redraw = 1
