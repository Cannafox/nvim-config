-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local api = vim.api
local lsp = vim.lsp
local diagnostic = vim.diagnostic
local keymap = vim.keymap
local fn = vim.fn
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
local set_qflist = function(buf_num, severity)
  local diagnostics = nil
  diagnostics = diagnostic.get(buf_num, { severity = severity })

  local qf_items = diagnostic.toqflist(diagnostics)
  vim.fn.setqflist({}, ' ', { title = 'Diagnostics', items = qf_items })
end
local custom_attach = function(client, bufnr)
  -- Mappings.
  local map = function(mode, l, r, opts)
    opts = opts or {}
    opts.silent = true
    opts.buffer = bufnr
    keymap.set(mode, l, r, opts)
  end

  map("n", "gd", vim.lsp.buf.definition, { desc = "go to definition" })
  map("n", "<C-]>", vim.lsp.buf.definition)
  map("n", "K", vim.lsp.buf.hover)
  map("n", "<C-k>", vim.lsp.buf.signature_help)
  map("n", "<space>rn", vim.lsp.buf.rename, { desc = "varialbe rename" })
  map("n", "gr", vim.lsp.buf.references, { desc = "show references" })
  map("n", "[d", diagnostic.goto_prev, { desc = "previous diagnostic" })
  map("n", "]d", diagnostic.goto_next, { desc = "next diagnostic" })
  -- this puts diagnostics from opened files to quickfix
  map("n", "<space>qw", diagnostic.setqflist, { desc = "put window diagnostics to qf" })
  -- this puts diagnostics from current buffer to quickfix
  map("n", "<space>qb", function() set_qflist(bufnr) end, { desc = "put buffer diagnostics to qf" })
  map("n", "<space>ca", vim.lsp.buf.code_action, { desc = "LSP code action" })
  map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, { desc = "add workspace folder" })
  map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, { desc = "remove workspace folder" })
  map("n", "<space>wl", function()
    inspect(vim.lsp.buf.list_workspace_folders())
  end, { desc = "list workspace folder" })

  -- Set some key bindings conditional on server capabilities
  if client.server_capabilities.documentFormattingProvider then
    map("n", "<space>f", vim.lsp.buf.format, { desc = "format code" })
  end

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
      if (cursor_pos[1] ~= vim.b.diagnostics_pos[1] or cursor_pos[2] ~= vim.b.diagnostics_pos[2])
          and #diagnostic.get() > 0
      then
        diagnostic.open_float(nil, float_opts)
      end

      vim.b.diagnostics_pos = cursor_pos
    end,
  })

  -- The blow command will highlight the current variable and its usages in the buffer.
  if client.server_capabilities.documentHighlightProvider then
    vim.cmd([[
      hi! link LspReferenceRead Visual
      hi! link LspReferenceText Visual
      hi! link LspReferenceWrite Visual
    ]])

    local gid = api.nvim_create_augroup("lsp_document_highlight", { clear = true })
    api.nvim_create_autocmd("CursorHold" , {
      group = gid,
      buffer = bufnr,
      callback = function ()
        lsp.buf.document_highlight()
      end
    })

    api.nvim_create_autocmd("CursorMoved" , {
      group = gid,
      buffer = bufnr,
      callback = function ()
        lsp.buf.clear_references()
      end
    })
  end

  if vim.g.logging_level == "debug" then
    local msg = string.format("Language server %s started!", client.name)
    vim.notify(msg, vim.log.levels.DEBUG, { title = "Nvim-config" })
  end
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require("lspconfig")

local venv_path = os.getenv('VIRTUAL_ENV')
local py_path = nil
-- decide which python executable to use for mypy
if venv_path ~= nil then
  py_path = venv_path .. "/bin/python3"
else
  py_path = vim.g.python3_host_prog
end

require("neodev").setup({})

lspconfig.pylsp.setup {
  on_attach = custom_attach,
  settings = {
    pylsp = {
      plugins = {
        -- formatter options
        black = { enabled = true },
        autopep8 = { enabled = false },
        yapf = { enabled = false },
        -- linter options
        pylint = { enabled = false, executable = "pylint" },
        ruff = { enabled = false },
        pyflakes = { enabled = false },
        pycodestyle = { enabled = false },
        -- type checker
        pylsp_mypy = {
          enabled = true,
          overrides = { "--python-executable", py_path, true },
          report_progress = true,
          live_mode = false
        },
        -- auto-completion options
        jedi_completion = { fuzzy = true },
        -- import sorting
        isort = { enabled = true },
      },
    },
  },
  flags = {
    debounce_text_changes = 200,
  },
  capabilities = capabilities,
}

-- if utils.executable('pyright') then
--   lspconfig.pyright.setup{
--     on_attach = custom_attach,
--     capabilities = capabilities
--   }
-- else
--   vim.notify("pyright not found!", vim.log.levels.WARN, {title = 'Nvim-config'})
-- end

lspconfig.clangd.setup {
  on_attach = custom_attach,
  capabilities = capabilities,
  filetypes = { "c", "cpp", "cc" },
  flags = {
    debounce_text_changes = 500,
  },
}

-- set up vim-language-server
lspconfig.vimls.setup {
  on_attach = custom_attach,
  flags = {
    debounce_text_changes = 500,
  },
  capabilities = capabilities,
}

-- set up bash-language-server
lspconfig.bashls.setup {
  on_attach = custom_attach,
  capabilities = capabilities,
}

  -- settings for lua-language-server can be found on https://github.com/LuaLS/lua-language-server/wiki/Settings .
lspconfig.lua_ls.setup {
  on_attach = custom_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files,
        -- see also https://github.com/LuaLS/lua-language-server/wiki/Libraries#link-to-workspace .
        -- Lua-dev.nvim also has similar settings for lua ls, https://github.com/folke/neodev.nvim/blob/main/lua/neodev/luals.lua .
        library = {
          vim.env.VIMRUNTIME,
          fn.stdpath("config"),
        },
        maxPreload = 2000,
        preloadFileSize = 50000,
      },
    },
  },
  capabilities = capabilities,
}

-- Change diagnostic signs.
fn.sign_define("DiagnosticSignError", { text = '', texthl = "DiagnosticSignError" })
fn.sign_define("DiagnosticSignWarn", { text = '', texthl = "DiagnosticSignWarn" })
fn.sign_define("DiagnosticSignInformation", { text = '', texthl = "DiagnosticSignInfo" })
fn.sign_define("DiagnosticSignHint", { text = '', texthl = "DiagnosticSignHint" })

-- global config for diagnostic
diagnostic.config {
  underline = false,
  virtual_text = false,
  signs = true,
  severity_sort = true,
}

-- lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
--   underline = false,
--   virtual_text = false,
--   signs = true,
--   update_in_insert = false,
-- })

-- Change border of documentation hover window, See https://github.com/neovim/neovim/pull/13998.
lsp.handlers["textDocument/hover"] = lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})
--   -- open quickfix by default
--   vim.cmd[[copen]]
-- end
-- api.nvim_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
-- api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
-- api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
-- api.nvim_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

-- -- Use an on_attach function to only map the following keys
-- -- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr)
--   -- Enable completion triggered by <c-x><c-o>
--   api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
--   -- Mappings.
--   -- See `:help vim.lsp.*` for documentation on any of the below functions
--   api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
--   api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
--   api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
--   api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
--   api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
--   api.nvim_buf_set_keymap(bufnr, "n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
--   api.nvim_buf_set_keymap(bufnr, "n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
--   api.nvim_buf_set_keymap(
--     bufnr,
--     "n",
--     "<space>wl",
--     "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
--     opts
--   )
--   api.nvim_buf_set_keymap(bufnr, "n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
--   api.nvim_buf_set_keymap(bufnr, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
--   api.nvim_buf_set_keymap(bufnr, "n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
--   api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
--   api.nvim_buf_set_keymap(bufnr, "n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

--   api.nvim_create_autocmd("CursorHold", {
--     buffer = bufnr,
--     callback = function()
--       local float_opts = {
--         focusable = false,
--         close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
--         border = "rounded",
--         source = "always", -- show source in diagnostic popup window
--         prefix = " ",
--       }

--       if not vim.b.diagnostics_pos then
--         vim.b.diagnostics_pos = { nil, nil }
--       end

--       local cursor_pos = api.nvim_win_get_cursor(0)
--       if
--         (cursor_pos[1] ~= vim.b.diagnostics_pos[1] or cursor_pos[2] ~= vim.b.diagnostics_pos[2])
--         and #diagnostic.get() > 0
--       then
--         diagnostic.open_float(nil, float_opts)
--       end

--       vim.b.diagnostics_pos = cursor_pos
--     end,
--   })
-- end
-- -- Update nvim-cmp capabilities and add them to each language server
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- local lspconfig = require("lspconfig")

-- require("neodev").setup({})

-- lspconfig.pylsp.setup({
--   on_attach = on_attach,
--   settings = {
--     pylsp = {
--       plugins = {
--         pylint = { enabled = true, executable = "pylint" },
--         pyflakes = { enabled = true },
--         pycodestyle = { enabled = true },
--         jedi_completion = { fuzzy = true },
--         pyls_isort = { enabled = true },
--         pylsp_mypy = { enabled = true },
--       },
--     },
--   },
--   flags = {
--     debounce_text_changes = 200,
--   },
--   capabilities = capabilities,
-- })

-- lspconfig.clangd.setup({
--   on_attach = on_attach,
--   filetypes = { "c", "cpp", "cc" },
--   flags = {
--     debounce_text_changes = 500,
--   },
--   capabilities = capabilities,
-- })

-- lspconfig.vimls.setup({
--   on_attach = on_attach,
--   flags = {
--     debounce_text_changes = 500,
--   },
--   capabilities = capabilities,
-- })

-- lspconfig.bashls.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
-- })

-- lspconfig.lua_ls.setup({
--   on_init = function(client)
--     local path = client.workspace_folders[1].name
--     if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
--       client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
--         Lua = {
--           diagnostic = {
--             globals = { 'vim' }
--           },
--           runtime = {
--             -- Tell the language server which version of Lua you're using
--             -- (most likely LuaJIT in the case of Neovim)
--             version = "LuaJIT",
--           },
--           -- Make the server aware of Neovim runtime files
--           workspace = {
--             checkThirdParty = false,
--             library = {
--               vim.env.VIMRUNTIME,
--               -- "${3rd}/luv/library"
--               -- "${3rd}/busted/library",
--             },
--             -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
--             -- library = vim.api.nvim_get_runtime_file("", true)
--           },
--         },
--       })

--       client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
--     end
--     return true
--   end,
-- })
-- lspconfig.texlab.setup({})

-- function add_capabilities()
--   for _, lsp in ipairs(servers) do
--     require("lspconfig")[lsp].setup({
--       capabilities = capabilities,
--       on_attach = on_attach,
--     })
--   end
-- end

-- diagnostic.config({
--   underline = true,
--   virtual_text = {
--     severity = { min = diagnostic.severity.WARN },
--   },
--   signs = true,
--   severity_sort = true,
-- })
-- fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
-- fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
-- fn.sign_define("DiagnosticSignInformation", { text = "", texthl = "DiagnosticSignInfo" })
-- fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
-- lsp.handlers["textDocument/hover"] = lsp.with(vim.lsp.handlers.hover, {
--   border = "rounded",
-- })
-- add_capabilities()
