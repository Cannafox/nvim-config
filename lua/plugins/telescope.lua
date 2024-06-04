local Plugin = {"nvim-telescope/telescope.nvim"}

Plugin.version = false
Plugin.cmd = "Telescope"

Plugin.dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-symbols.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
      { "nvim-telescope/telescope-live-grep-args.nvim" , version = "~1.0.0"},
}
Plugin.keys = {
 {
      "<Tab>",
      "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
      desc = "Switch Buffer",
    },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep (Root Dir)" },
    { "<leader>fG", "<cmd>:lua require('telescope.builtin').live_grep({cwd = vim.uv.cwd()})<cr>", desc = "Grep (cwd)" },
    { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
    { "<leader>ff", "<cmd> Telescope find_files<cr>", desc = "Find Files (Root Dir)" },
    -- find
    { "<leader>fb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
    { "<leader>fc", "<cmd>Telescope config_files<cr>", desc = "Find Config File" },
    { "<leader>fF", "<cmd>:lua require('telescope.builtin').find_files({cwd = true})<cr>", desc = "Find Files (cwd)" },
    { "<leader>gf", "<cmd>Telescope git_files<cr>", desc = "Find Files (git-files)" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
    { "<leader>fR", "<cmd>:lua require('telescope.builtin').oldfiles({cwd = vim.uv.cwd()})<cr>", desc = "Recent (cwd)" },
    -- git
    { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "Commits" },
    { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "Status" },
    -- search
    { '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Registers" },
    { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
    { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
    { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
    { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
    { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics" },
    { "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
    { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
    { "<leader>sj", "<cmd>Telescope jumplist<cr>", desc = "Jumplist" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
    { "<leader>sl", "<cmd>Telescope loclist<cr>", desc = "Location List" },
    { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
    { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
    { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
    { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
    { "<leader>sq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix List" },
    {
      "<leader>ss",
      function()
        require("telescope.builtin").lsp_document_symbols({
          symbols = require("lazyvim.config").get_kind_filter(),
        })
      end,
      desc = "Goto Symbol",
    },
    {
      "<leader>sS",
      function()
        require("telescope.builtin").lsp_dynamic_workspace_symbols({
          symbols = require("lazyvim.config").get_kind_filter(),
        })
      end,
      desc = "Goto Symbol (Workspace)",
    },
  }

Plugin.opts = {
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
      "scope",
      file_browser = {
        theme = "ivy",
        hijack_netrw = true,
        mappings = {
          ["i"] = {},
          ["n"] = {},
        },
      },
    }
}
function Plugin.config()
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("scope")
    require("telescope").load_extension("live_grep_args")
    local actions = require('telescope.actions')

    local open_with_trouble = require("trouble.sources.telescope").open
    local find_files_no_ignore = function()
      local action_state = require("telescope.actions.state")
      local line = action_state.get_current_line()
      require('telescope.builtin').find_files({ no_ignore = true, default_text = line })
    end
    local find_files_with_hidden = function()
      local action_state = require("telescope.actions.state")
      local line = action_state.get_current_line()
      require('telescope.builtin').find_files({ hidden = true, default_text = line })
    end
    local opts = {
      defaults = {
          prompt_prefix = " ",
          selection_caret = " ",
          -- open files in the first window that is an actual file.
          -- use the current window if no other window is available.
          get_selection_window = function()
            local wins = vim.api.nvim_list_wins()
            table.insert(wins, 1, vim.api.nvim_get_current_win())
            for _, win in ipairs(wins) do
              local buf = vim.api.nvim_win_get_buf(win)
              if vim.bo[buf].buftype == "" then
                return win
              end
            end
            return 0
          end,
          mappings = {
            i = {
              ["<c-t>"] = open_with_trouble,
              ["<a-t>"] = open_with_trouble,
              ["<a-i>"] = find_files_no_ignore,
              ["<a-h>"] = find_files_with_hidden,
              ["<C-Down>"] = actions.cycle_history_next,
              ["<C-Up>"] = actions.cycle_history_prev,
              ["<C-f>"] = actions.preview_scrolling_down,
              ["<C-b>"] = actions.preview_scrolling_up,
            },
            n = {
              ["q"] = actions.close,
            },
          },
        },
    }
  require('telescope').setup(opts)
end

return Plugin
