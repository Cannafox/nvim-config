local Plugin = { "nvim-tree/nvim-tree.lua" }

Plugin.lazy = false

Plugin.dependencies = { "nvim-tree/nvim-web-devicons" }
Plugin.opts = {
  auto_reload_on_write = true,
  disable_netrw = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  open_on_tab = false,
  sort_by = "name",
  update_cwd = false,
  view = {
    width = 30,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
  },
  renderer = {
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      }, 
    },
    icons = {
      webdev_colors = true,
    },
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  system_open = {
    cmd = "",
    args = {},
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    open_file = {
      quit_on_open = true,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      diagnostics = false,
      git = false,
      profile = false,
    },
  },  
}
function Plugin.init()
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
end

function Plugin.config()
  vim.keymap.set('n', '\\', '<cmd>NvimTreeOpen<cr>')
  require('nvim-tree').setup(Plugin.opts)
end

return Plugin


-- local tab_win_closed = function(winnr)
--   local api = require("nvim-tree.api")
--   local tabnr = vim.api.nvim_win_get_tabpage(winnr)
--   local bufnr = vim.api.nvim_win_get_buf(winnr)
--   local buf_info = vim.fn.getbufinfo(bufnr)[1]
--   local tab_wins = vim.tbl_filter(function(w)
--     return w ~= winnr
--   end, vim.api.nvim_tabpage_list_wins(tabnr))
--   local tab_bufs = vim.tbl_map(vim.api.nvim_win_get_buf, tab_wins)
--   if buf_info.name:match(".*NvimTree_%d*$") then -- close buffer was nvim tree
--     -- Close all nvim tree on :q
--     if not vim.tbl_isempty(tab_bufs) then -- and was not the last window (not closed automatically by code below)
--       api.tree.close()
--     end
--   else -- else closed buffer was normal buffer
--     if #tab_bufs == 1 then -- if there is only 1 buffer left in the tab
--       local last_buf_info = vim.fn.getbufinfo(tab_bufs[1])[1]
--       if last_buf_info.name:match(".*NvimTree_%d*$") then -- and that buffer is nvim tree
--         vim.schedule(function()
--           if #vim.api.nvim_list_wins() == 1 then -- if its the last buffer in vim
--             vim.cmd("quit") -- then close all of vim
--           else -- else there are more tabs open
--             vim.api.nvim_win_close(tab_wins[1], true) -- then close only the tab
--           end
--         end)
--       end
--     end
--   end
-- end
-- -- return {
-- --   {
-- --     "nvim-tree/nvim-tree.lua",
-- --     keys = { "\\" },
-- --     dependencies = "nvim-tree/nvim-web-devicons",
-- --     opts = {
-- --       gheight = vim.api.nvim_list_uis()[1].height,
-- --       gwidth = vim.api.nvim_list_uis()[1].width,
-- --       weight = 30,
-- --       height = 30,
-- --       auto_reload_on_write = true,
-- --       disable_netrw = false,
-- --       hijack_cursor = false,
-- --       hijack_netrw = true,
-- --       hijack_unnamed_buffer_when_opening = false,
-- --       open_on_tab = false,
-- --       sort_by = "name",
-- --       update_cwd = false,
-- --       view = {
-- --         width = 30,
-- --         side = "left",
-- --         preserve_window_proportions = false,
-- --         number = false,
-- --         relativenumber = false,
-- --         signcolumn = "yes",
-- --       },
-- --       renderer = {
-- --         indent_markers = {
-- --           enable = false,
-- --           icons = {
-- --             corner = "└ ",
-- --             edge = "│ ",
-- --             none = "  ",
-- --           },
-- --         },
-- --         icons = {
-- --           webdev_colors = true,
-- --         },
-- --       },
-- --       hijack_directories = {
-- --         enable = true,
-- --         auto_open = true,
-- --       },
-- --       update_focused_file = {
-- --         enable = true,
-- --         update_cwd = true,
-- --         ignore_list = {},
-- --       },
-- --       system_open = {
-- --         cmd = "",
-- --         args = {},
-- --       },
-- --       diagnostics = {
-- --         enable = true,
-- --         show_on_dirs = false,
-- --         icons = {
-- --           hint = "",
-- --           info = "",
-- --           warning = "",
-- --           error = "",
-- --         },
-- --       },
-- --       filters = {
-- --         dotfiles = false,
-- --         custom = {},
-- --         exclude = {},
-- --       },
-- --       git = {
-- --         enable = true,
-- --         ignore = true,
-- --         timeout = 400,
-- --       },
-- --       actions = {
-- --         use_system_clipboard = true,
-- --         change_dir = {
-- --           enable = true,
-- --           global = false,
-- --           restrict_above_cwd = false,
-- --         },
-- --         open_file = {
-- --           quit_on_open = true,
-- --           resize_window = false,
-- --           window_picker = {
-- --             enable = true,
-- --             chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
-- --             exclude = {
-- --               filetype = { "notify", "qf", "diff", "fugitive", "fugitiveblame" },
-- --               buftype = { "nofile", "terminal", "help" },
-- --             },
-- --           },
-- --         },
-- --       },
-- --       trash = {
-- --         cmd = "trash",
-- --         require_confirm = true,
-- --       },
-- --       log = {
-- --         enable = false,
-- --         truncate = false,
-- --         types = {
-- --           all = false,
-- --           config = false,
-- --           copy_paste = false,
-- --           diagnostics = false,
-- --           git = false,
-- --           profile = false,
-- --         },
-- --       },
-- --     },
-- --     vim.api.nvim_create_autocmd("WinClosed", {
-- --       callback = function()
-- --         local winnr = tonumber(vim.fn.expand("<amatch>"))
-- --         vim.schedule_wrap(tab_win_closed(winnr))
-- --       end,
-- --       nested = true,
-- --     }),
-- --   },
-- -- }
