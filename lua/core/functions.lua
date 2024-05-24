

-- function TransparentBackground()
--   vim.api.nvim_set_hl(0, 'Normal', {guibg="NONE", ctermbg="NONE"})
--   vim.api.nvim_set_hl(0, 'LineNr', {guibg="NONE", ctermbg="NONE"})
--   vim.opt.fillchars:append({"vert:│"})
--   vim.api.nvim_set_hl(0, 'WinSeparator', {gui="NONE", guibg="NONE", ctermbg="NONE", cterm="NONE", guifg="#ca7986", ctermfg="gray"})
--   vim.api.nvim_set_hl(0, 'VertSplit', {gui="NONE", guibg="NONE", ctermbg="NONE", cterm="NONE", guifg="#ca7986", ctermfg="gray"})
-- end

-- vim.cmd([[
--   call timer_start(250, { -> s:wilder_init() })

--   function! s:wilder_init() abort
--     try
--       call wilder#setup({
--           \ 'modes': [':', '/', '?'],
--           \ 'next_key': '<Tab>',
--           \ 'previous_key': '<S-Tab>',
--           \ 'accept_key': '<C-y>',
--           \ 'reject_key': '<C-e>'
--           \ })

--       call wilder#set_option('pipeline', [
--           \   wilder#branch(
--           \     wilder#cmdline_pipeline({
--           \       'language': 'python',
--           \       'fuzzy': 1,
--           \       'sorter': wilder#python_difflib_sorter(),
--           \       'debounce': 30,
--           \     }),
--           \     wilder#python_search_pipeline({
--           \       'pattern': wilder#python_fuzzy_pattern(),
--           \       'sorter': wilder#python_difflib_sorter(),
--           \       'engine': 're',
--           \       'debounce': 30,
--           \     }),
--           \   ),
--           \ ])

--       call wilder#set_option('renderer', wilder#popupmenu_renderer({
--           \ 'highlighter': wilder#basic_highlighter(),
--           \ 'max_height': 15,
--           \ 'left': [' ', wilder#popupmenu_devicons(),],
--           \ 'right': [' ', wilder#popupmenu_scrollbar(),],
--           \ 'apply_incsearch_fix': 0,
--           \ }))
--   catch /^Vim\%((\a\+)\)\=:E117/
--     echohl Error |echomsg "Wilder.nvim missing: run :PackerSync to fix."|echohl None
--   endtry
-- endfunction
-- ]])
