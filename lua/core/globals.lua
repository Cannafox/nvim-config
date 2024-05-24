vim.g.mapleader = ","
vim.g.maplocalleader = ","

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_perl_provider = 0
vim.g.did_install_default_menus = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1

vim.g.asyncrun_rootmarks = { ".svn", ".git", ".root", ".bzr", "_darcs", "build.xml" }
vim.g.floaterm_width = 270
vim.g.floaterm_height = 220

vim.opt.diffopt = "vertical,filler,closeoff,context:3,internal,indent-heuristic,algorithm:histogram,linematch:60"

-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.foldenable = false

-- vim.o.guifont = "Iosevka Nerd Font Mono:style=Regular:h18"
-- vim.g.neovide_profiler = false
-- vim.g.neovide_cursor_vfx_mode = "pixiedust"
vim.g.python_host_prog = os.getenv("VIRTUAL_ENV") .. "/bin/python3" -- fn.exepath('python3')
vim.g.python3_host_prog = os.getenv("VIRTUAL_ENV") .. "/bin/python3"-- fn.exepath('python3')
vim.g.vimtex_view_method = 'zathura'
vim.g.vimsyn_embed = 'l'
vim.g.loaded_sql_completion = 1
