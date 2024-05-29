local set_option = vim.opt

-- Font related
vim.scriptencoding = "utf-8"
set_option.guifont = "Iosevka Nerd Font Mono:style=Regular:h18"
set_option.encoding = "utf-8"
set_option.fileencoding = "utf-8"

-- Better actions
set_option.splitbelow = true
set_option.splitright = true
set_option.signcolumn = 'yes:1'

-- IDE related
set_option.tabstop = 2
set_option.softtabstop = 2
set_option.shiftwidth = 2
set_option.expandtab = true
set_option.smarttab = true
set_option.smartindent = true
set_option.incsearch = true
set_option.ignorecase = true
set_option.smartcase = true
set_option.wildmode = "longest:full,full"
set_option.smoothscroll = true
set_option.wildignore:append({
  '*.aux,*.out,*.toc',
  '*.o,*.obj,*.dll,*.jar,*.pyc,*.rbc,*.class',
  '*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp',
  '*.avi,*.m4a,*.mp3,*.oga,*.ogg,*.wav,*.webm',
  '*.eot,*.otf,*.ttf,*.woff',
  '*.doc,*.pdf',
  '*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz',
  -- Cache
  '.sass-cache',
  '*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*.gem',
  -- Temp/System
  '*.*~,*~ ',
  '*.swp,.lock,.DS_Store,._*,tags.lock'
})
set_option.laststatus = 3
set_option.showcmd = true
set_option.showmode = false
set_option.list = true
set_option.listchars = {
	eol = "󱞦",
	trail = "",
	extends = "",
	precedes = "",
}
set_option.number = true
set_option.relativenumber = true
set_option.completeopt =  "menu,menuone,noselect"
-- vim.opy.complete:remove({'w', 'b', 'u', 't'})
-- set_option.complete+=kspell complete-=w complete-=b complete-=u complete-=t
set_option.pumheight = 10
set_option.pumblend = 10
set_option.winblend = 0
set_option.spell = true
set_option.spelllang = { "en" }
-- set_option.spellsugest = set_option.spellsugest + 9
set_option.swapfile = false
set_option.updatetime = 500
set_option.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
set_option.shortmess:append({ W = true, I = true, c = true, C = true })
set_option.scrolloff = 4
set_option.sidescrolloff = 8
set_option.undofile = true
set_option.shiftround = true
set_option.grepprg = [[rg --hidden --glob "!.git" --no-heading --smart-case --vimgrep --follow $*]]
set_option.grepformat = "%f:%l:%c:%m"
set_option.formatexpr = "v:lua.require'lazyvim.util'.format.formatexpr()"
set_option.formatoptions = "jcroqlnt"
vim.opt.fileformat = "unix" 
set_option.mouse = "a"
vim.opt.mousescroll = "ver:2,hor:0"
set_option.linebreak = true
set_option.showbreak="↪"
set_option.timeoutlen = 500
set_option.fillchars= {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
} -- "fold: ,vert:│,eob: ,msgsep:‾,diff:"
set_option.fileencodings = { "utf-8", "ucs-bom", "utf-8", "cp936", "gb18030", "big5", "euc-jp", "euc-kr", "latin1" }
set_option.diffopt = {"vertical", "filler", "closeoff", "context:3", "internal,indent-heuristic,algorithm:histogram", "linematch:60"}
set_option.conceallevel = 2
set_option.cursorline = true
set_option.foldlevel = 99
set_option.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
set_option.foldmethod = "expr"
set_option.foldtext = ""
set_option.startofline = false
set_option.visualbell = false

set_option.wrap = false
set_option.ruler = false
set_option.autochdir = true
