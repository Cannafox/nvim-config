local Plugin = { "neovim/nvim-lspconfig" }

Plugin.dependencies = { "hrsh7th/cmp-nvim-lsp" }

Plugin.event = { "BufReadPre", "BufNewFile" }

Plugin.opts = {
  diagnostics = {
    underline = true,
    update_in_insert = false,
    virtual_text = {
      spacing = 4,
      source = "if_many",
      prefix = "●",
      -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
      -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
      -- prefix = "icons",
    },
    severity_sort = true,
  },
  -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
  -- Be aware that you also will need to properly configure your LSP server to
  -- provide the inlay hints.
  inlay_hints = {
    enabled = true,
    exclude = {}, -- filetypes for which you don't want to enable inlay hints
  },
  -- Enable this to enable the builtin LSP code lenses on Neovim >= 0.10.0
  -- Be aware that you also will need to properly configure your LSP server to
  -- provide the code lenses.
  codelens = {
    enabled = true,
  },
  -- Enable lsp cursor word highlighting
  document_highlight = {
    enabled = true,
  },
  -- add any global capabilities here
  capabilities = {
    workspace = {
      fileOperations = {
        didRename = true,
        willRename = true,
      },
    },
  },
  -- options for vim.lsp.buf.format
  -- `bufnr` and `filter` is handled by the LazyVim formatter,
  -- but can be also overridden when specified
  format = {
    formatting_options = nil,
    timeout_ms = nil,
  },
  servers = {
    dotls = {},
    vimls = {},
    dockerls = {},
    cmake = {},
    groovyls = {
      cmd = {
        "java",
        "-jar",
        "/home/lsave/sources/groovy-language-server/build/libs/groovy-language-server-all.jar",
      },
    },
    marksman = {},
    html = {},
    bashls = {},
    grammarly = {},
    yamlls = {},
    jsonls = {},
    pylsp = {
      settings = {
        pylsp = {
          plugins = {
            -- formatter options
            black = { enabled = true },
            autopep8 = { enabled = false },
            yapf = { enabled = false },
            -- linter options
            pylint = { enabled = false },
            ruff = { enabled = true },
            rope_autoimport = { enabled = true, completions = { enabled = true }, code_actions = { enabled = true } },
            pyflakes = { enabled = false },
            pycodestyle = { enabled = true },
            -- type checker
            pylsp_mypy = {
              enabled = true,
              -- overrides = { "--python-executable", vim.g., true },
              report_progress = true,
              live_mode = true,
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
    },
    lua_ls = {
      settings = {
        Lua = {
          hint = {
            enable = true,
          },
          hover = { expandAlias = false},
          type = {
            castNumberToInteger = true
          },
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = "LuaJIT",
          },
          diagnostics = {
                globals = {
                    'vim',
                    'use',
                    'describe',
                    'it',
                    'assert',
                    'before_each',
                    'after_each',
                },
            },
            disable = {
                'lowercase-global',
                'undefined-global',
                'unused-local',
                'unused-function',
                'unused-vararg',
                'trailing-space',
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
    },
  },
}
Plugin.config = function(_, opts)
  local sign = function(op)
    vim.fn.sign_define(op.name, {
      texthl = op.name,
      text = op.text,
      numhl = "",
    })
  end
  local nvim_lsp = require("lspconfig")
  vim.diagnostic.config({
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    virtual_text = true
  })
  -- require('neodev').setup({})
  sign({ name = "DiagnosticSignError", text = "✘" })
  sign({ name = "DiagnosticSignWarn", text = "▲" })
  sign({ name = "DiagnosticSignHint", text = "⚑" })
  sign({ name = "DiagnosticSignInfo", text = "»" })

  local on_attach = function(_, bufnr)
    require("lsp-format").on_attach(client)
    vim.lspbuf.inlay_hint(0, true)
    -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local map = vim.api.nvim_buf_set_keymap
    local map_settings = {noremap = true, silent = true}

    map(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", map_settings)-- { desc = "go to definition" })
    map(bufnr, "n", "gD", "<cmd>Lspsaga goto_definition<CR>", map_settings)
    map(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", map_settings)
    map(bufnr, "n", "k", "<cmd>lua vim.lsp.buf.signature_help()<CR>", map_settings)
    map(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', map_settings)
    map(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', map_settings)
    map(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', map_settings)
    map(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', map_settings)
    map(bufnr, 'n', '<leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', map_settings)
    map(bufnr, 'n', 'cA', '<cmd>lua vim.lsp.buf.code_action()<CR>', map_settings)
    map(bufnr, 'n', 'dO', '<cmd>lua vim.diagnostic.open_float()<CR>', map_settings)
    map(bufnr, 'n', 'dA', '<cmd>lua vim.diagnostic.setloclist()<CR>', map_settings)
    map(
      bufnr,
      'n',
      'gP',
      "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
      map_settings
    )
    map(
        bufnr,
        'n',
        'gPi',
        "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
        map_settings
    )
    map(
        bufnr,
        'n',
        'gPt',
        "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
        map_settings
    )
    map(bufnr, 'n', 'gq', "<cmd>lua require('goto-preview').close_all_win()<CR>", map_settings)
    map(
        bufnr,
        'n',
        'gF',
        "<cmd>lua require('goto-preview').goto_preview_references()<CR>",
        map_settings
    )
  end
  -- local capabilities = vim.lsp.protocol.make_client_capabilities()
  -- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
  -- capabilities.textDocument.foldingRange = {
  --   dynamicRegistration = false,
  --   lineFoldingOnly = true,
  -- }
  -- opts['capabilities'] = capabilities
  -- opts['on_attach'] = on_attach
  -- opts['root_dir'] = function()
  --   return vim.fn.getcwd()
  -- end
  -- for _, lsp in ipairs(opts['servers']) do
  --   nvim_lsp[lsp].setup(opts)
  -- end
  local servers = opts.servers
  local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  local capabilities = vim.tbl_deep_extend(
    "force",
    {},
    vim.lsp.protocol.make_client_capabilities(),
    has_cmp and cmp_nvim_lsp.default_capabilities() or {},
    opts.capabilities or {}
  )
  local function setup_server(server)
    local server_opts = vim.tbl_deep_extend("force", {
      capabilities = vim.deepcopy(capabilities),
    }, servers[server] or {})

    if opts.server[server] then
      if opts.setup[server](server, server_opts) then
        return
      end
    elseif opts.setup["*"] then
      if opts.setup["*"](server, server_opts) then
        return
      end
    end
    require("lspconfig")[server].setup(server_opts)
  end

  local have_mason, mlsp = pcall(require, "mason-lspconfig")
  local all_mslp_servers = {}
  if have_mason then
    all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
  end
end

return Plugin
    -- map("n", "<space>qw", vim.diagnostic.setqflist, { desc = "put window diagnostics to qf" })
    -- -- this puts diagnostics from current buffer to quickfix
    -- map("n", "<space>qb", function()
    --   set_qflist(bufnr)
    -- end, { desc = "put buffer diagnostics to qf" })
    -- map("n", "<space>ca", vim.lsp.buf.code_action, { desc = "LSP code action" })
    -- map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, { desc = "add workspace folder" })
    -- map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, { desc = "remove workspace folder" })
    -- map("n", "<space>wl", function()
    --   vim.inspect(vim.lsp.buf.list_workspace_folders())
    -- end, { desc = "list workspace folder" })
  -- LazyVim.format.register(LazyVim.lsp.formatter())
--   LazyVim.lsp.on_attach(function(client, buffer)
--     require("lazyvim.plugins.lsp.keymaps").on_attach(client, buffer)
--   end)
--
--   LazyVim.lsp.setup()
--   LazyVim.lsp.on_dynamic_capability(require("lazyvim.plugins.lsp.keymaps").on_attach)
--
--   LazyVim.lsp.words.setup(opts.document_highlight)
--   if vim.fn.has("nvim-0.10.0") == 0 then
--     if type(opts.diagnostics.signs) ~= "boolean" then
--       for severity, icon in pairs(opts.diagnostics.signs.text) do
--         local name = vim.diagnostic.severity[severity]:lower():gsub("^%l", string.upper)
--         name = "DiagnosticSign" .. name
--         vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
--       end
--     end
--   end
--
--   if opts.inlay_hints.enabled then
--     LazyVim.lsp.on_supports_method("textDocument/inlayHint", function(client, buffer)
--       if
--         vim.api.nvim_buf_is_valid(buffer)
--         and vim.bo[buffer].buftype == ""
--         and not vim.tbl_contains(opts.inlay_hints.exclude, vim.bo[buffer].filetype)
--       then
--         LazyVim.toggle.inlay_hints(buffer, true)
--       end
--     end)
--   end
--
--   -- code lens
--   if opts.codelens.enabled and vim.lsp.codelens then
--     LazyVim.lsp.on_supports_method("textDocument/codeLens", function(client, buffer)
--       vim.lsp.codelens.refresh()
--       vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
--         buffer = buffer,
--         callback = vim.lsp.codelens.refresh,
--       })
--     end)
--   end
--
--   if type(opts.diagnostics.virtual_text) == "table" and opts.diagnostics.virtual_text.prefix == "icons" then
--     opts.diagnostics.virtual_text.prefix = vim.fn.has("nvim-0.10.0") == 0 and "●"
--       or function(diagnostic)
--         local icons = LazyVim.config.icons.diagnostics
--         for d, icon in pairs(icons) do
--           if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
--             return icon
--           end
--         end
--       end
--   end
--
--   vim.diagnostic.config(vim.deepcopy(opts.diagnostics))
--
--   local servers = opts.servers
--   local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
--   local capabilities = vim.tbl_deep_extend(
--     "force",
--     {},
--     vim.lsp.protocol.make_client_capabilities(),
--     has_cmp and cmp_nvim_lsp.default_capabilities() or {},
--     opts.capabilities or {}
--   )
--   local function setup_server(server)
--     local server_opts = vim.tbl_deep_extend("force", {
--       capabilities = vim.deepcopy(capabilities),
--     }, servers[server] or {})
--
--     if opts.server[server] then
--       if opts.setup[server](server, server_opts) then
--         return
--       end
--     elseif opts.setup["*"] then
--       if opts.setup["*"](server, server_opts) then
--         return
--       end
--     end
--     require("lspconfig")[server].setup(server_opts)
--   end
--
--   local have_mason, mlsp = pcall(require, "mason-lspconfig")
--   local all_mslp_servers = {}
--   if have_mason then
--     all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
--   end
--
--   local ensure_installed = {} ---@type string[]
--   for server, server_opts in pairs(servers) do
--     if server_opts then
--       server_opts = server_opts == true and {} or server_opts
--       if server_opts.enabled ~= false then
--         -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
--         if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
--           setup_server(server)
--         else
--           ensure_installed[#ensure_installed + 1] = server
--         end
--       end
--     end
--   end
--
--   if have_mason then
--     mlsp.setup({
--       ensure_installed = vim.tbl_deep_extend(
--         "force",
--         ensure_installed,
--         LazyVim.opts("mason-lspconfig.nvim").ensure_installed or {}
--       ),
--       handlers = { setup },
--     })
--   end
--
--   -- if LazyVim.lsp.is_enabled("denols") and LazyVim.lsp.is_enabled("vtsls") then
--   --   local is_deno = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")
--   --   LazyVim.lsp.disable("vtsls", is_deno)
--   --   LazyVim.lsp.disable("denols", function(root_dir)
--   --     return not is_deno(root_dir)
--   --   end)
--   -- end
-- end
--
-- return Plugin

-- local custom_attach = function(client, bufnr)
--   -- Mappings.
--   local map = function(mode, l, r, opts)
--     opts = Plugin.opts or {}
--     opts.silent = true
--     opts.buffer = bufnr
--     vim.keymap.set(mode, l, r, opts)
--   end

--   map("n", "gd", vim.lsp.buf.definition, { desc = "go to definition" })
--   map("n", "<C-]>", vim.lsp.buf.definition)
--   map("n", "K", vim.lsp.buf.hover)
--   map("n", "<C-k>", vim.lsp.buf.signature_help)
--   map("n", "<space>rn", vim.lsp.buf.rename, { desc = "variable rename" })
--   map("n", "gr", vim.lsp.buf.references, { desc = "show references" })
--   map("n", "[d", vim.diagnostic.goto_prev, { desc = "previous diagnostic" })
--   map("n", "]d", vim.diagnostic.goto_next, { desc = "next diagnostic" })
--   -- this puts diagnostics from opened files to quickfix
--   map("n", "<space>qw", vim.diagnostic.setqflist, { desc = "put window diagnostics to qf" })
--   -- this puts diagnostics from current buffer to quickfix
--   map("n", "<space>qb", function()
--     set_qflist(bufnr)
--   end, { desc = "put buffer diagnostics to qf" })
--   map("n", "<space>ca", vim.lsp.buf.code_action, { desc = "LSP code action" })
--   map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, { desc = "add workspace folder" })
--   map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, { desc = "remove workspace folder" })
--   map("n", "<space>wl", function()
--     vim.inspect(vim.lsp.buf.list_workspace_folders())
--   end, { desc = "list workspace folder" })

--   -- Set some key bindings conditional on server capabilities

--   vim.api.nvim_create_autocmd("CursorHold", {
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

--       local cursor_pos = vim.api.nvim_win_get_cursor(0)
--       if
--         (cursor_pos[1] ~= vim.b.diagnostics_pos[1] or cursor_pos[2] ~= vim.b.diagnostics_pos[2])
--         and table.getn(vim.diagnostic.get()) > 0
--       then
--         vim.diagnostic.open_float(nil, float_opts)
--       end

--       vim.b.diagnostics_pos = cursor_pos
--     end,
--   })

--   local gid = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
--   vim.api.nvim_create_autocmd("CursorHold", {
--     group = gid,
--     buffer = bufnr,
--     callback = function()
--       vim.lsp.buf.document_highlight()
--     end,
--   })

--   vim.api.nvim_create_autocmd("CursorMoved", {
--     group = gid,
--     buffer = bufnr,
--     callback = function()
--       vim.lsp.buf.clear_references()
--     end,
--   })

--   if vim.g.logging_level == "debug" then
--     local msg = string.format("Language server %s started!", client.name)
--     vim.notify(msg, vim.log.levels.DEBUG, { title = "Nvim-config" })
--   end
-- end
-- local group = vim.api.nvim_create_augroup("lsp_cmds", { clear = true })
-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = group,
--   desc = "LSP actions",
--   callback = custom_attach,
-- })
-- local lspsaga = require('lspsaga')
-- print(lspsaga.goto_definition())
