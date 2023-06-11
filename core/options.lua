local set = vim.opt

set.completeopt = {'menu', 'menuone', 'noselect'}

set.matchpairs:append({"<:>","「:」","『:』","【:】","“:”","‘:’","《:》"})

set.fileencoding="utf-8"
set.fileencodings= { "ucs-bom","utf-8","cp936","gb18030","big5","euc-jp","euc-kr","latin1"}

set.linebreak = true
set.wildmode = "list:longest"

set.scrolloff = 3
set.undofile = true
set.pumheight = 10
set.pumblend = 10
set.winblend = 0
set.spelllang = {'en', 'pl'}
set.shiftround = true
set.grepprg = [[rg --hidden --glob "!.git" --no-heading --smart-case --vimgrep --follow $*]]
set.grepformat='%f:%l:%c:%m'

set.termguicolors = true

set.diffopt = 'vertical,filler,closeoff,context:3,internal,indent-heuristic,algorithm:histogram,linematch:60'

set.wrap = false
set.ruler = false
