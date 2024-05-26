vim.scriptencoding = "utf-8"
vim.opt.termguicolors = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.signcolumn = 'yes:2'

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wildmode = "list:longest"
vim.opt.wildignore:append {
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
}
vim.opt.laststatus = 2
vim.opt.showcmd = true
vim.opt.showmode = false
vim.opt.list = true
vim.opt.listchars = {
	eol = "󱞦",
	trail = "",
	extends = "",
	precedes = "",
}
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.completeopt:append {"menuone", "noinsert", "noselect", "popup"}
-- vim.opt.complete:append {"kspell"}
-- vim.opy.complete:remove({'w', 'b', 'u', 't'})
-- vim.opt.complete+=kspell complete-=w complete-=b complete-=u complete-=t
vim.opt.pumheight = 10
vim.opt.pumblend = 10
vim.opt.winblend = 0
vim.opt.spell = true
vim.opt.spelllang = { "en", "pl" }
-- vim.opt.spellsugest = vim.opt.spellsugest + 9
vim.opt.swapfile = false
vim.opt.updatetime = 500
vim.opt.scrolloff = 3
vim.opt.undofile = true
vim.opt.shiftround = true
vim.opt.grepprg = [[rg --hidden --glob "!.git" --no-heading --smart-case --vimgrep --follow $*]]
vim.opt.grepformat = "%f:%l:%c:%m"
-- vim.o.fileformat = "unix,dos"
vim.opt.mouse = "nic"
vim.opt.mousemodel = "popup"
vim.o.mousescroll = "ver:2,hor:0"
vim.opt.linebreak = true
vim.opt.showbreak="↪"
vim.opt.timeoutlen = 500
vim.opt.fillchars= {fold = " ", vert = "|", eob=" ", msgsep="‾"} -- "fold: ,vert:│,eob: ,msgsep:‾,diff:"
vim.opt.fileencodings = { "utf-8", "ucs-bom", "utf-8", "cp936", "gb18030", "big5", "euc-jp", "euc-kr", "latin1" }
vim.opt.diffopt = {"vertical", "filler", "closeoff", "context:3", "internal,indent-heuristic,algorithm:histogram", "linematch:60"}
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "tree sitter#foldexpr()"
-- vim.opt.foldenable = false
vim.opt.startofline = false
vim.opt.visualbell = false

vim.opt.wrap = false
vim.opt.ruler = false
vim.opt.autochdir = true
