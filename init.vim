" Sokrati's Neovim Init.vim
" Vim-Plug
call plug#begin()

" Core
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/playground'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'nvim-lua/plenary.nvim'
Plug 'dyng/ctrlsf.vim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'junegunn/fzf',                { 'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim',            { 'commit': 'd5f1f86' }
Plug 'tiagovla/scope.nvim'
Plug 'davidmh/cspell.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v1.*', 'do': 'make install_jsregexp'} " Replace <CurrentMajor> by the latest released major (first number of latest release)


" Functionalities
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-signify'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-abolish'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'
" Plug 'chrisbra/Colorizer'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'KabbAmine/vCoolor.vim'
Plug 'dkarter/bullets.vim'
Plug 'wellle/context.vim'
Plug 'antoinemadec/FixCursorHold.nvim'

" Functionalities - Python
Plug 'psf/black', { 'branch': 'stable' }
Plug 'heavenshell/vim-pydocstring'

" Aesthetics - Colorschemes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'zaki/zazen'
Plug 'yuttie/hydrangea-vim'

" Aesthetics - Others
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-journal'

" User
Plug 'nvim-tree/nvim-web-devicons'
Plug 'glepnir/dashboard-nvim'

Plug 'folke/which-key.nvim'
Plug 'madox2/vim-ai'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'HiPhish/nvim-ts-rainbow2'
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install', 'for': 'markdown' }
Plug 'williamboman/mason.nvim', { 'do': ':MasonUpdate' }
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
call plug#end()
" Main Configurations
filetype plugin indent on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set wildmode=longest,list,full wildmenu
set ruler laststatus=2 showcmd showmode
set list listchars=trail:»,tab:»-
set fillchars+=vert:\
set wrap breakindent
set encoding=utf-8
scriptencoding utf-8
set textwidth=0
set hidden
set number
set title

" Filetype-Specific Configurations

let g:perl_host_prog = '/usr/bin/perl'

augroup filetype_specific
    autocmd!

    " HTML, XML, Jinja
    autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
    autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
    autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>

    " Markdown and Journal
    autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup END

" Coloring

" Functions and autocmds to run whenever changing colorschemes
function! TransparentBackground()
    highlight Normal guibg=NONE ctermbg=NONE
    highlight LineNr guibg=NONE ctermbg=NONE
    set fillchars+=vert:\│
    highlight WinSeparator gui=NONE guibg=NONE guifg=#ca7986 cterm=NONE ctermbg=NONE ctermfg=gray
    highlight VertSplit gui=NONE guibg=NONE guifg=#ca7986 cterm=NONE ctermbg=NONE ctermfg=gray
endfunction

" Use these colors for Pmenu, CmpPmenusBorder and TelescopeBorder when using dracula colorscheme
function! DraculaTweaks()
    " Pmenu colors when not using bordered windows
    highlight Pmenu guibg=#363948
    highlight PmenuSbar guibg=#363948
    " Completion/documentation Pmenu border color when using bordered windows
    highlight link CmpPmenuBorder NonText
    " Telescope borders
    highlight link TelescopeBorder Constant
endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme dracula call DraculaTweaks()
    autocmd ColorScheme * call TransparentBackground() " uncomment if you are using a translucent terminal and you want nvim to use that
augroup END

color dracula
set termguicolors

" Core plugin configuration (vim)

" Treesitter
augroup DraculaTreesitterSourcingFix
    autocmd!
    autocmd ColorScheme dracula runtime after/plugin/dracula.vim
    syntax on
augroup end

" nvim-cmp
set completeopt=menu,menuone,noselect

" signify
let g:signify_sign_add = '+'
let g:signify_sign_delete = '-'
let g:signify_sign_change = '!'
hi DiffDelete guifg=#ff5555 guibg=none

" indentLine
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_defaultGroup = 'NonText'
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_syntax_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" FixCursorHold for better performance
let g:cursorhold_updatetime = 100
let g:context_nvim_no_redraw = 1

" Neovim :Terminal
tmap <Esc> <C-\><C-n>
tmap <C-w> <Esc><C-w>
augroup enter_leave
    autocmd!
    autocmd BufWinEnter,WinEnter term://* startinsert
    autocmd BufLeave term://* stopinsert
augroup END

" Python
let g:python3_host_prog = '/usr/bin/python'
let g:pydocstring_doq_path = '~/.local/bin/doq'

" Core plugin configuration (lua)
lua << EOF
servers = {
    'pyright',
    'lua_ls',
    'vimls',
    'bashls',
    'html',
    'diagnosticls',
    'cssls',
    'clangd',
    'groovyls',
    'rust_analyzer',
    'rls',
}
require("cspell-config")
require('treesitter-config')
require('nvim-cmp-config')
require('lspconfig-config')
require('gitsigns-config')
require('telescope-config')
require('lualine-config')
require('nvim-tree-config')
require('diagnostics')
require('dashboard-config')
require('which-key-config')
require('groovyls-config')
require('colorizer-config')
require('null-ls-config')
require('scope-config')
require('bufferline-config')
require('vim-ai-config')
require('rls-config')
require('rust-anal-config')
require('mason-config')
EOF

" Custom Functions

" Trim Whitespaces
function! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction

augroup trim_whitespace_on_exit
    autocmd!
    autocmd BufWritePre * if !&binary && &ft !=# 'mail'
        \| call TrimWhitespace()
        \| endif
augroup END

" Custom Mappings (vim) (lua custom mappings are within individual lua config files)

" Core
let mapleader=','
nmap <leader>q :NvimTreeFindFileToggle<CR>
nmap \ <leader>q
nmap <leader>r :so ~/.config/nvim/init.vim<CR>
nmap <leader>t :call TrimWhitespace()<CR>
xmap <leader>a gaip*
nmap <leader>a gaip*
"nmap <leader>h :RainbowParentheses!!<CR>
nmap <leader>j :set filetype=journal<CR>
"nmap <leader>k :ColorToggle<CR>
nmap <leader>l :Limelight!!<CR>
xmap <leader>l :Limelight!!<CR>
nmap <silent> <leader><leader> :noh<CR>
" nmap <Tab> :bnext<CR>
" nmap <S-Tab> :bprevious<CR>
nmap <leader>$s <C-w>s<C-w>j:terminal<CR>:set nonumber<CR><S-a>
nmap <leader>$v <C-w>v<C-w>l:terminal<CR>:set nonumber<CR><S-a>

" Python
augroup python_related
    autocmd!
    autocmd Filetype python nmap <leader>d <Plug>(pydocstring)
    autocmd FileType python nmap <leader>p :Black<CR>
augroup END

" solidity
augroup solidity
    autocmd!
    autocmd Filetype solidity nmap <leader>p :0,$!npx prettier %<CR>
augroup END

" Telescope mappings

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fc <cmd>Telescope colorscheme<cr>
nnoremap <leader>f/ <cmd>Telescope current_buffer_fuzzy_find<cr>
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']']]

nnoremap <silent> <Tab> :BufferLineCycleNext<CR>
nnoremap <silent> <S-Tab> :BufferLineCyclePrev<CR>

" List of colors that you do not want. ANSI code or #RRGGBB
let g:rainbow#blacklist = [233, 234]
augroup set_colors_on_enter
    autocmd!
    autocmd VimEnter * RainbowParentheses
augroup END

" Save current file every time we leave insert mode or leave vim
augroup autoSaveAndRead
  autocmd!
  autocmd InsertLeave,FocusLost * call <SID>autosave()
  " autocmd WinLeave,FocusLost * call <SID>autosave()
  autocmd CursorHold * silent! checktime
augroup END

function! <SID>autosave()
  if &filetype !=# 'ctrlsf' && (filereadable(expand('%')) == 1)
    update
  endif
endfunction

let initial_prompt =<< trim END
>>> system

You are going to play a role of a completion engine with following parameters:
Task: Provide compact code/text completion, generation, transformation or explanation
Topic: general programming and text editing
Style: Plain result without any commentary, unless commentary is necessary
Audience: Users of text editor and programmers that need to transform/generate text
END

let chat_engine_config = {
\  "engine": "chat",
\  "options": {
\    "model": "gpt-3.5-turbo",
\    "max_tokens": 1000,
\    "temperature": 0.1,
\    "request_timeout": 20,
\    "selection_boundary": "",
\    "initial_prompt": initial_prompt,
\  },
\}

" NOTE: You can use other key to expand snippet.

" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)

" If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']

let g:vim_ai_complete = chat_engine_config
let g:vim_ai_edit = chat_engine_config

nnoremap <esc> :call <SID>autosave()<CR>
