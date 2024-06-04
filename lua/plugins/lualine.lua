local Plugin = { "nvim-lualine/lualine.nvim" }

Plugin.dependencies = {'nvim-tree/nvim-web-devicons', "Isrothy/lualine-diagnostic-message"}
Plugin.event = 'VeryLazy'

Plugin.init = function()
  vim.g.lualine_laststatus = vim.o.laststatus
  if vim.fn.argc(-1) > 0 then
    -- set an empty statusline till lualine loads
    vim.o.statusline = " "
  else
    -- hide the statusline on the starter page
    vim.o.laststatus = 0
  end
end
Plugin.opts = function ()
  local lualine_require = require("lualine_require")
  lualine_require.require = require
  vim.o.laststatus = vim.g.lualine_laststatus
  local virtual_env = function()
      if vim.bo.filetype ~= "python" then
        return ""
      end

      local venv_path = os.getenv("VIRTUAL_ENV")

      if venv_path ~= nil then
        local venv_name = vim.fn.fnamemodify(venv_path, ":t")
        return string.format("%s", venv_name)
      else
        return ""
      end
    end
  return {
    options = {
        icons_enabled = true,
        theme = 'catppuccin',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
    sections = {
        lualine_a = {'mode', {
            virtual_env, cond = function ()
              if os.getenv("VIRTUAL_ENV") ~= nil then
                return true
              else
                return false
              end
            end
          }
        },
        lualine_b = {'branch', "diff", "diagnostics"},
        lualine_c = {"diagnostic-message",
          {
            'lsp_progress',
            display_components = { 'lsp_client_name', { 'title', 'percentage', 'message' }},
            separators = {
              component = ' ',
              progress = ' | ',
              message = { pre = '(', post = ')', commenced = 'In Progress', completed = 'Completed'},
              percentage = { pre = '', post = '%% ' },
              title = { pre = '', post = ': ' },
              lsp_client_name = { pre = '[', post = ']' },
              spinner = { pre = '', post = '' },
            },
            timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 1000 },
        }},
        lualine_x = {
          {
            'filename',
            path = 1,
            symbols = {
              modified = '[~]',
              readonly = '[R]',
              unnamed = '[No Name]',
              newfile = '[New]',
            }
          },
          "filesize"
        },
        lualine_y = {'fileformat', 'encoding', 'filetype'},
        lualine_z = {'progress'},
      },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    extensions = { "quickfix", "fzf", "mundo", "nvim-tree", "symbols-outline", "trouble", "fugitive", "lazy" }
  }
end
return Plugin


-- Plugin.config = function()

-- end

-- return Plugin
