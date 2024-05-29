-- function user.on_attach(event)
--   local bufmap = function(mode, lhs, rhs)
--     local opts = {buffer = event.buf}
--     vim.keymap.set(mode, lhs, rhs, opts)
--   end
local Plugin = { "neovim/nvim-lspconfig" }
local user = {}

Plugin.dependencies = {
	{"folke/neoconf.nvim", cmd = "Neoconf", config=false, dependencies = { "nvim-lspconfig"}},
	{ "folke/neodev.nvim", opts = {} },
	"mason.nvim",
	{'hrsh7th/cmp-nvim-lsp'},
	"williamboman/mason-lspconfig.nvim"
}
Plugin.cmd = {"LspInfo", "LspInstall", "LspUninstall"}
Plugin.event = {"BufReadPre", "BufNewFile"}


local set_qflist = function(buf_num, severity)
  local diagnostics = nil
  diagnostics = vim.diagnostic.get(buf_num, { severity = severity })

  local qf_items = vim.diagnostic.toqflist(diagnostics)
  vim.fn.setqflist({}, ' ', { title = 'Diagnostics', items = qf_items })

-- open quickfix by default
  vim.cmd[[copen]]
end

local custom_attach = function(client, bufnr)
  -- Mappings.
  local map = function(mode, l, r, opts)
    opts = opts or {}
    opts.silent = true
    opts.buffer = bufnr
    vim.keymap.set(mode, l, r, opts)
  end

  map("n", "gd", vim.lsp.buf.definition, { desc = "go to definition" })
  map("n", "<C-]>", vim.lsp.buf.definition)
  map("n", "K", vim.lsp.buf.hover)
  map("n", "<C-k>", vim.lsp.buf.signature_help)
  map("n", "<space>rn", vim.lsp.buf.rename, { desc = "varialbe rename" })
  map("n", "gr", vim.lsp.buf.references, { desc = "show references" })
  map("n", "[d", vim.diagnostic.goto_prev, { desc = "previous diagnostic" })
  map("n", "]d", vim.diagnostic.goto_next, { desc = "next diagnostic" })
  -- this puts diagnostics from opened files to quickfix
  map("n", "<space>qw", vim.diagnostic.setqflist, { desc = "put window diagnostics to qf" })
  -- this puts diagnostics from current buffer to quickfix
  map("n", "<space>qb", function() set_qflist(bufnr) end, { desc = "put buffer diagnostics to qf" })
  map("n", "<space>ca", vim.lsp.buf.code_action, { desc = "LSP code action" })
  map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, { desc = "add workspace folder" })
  map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, { desc = "remove workspace folder" })
  map("n", "<space>wl", function()
    inspect(vim.lsp.buf.list_workspace_folders())
  end, { desc = "list workspace folder" })

  -- Set some key bindings conditional on server capabilities

  vim.api.nvim_create_autocmd("CursorHold", {
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

      local cursor_pos = vim.api.nvim_win_get_cursor(0)
      if (cursor_pos[1] ~= vim.b.diagnostics_pos[1] or cursor_pos[2] ~= vim.b.diagnostics_pos[2])
          and table.getn(vim.diagnostic.get()) > 0
      then
        vim.diagnostic.open_float(nil, float_opts)
      end

      vim.b.diagnostics_pos = cursor_pos
    end,
  })

  local gid = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
  vim.api.nvim_create_autocmd("CursorHold" , {
    group = gid,
    buffer = bufnr,
    callback = function ()
      vim.lsp.buf.document_highlight()
    end
  })

  vim.api.nvim_create_autocmd("CursorMoved" , {
    group = gid,
    buffer = bufnr,
    callback = function ()
      vim.lsp.buf.clear_references()
    end
  })

  if vim.g.logging_level == "debug" then
    local msg = string.format("Language server %s started!", client.name)
    vim.notify(msg, vim.log.levels.DEBUG, { title = "Nvim-config" })
  end
end
function Plugin.init()
  local group = vim.api.nvim_create_augroup('lsp_cmds', {clear = true})
  vim.api.nvim_create_autocmd('LspAttach', {
    group = group,
    desc = 'LSP actions',
    callback = custom_attach
  })

  local sign = function(opts)
    -- See :help sign_define()
    vim.fn.sign_define(opts.name, {
      texthl = opts.name,
      text = opts.text,
      numhl = ''
    })
  end

  sign({name = 'DiagnosticSignError', text = '✘'})
  sign({name = 'DiagnosticSignWarn', text = '▲'})
  sign({name = 'DiagnosticSignHint', text = '⚑'})
  sign({name = 'DiagnosticSignInfo', text = '»'})

  -- See :help vim.diagnostic.config()
  vim.diagnostic.config({
    virtual_text = false,
    severity_sort = false,
    float = {
      border = 'rounded',
      source = 'always',
    },
  })
  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    {border = 'rounded'}
  )
  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    {border = 'rounded'}
  )
end


function Plugin.config()

  require('mason').setup({})
  require('mason-lspconfig').setup({})

  local lspconfig = require('lspconfig')
  local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

  lspconfig.autotools_ls.setup({
    on_attach = custom_attach,
    capabilities = lsp_capabilities,
  })
  lspconfig.pylsp.setup({
    on_attach = custom_attach,
    settings = {
      pylsp = {
        plugins = {
          -- formatter options
          black = { enabled = true },
          autopep8 = { enabled = false },
          yapf = { enabled = false },
          -- linter options
          pylint = { enabled = true, executable = "pylint" },
          ruff = { enabled = false },
          pyflakes = { enabled = false },
          pycodestyle = { enabled = false },
          -- type checker
          pylsp_mypy = {
            enabled = true,
            overrides = { "--python-executable", vim.fn.exepath('python3'), true },
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
    capabilities = lsp_capabilities,
  })
  lspconfig.dotls.setup({
    on_attach = custom_attach,
    capabilities = lsp_capabilities,
  })
  lspconfig.vimls.setup({
    on_attach = custom_attach,
    capabilities = lsp_capabilities,
  })
  lspconfig.dockerls.setup({
    on_attach = custom_attach,
    capabilities = lsp_capabilities,
  })
  lspconfig.cmake.setup({
    on_attach = custom_attach,
    capabilities = lsp_capabilities,
  })
  lspconfig.gradle_ls.setup({
    on_attach = custom_attach,
    capabilities = lsp_capabilities,
  })
  lspconfig.marksman.setup({
    on_attach = custom_attach,
    capabilities = lsp_capabilities,
  })
  lspconfig.lua_ls.setup({
    on_attach = custom_attach,
    settings = {
      Lua = {
        hint = {
              enable = true,
              setType = false,
              paramType = true,
              paramName = "Disable",
              semicolon = "Disable",
              arrayIndex = "Disable",
            },
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
            vim.fn.stdpath("config"),
          },
          maxPreload = 2000,
          preloadFileSize = 50000,
        },
      },
    },
    capabilities = lsp_capabilities,
  })
  lspconfig.html.setup({
    on_attach = custom_attach,
    capabilities = lsp_capabilities,
  })
  lspconfig.bashls.setup({
    on_attach = custom_attach,
    capabilities = lsp_capabilities,
  })
  lspconfig.grammarly.setup({
    on_attach = custom_attach,
    capabilities = lsp_capabilities,
  })
  lspconfig.yamlls.setup({
    on_attach = custom_attach,
    capabilities = lsp_capabilities,
  })
  lspconfig.jsonls.setup({
    on_attach = custom_attach,
    capabilities = lsp_capabilities,
  })

  require('mason').setup()
  require('mason-lspconfig').setup( { } )
  require("mason-lspconfig").setup_handlers { }

end

return Plugin
