local Plugin = { "akinsho/bufferline.nvim" }
Plugin.dependencies = { "nvim-tree/nvim-web-devicons" }
Plugin.event = "VeryLazy"

Plugin.opts = {
  options = {
    mode = "tabpages",
    numbers = "buffer_id",
    close_command = "bdelete! %d",
    right_mouse_command = nil,
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,
    indicator = {
      style = "icon",
    },
    buffer_close_icon = "X",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 10,
    diagnostics = "nvim_lsp",
    custom_filter = function(bufnr)
      local exclude_ft = { "qf", "fugitive", "git" }
      local cur_ft = vim.bo[bufnr].filetype
      local should_filter = vim.tbl_contains(exclude_ft, cur_ft)

      if should_filter then
        return false
      end

      return true
    end,
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    separator_style = "bar",
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    sort_by = "id",
    offsets = {
      {
        filetype = "NvimTree",
        text = "NvimTree",
        highlight = "Directory",
        text_align = "left",
      },
    },
  },
}

Plugin.config = function(_, opts)
  require("bufferline").setup(opts)
  vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
    callback = function()
      vim.schedule(function()
        pcall(nvim_bufferline)
      end)
    end,
  })
end

return Plugin
