-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local servers = {
  "bashls",
  "clangd",
  "cmake",
  "autotools_ls",
  "diagnosticls",
  "dockerls",
  "dotls",
  "html",
  "jsonls",
  "lua_ls",
  "marksman",
  "pylsp",
  "yamlls",
  "texlab",
}
local opts = { noremap = true, silent = true }
local api = vim.api
local lsp = vim.lsp
local diagnostic = vim.diagnostic
local fn = vim.fn
api.nvim_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
api.nvim_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  api.nvim_buf_set_keymap(bufnr, "n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  api.nvim_buf_set_keymap(bufnr, "n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<space>wl",
    "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
    opts
  )
  api.nvim_buf_set_keymap(bufnr, "n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  api.nvim_buf_set_keymap(bufnr, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  api.nvim_buf_set_keymap(bufnr, "n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  api.nvim_buf_set_keymap(bufnr, "n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      local float_opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = "rounded",
        source = "always", -- show source in diagnostic popup window
        prefix = " ",
      }

      if not vim.b.diagnostics_pos then
        vim.b.diagnostics_pos = { nil, nil }
      end

      local cursor_pos = api.nvim_win_get_cursor(0)
      if
        (cursor_pos[1] ~= vim.b.diagnostics_pos[1] or cursor_pos[2] ~= vim.b.diagnostics_pos[2])
        and #diagnostic.get() > 0
      then
        diagnostic.open_float(nil, float_opts)
      end

      vim.b.diagnostics_pos = cursor_pos
    end,
  })
end
-- Update nvim-cmp capabilities and add them to each language server
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

lspconfig.pylsp.setup({
  on_attach = on_attach,
  settings = {
    pylsp = {
      plugins = {
        pylint = { enabled = true, executable = "pylint" },
        pyflakes = { enabled = true },
        pycodestyle = { enabled = true },
        jedi_completion = { fuzzy = true },
        pyls_isort = { enabled = true },
        pylsp_mypy = { enabled = true },
      },
    },
  },
  flags = {
    debounce_text_changes = 200,
  },
  capabilities = capabilities,
})

lspconfig.clangd.setup({
  on_attach = on_attach,
  filetypes = { "c", "cpp", "cc" },
  flags = {
    debounce_text_changes = 500,
  },
  capabilities = capabilities,
})

lspconfig.vimls.setup({
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 500,
  },
  capabilities = capabilities,
})

lspconfig.bashls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.lua_ls.setup({
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
      client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
        Lua = {
          diagnostic = {
            globals = { 'vim' }
          },
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = "LuaJIT",
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            },
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
            -- library = vim.api.nvim_get_runtime_file("", true)
          },
        },
      })

      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
    return true
  end,
})
lspconfig.texlab.setup({})

function add_capabilities()
  for _, lsp in ipairs(servers) do
    require("lspconfig")[lsp].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end
end

diagnostic.config({
  underline = true,
  virtual_text = {
    severity = { min = diagnostic.severity.ERROR },
  },
  signs = true,
  severity_sort = true,
})
fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
fn.sign_define("DiagnosticSignInformation", { text = "", texthl = "DiagnosticSignInfo" })
fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
lsp.handlers["textDocument/hover"] = lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})
add_capabilities()
