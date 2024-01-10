require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { 'bashls', 'clangd', 'cmake', 'autotools_ls', 'diagnosticls', 'dockerls', 'dotls', 'html', 'jsonls', 'lua_ls', 'marksman', 'pylsp', 'vimls', 'yamlls' }
})
