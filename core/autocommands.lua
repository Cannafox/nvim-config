local aucmd = vim.api.nvim_create_autocmd
local augrp = vim.api.nvim_create_augroup

augrp('YankHighlight', {clear = true})
aucmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({higroup = 'IncSearch', timeout = '1000'})
  end
})

augrp('RestoreAfterYank', {clear = true})
aucmd("TextYankPost", {
  pattern = "*",
  group = 'RestoreAfterYank',
  callback = function()
    vim.cmd([[
      silent! normal! `y
      silent! delmarks y
    ]])
  end,
})

augrp('TrailSpaceOnSave', {clear = true})
aucmd('BufWritePre', {
  group = 'TrailSpaceOnSave',
  pattern = '',
  command = ':%s/\\s\\+$//e'
})

augrp('DontAutoCommentNLines', { clear = true })
aucmd('BufEnter', {
  group = 'DontAutoCommentNLines',
  pattern = '',
  command = 'set fo-=c fo-=r fo-=o'
})

augrp('setLineLength', { clear = true })
aucmd('Filetype', {
  group = 'setLineLength',
  pattern = { 'text', 'markdown', 'html', 'xhtml', 'javascript', 'typescript' },
  command = 'setlocal cc=0'
})
augrp('setIndent', { clear = true })
aucmd('Filetype', {
  group = 'setIndent',
  pattern = { 'xml', 'html', 'xhtml', 'css', 'scss', 'javascript', 'typescript',
    'yaml', 'lua'
  },
  command = 'setlocal shiftwidth=2 tabstop=2'
})
augrp('termPos', { clear = true })
aucmd('CmdlineEnter', {
  group = 'termPos',
  command = 'command! Term :botright vsplit term://$SHELL'
})

-- Enter insert mode when switching to terminal
augrp('termUi', { clear = true })
aucmd('TermOpen', {
  group = 'termUi',
  command = 'setlocal listchars= nonumber norelativenumber nocursorline',
})
augrp('termInsertMode', { clear = true })
aucmd('TermOpen', {
  group = 'termInsertMode',
  pattern = '',
  command = 'startinsert'
})
augrp('termInsertMode', { clear = true })
aucmd('TermOpen', {
  group = 'termInsertMode',
  pattern = '',
  command = 'startinsert'
})

-- Close terminal buffer on process exit
augrp('termLeave', { clear = true })
aucmd('BufLeave', {
  group = 'termLeave',
  pattern = 'term://*',
  command = 'stopinsert'
})
augrp('pythonRelated', { clear = true })
aucmd('Filetype', {
  group = 'pythonRelated',
  pattern = 'python',
  command = 'nmap <leader>d <Plug>(pydocstring)'
})
aucmd('Filetype', {
  group = 'pythonRelated',
  pattern = 'python',
  command = 'nmap <leader>p :Black<CR>'
})
augrp('dynamic_smartcase', { clear = true })
aucmd('CmdLineEnter', {
  group = 'dynamic_smartcase',
  command = 'set nosmartcase'
})
aucmd('CmdLineLeave', {
  group = 'dynamic_smartcase',
  command = 'set smartcase'
})
augrp('acc_syntax_hl', { clear = true })
aucmd('BufEnter', {
  group = 'acc_syntax_hl',
  command = 'syntax sync fromstart'
})
