local Plugin = {'echasnovski/mini.nvim'}

Plugin.branch = 'stable'

Plugin.dependencies = {
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    init = function()
      vim.g.skip_ts_context_commentstring_module = true
    end,
  }
}

function Plugin.config()
  -- See :help MiniBufremove.config
  require('mini.bufremove').setup({})

  -- Close buffer and preserve window layout
  vim.keymap.set('n', '<leader>bc', '<cmd>lua pcall(MiniBufremove.delete)<cr>', {desc = 'Close buffer'})

  -- See :help MiniSurround.config
  require('mini.surround').setup({})

  -- See :help MiniAi-textobject-builtin
  require('mini.ai').setup({n_lines = 500})

  -- See :help MiniComment.config
  require('mini.comment').setup({
    options = {
      custom_commentstring = function()
        local cs = require('ts_context_commentstring').calculate_commentstring()
        return cs or vim.bo.commentstring
      end,
    },
  })

  require('ts_context_commentstring').setup({
    enable_autocmd = false,
  })

  -- See :help MiniNotify.config
  require('mini.notify').setup({
    lsp_progress = {
      enable = false,
    },
  })
end

return Plugin
