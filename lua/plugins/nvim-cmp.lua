local cmp = require("cmp")

local Plugin = { "hrsh7th/nvim-cmp" }

Plugin.event = "InsertEnter"

Plugin.dependencies = {
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-emoji" },
  { "octaltree/cmp-look" },
  { "hrsh7th/cmp-nvim-lua" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-calc" },
  { "hrsh7th/cmp-omni" },
  { "saadparwaiz1/cmp_luasnip" },
  { "hrsh7th/cmp-nvim-lsp-signature-help" },
  { "quangnguyen30192/cmp-nvim-ultisnips" },
  { "L3MON4D3/LuaSnip" },
}
Plugin.opts = function()
  vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
  local luasnip = require("luasnip")
  local lspkind = require("lspkind")
  local defaults = require("cmp.config.default")()
  require("luasnip.loaders.from_vscode").lazy_load()

  local select_opts = { behavior = cmp.SelectBehavior.Select }

  return {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "ultisnips", keyword_length = 2 },
      { name = "luasnip", keyword_length = 2 },
      { name = "path" },
      { name = "buffer", keyword_length = 3 },
      { name = "emoji", insert = true },
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ["<Up>"] = cmp.mapping.select_prev_item(select_opts),
      ["<Down>"] = cmp.mapping.select_next_item(select_opts),

      ["<C-Up>"] = cmp.mapping.scroll_docs(-4),
      ["<C-Down>"] = cmp.mapping.scroll_docs(4),

      ["<C-f>"] = cmp.mapping(function(fallback)
        if luasnip.jumpable(1) then
          luasnip.jump(1)
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<C-b>"] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<Tab>"] = cmp.mapping(function(fallback)
        local col = vim.fn.col(".") - 1

        if cmp.visible() then
          cmp.select_next_item(select_opts)
        elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
          fallback()
        else
          cmp.complete()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping.select_prev_item(select_opts),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<Esc>"] = cmp.mapping.close(),
    }),
    completion = {
      keyword_length = 1,
      completeopt = "menu,noselect",
    },
    formatting = {
      fields = { "menu", "abbr", "kind" },
      format = lspkind.cmp_format({
        mode = "symbol",
        maxwidth = 50,
        ellipsis_char = "...",
        show_labelDetails = true,
      }),
    },
    experimental = {
      ghost_text = {
        hl_group = "CmpGhostText",
      },
    },
    sorting = defaults.sorting,
  }
end
Plugin.config = function(_, opts)
  cmp.setup(opts)
end

return Plugin
