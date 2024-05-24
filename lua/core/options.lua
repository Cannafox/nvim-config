vim.scriptencoding = "utf-8"
vim.opt.termguicolors = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
-- vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wildmode = { "longest"}
vim.opt.ruler = false
vim.opt.laststatus = 2
vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.list = true
vim.opt.listchars = {
	eol = "󱞦",
	trail = "",
	extends = "",
	precedes = "",
}
vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.textwidth = 0
vim.opt.hidden = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.completeopt:append({"menuone"})
vim.opt.complete:append({"kspell"})
vim.opt.pumheight = 10
vim.opt.pumblend = 10
vim.opt.winblend = 0
vim.opt.spell = true
vim.opt.spelllang = { "en", "pl" }
-- vim.opt.spellsugest = 9
vim.opt.swapfile = false
vim.opt.updatetime = 500
vim.opt.scrolloff = 3
vim.opt.undofile = true
vim.opt.shiftround = true
vim.opt.grepprg = [[rg --hidden --glob "!.git" --no-heading --smart-case --vimgrep --follow $*]]
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.mouse = "nic"
vim.opt.mousemodel = "popup"
vim.opt.mousescroll = "ver:2,hor:0"
vim.opt.linebreak = true
vim.opt.showbreak="↪"
vim.opt.timeoutlen = 500
vim.opt.fillchars= {fold = " ", vert = "|", eob=" ", msgsep="‾"} -- "fold: ,vert:│,eob: ,msgsep:‾,diff:"
vim.opt.matchpairs:append({ "<:>", "「:」", "『:』", "【:】", "“:”", "‘:’", "《:》" })
vim.opt.fileencodings = { "utf-8", "ucs-bom", "utf-8", "cp936", "gb18030", "big5", "euc-jp", "euc-kr", "latin1" }
