local set_global = vim.g
local set_optional = vim.opt

set_optional.termguicolors = true
set_global.autoformat = false
set_global.root_spec = { "lsp", { ".git", "lua" }, "cwd" }
set_global.lazygit_config = true
set_global.deprecation_warnings = false

-- IDE settings
set_global.mapleader = ","
set_global.maplocalleader = ","

-- Provider settings
if os.getenv("VIRTUAL_ENV") ~= nil then
  set_global.python3_host_prog = os.getenv("VIRTUAL_ENV") .. "/bin/python3"
else
  set_global.python3_host_prog = vim.fn.exepath("python3")
end
set_global.loaded_perl_provider = 0
set_global.loaded_ruby_provider = 0
set_global.loaded_node_perl_provider = 0
set_global.did_install_default_menus = 1
set_global.loaded_matchit = 1
set_global.loaded_matchparen = 1

set_global.asyncrun_rootmarks = { ".svn", ".git", ".root", ".bzr", "_darcs", "build.xml" }
set_global.floaterm_width = 70
set_global.floaterm_height = 20

set_global.vimtex_view_method = "zathura"
set_global.vimsyn_embed = "l"
set_global.loaded_sql_completion = 1
