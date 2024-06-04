local Plugin = { "kevinhwang91/nvim-ufo" }

Plugin.dependencies = { "kevinhwang91/promise-async" }

Plugin.config = function()
  vim.o.foldcolumn = "1"
  vim.o.foldlevel = 99
  vim.o.foldlevelstart = 99
  vim.o.foldenable = true

  vim.keymap.set("n", "zR", require("ufo").openAllFolds)
  vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }
  local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
  for _, ls in ipairs(language_servers) do
    require("lspconfig")[ls].setup({
      capabilities = capabilities,
    })
  end
  require("ufo").setup()
end

return Plugin