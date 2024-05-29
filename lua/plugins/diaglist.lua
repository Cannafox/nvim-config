local Plugin ={"onsails/diaglist.nvim"}

Plugin.event = { "WinEnter", "BufEnter", "QuickFixCmdPre"}

Plugin.opts = {
  debug = false,
  debounce_ms = 150
}

function Plugin.config()
  vim.keymap.set('n', '<leader>qa', '<cmd>lua require("diaglist").open_all_diagnostics()<cr>' )
  vim.keymap.set('n', '<leader>qb', '<cmd>lua require("diaglist").open_buffer_diagnostics()<cr>' )
end

return Plugin