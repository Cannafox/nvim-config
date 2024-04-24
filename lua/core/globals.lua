local set = vim.opt
local g = vim.g

g.mapleader = ","
g.maplocalleader = ","

set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.smarttab = true
set.autoindent = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true
set.hlsearch = false
set.wildmode = { "longest", "list", "full" }
set.wildmenu = true
set.ruler = true
set.laststatus = 2
set.showcmd = true
set.showmode = true
set.list = true
set.listchars = {
	eol = "󱞦",
	trail = "󱑼",
	extends = "",
	precedes = "",
}
set.wrap = true
set.breakindent = true
set.encoding = "utf-8"
vim.scriptencoding = "utf-8"
set.textwidth = 0
set.hidden = true
set.number = true
set.relativenumber = true
set.title = true

g["vista#renderer#icons"] = { member = "" }
g["rainbow#blacklist"] = { 233, 234 }
g["rainbow#max_level"] = 16
g["rainbow#pairs"] = { { "(", ")" }, { "[", "]" } }

g.vista_echo_cursor = true
g.vista_stay_on_open = true
g.neoformat_enabled_python = { "autopep8", "yapf" }
g.neoformat_try_formatprg = 1
g.neoformat_cpp_clangformat = {
	exe = "clang-format",
	args = { '--style="{IndentWidth: 4}"' },
}
g.neoformat_c_clangformat = {
	exe = "clang-format",
	args = { '--style="{IndentWidth: 4}"' },
}

g.neoformat_enabled_cpp = { "clangformat" }
g.neoformat_enabled_c = { "clangformat" }

g.neoformat_basic_format_align = 1
g.neoformat_basic_format_trim = 1
g.neoformat_basic_retab = 0
g.neoformat_run_all_formatters = 1

g.vim_markdown_folding_disabled = true
g.vim_markdown_conceal = true
g.vim_markdown_math = false
g.vim_markdown_frontmatter = true
g.vim_markdown_toml_frontmatter = true
g.vim_markdown_json_frontmatter = true
g.vim_markdown_toc_autofit = true

g.matchup_matchparen_deferred = true
g.matchup_matchparen_timeout = 100
g.matchup_matchparen_insert_timeout = 30

g.matchup_override_vimtex = true

g.matchup_delim_noskips = false

g.matchup_matchparen_offscreen = { method = "popup" }
g.asyncrun_open = 4
g.indentLine_defaultGroup = "NonText"
g.vim_json_syntax_conceal = false
g.vim_markdown_syntax_conceal = false
g.vim_markdown_conceal_code_blocks = false
g.cursorhold_updatetime = 100
g.context_nvim_no_redraw = true
g.UltiSnipsSnippetDirectories = { "UltiSnips", "my_snippets" }
set.completeopt = { "menu", "menuone", "noselect" }

set.matchpairs:append({ "<:>", "「:」", "『:』", "【:】", "“:”", "‘:’", "《:》" })

set.fileencodings = { "utf-8", "ucs-bom", "utf-8", "cp936", "gb18030", "big5", "euc-jp", "euc-kr", "latin1" }

set.linebreak = true

set.scrolloff = 3
set.undofile = true
set.pumheight = 10
set.pumblend = 10
set.winblend = 0
set.spelllang = { "en", "pl" }
set.shiftround = true
set.grepprg = [[rg --hidden --glob "!.git" --no-heading --smart-case --vimgrep --follow $*]]
set.grepformat = "%f:%l:%c:%m"
g.asyncrun_rootmarks = { ".svn", ".git", ".root", ".bzr", "_darcs", "build.xml" }
g.floaterm_width = 70
g.floaterm_height = 20

set.diffopt = "vertical,filler,closeoff,context:3,internal,indent-heuristic,algorithm:histogram,linematch:60"

set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"
set.foldenable = false

vim.o.guifont = "Iosevka Nerd Font Mono:style=Regular:h18"
g.neovide_profiler = false
g.neovide_cursor_vfx_mode = "pixiedust"
set.swapfile = false
g.python_host_prog = "/usr/bin/python"
g.python3_host_prog = "/usr/bin/python3"
g.vimtex_view_method = 'zathura'
