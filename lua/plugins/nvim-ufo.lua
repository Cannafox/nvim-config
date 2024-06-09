local Plugin = { "kevinhwang91/nvim-ufo" }

Plugin.dependencies = { "kevinhwang91/promise-async" }
Plugin.enabled = true
Plugin.event = "VeryLazy"

Plugin.opts = {
    provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
    end,
    open_fold_hl_timeout = 400,
    close_fold_kinds_for_ft = { default = { 'imports', 'comment' } },
    preview = {
            win_config = {
                border = { '', '─', '', '', '', '─', '', '' },
                -- winhighlight = "Normal:Folded",
                winblend = 0,
            },
  }
}

Plugin.init = function()
  vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldclose:,foldsep: ]]
  vim.o.foldcolumn = "1"
  vim.o.foldlevel = 99
  vim.o.foldlevelstart = 99
  vim.o.foldenable = true
end

Plugin.config = function(_, opts)
  local handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local totalLines = vim.api.nvim_buf_line_count(0)
    local foldedLines = endLnum - lnum
    local suffix = (' 󰦸 %d %d%%'):format(foldedLines, foldedLines / totalLines * 100)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    local rAlignAppndx =
        math.max(math.min(vim.opt.textwidth['_value'], width - 1) - curWidth - sufWidth, 0)
    suffix = (' '):rep(rAlignAppndx) .. suffix
    table.insert(newVirtText, { suffix, 'MoreMsg' })
    return newVirtText
  end
  opts['fold_virt_text_handler'] = handler

  require('ufo').setup(opts)
  vim.keymap.set("n", "zR", require("ufo").openAllFolds)
  vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
  -- local capabilities = vim.lsp.protocol.make_client_capabilities()
  -- capabilities.textDocument.foldingRange = {
  --   dynamicRegistration = false,
  --   lineFoldingOnly = true,
  -- }
  -- local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
  -- for _, ls in ipairs(language_servers) do
  --   require("lspconfig")[ls].setup({
  --     capabilities = capabilities,
  --   })
  -- end
  -- require("ufo").setup()
end

return Plugin
