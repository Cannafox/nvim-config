local Plugin = { "hrsh7th/nvim-cmp" }

Plugin.dependencies = {
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-nvim-lsp-signature-help" },
  { "saadparwaiz1/cmp_luasnip" },
  { "octaltree/cmp-look" },
  { "hrsh7th/cmp-nvim-lua" },
  { "hrsh7th/cmp-calc" },
  { "petertriho/cmp-git" },
  { "hrsh7th/cmp-omni" },
  { "quangnguyen30192/cmp-nvim-ultisnips" },
}
Plugin.config = function()
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
  end

  local cmp = require('cmp')
  local luasnip = require('luasnip')
  local lspkind = require("lspkind")

  vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

  local opts = {
    enabled = function()
      if require('cmp.config.context').in_treesitter_capture('comment') == true
          or require('cmp.config.context').in_syntax_group('Comment') then
        return false
      else
        return true
      end
    end,
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    experimental = {
      ghost_text = {
        hl_group = "CmpGhostText",
      },
    },
    completion = {
      completeopt = "menu,menuone,noinsert",
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
    preselect = cmp.PreselectMode.Item,
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    sources = {
      { name = "nvim_lsp", priority = 50 },
      { name = "ultisnips", priority = 100, keyword_length = 2 },
      { name = "luasnip", priority = 100, keyword_length = 2 },
      { name = "path", priority = 99 },
      { name = "git" },
      { name = "buffer", priority = 50, max_item_count = 5, keyword_length = 3 },
      { name = 'nvim_lsp_signature_help', priority = 50 },
    },
    -- sorting = {
    --   cmp.config.compare.locality,
    --   cmp.config.compare.recently_used,
    --   cmp.config.compare.score,
    --   cmp.config.compare.offset,
    --   cmp.config.compare.order,
    -- },
    matching = {
      disallow_fuzzy_matching = true,
      disallow_fullfuzzy_matching = true,
      disallow_partial_fuzzy_matching = false,
      disallow_partial_matching = false,
      disallow_prefix_unmatching = true,
    },
    mapping = cmp.mapping.preset.insert({
      -- ["<Up>"] = cmp.mapping.select_prev_item(select_opts),
      -- ["<Down>"] = cmp.mapping.select_next_item(select_opts),
      --
      -- ["<C-Up>"] = cmp.mapping.scroll_docs(-4),
      -- ["<C-Down>"] = cmp.mapping.scroll_docs(4),
      --
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
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
      end, { 'i', 's' }),
      ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<Esc>"] = cmp.mapping.close()
    })
  }
  cmp.setup(opts)
end

return Plugin
