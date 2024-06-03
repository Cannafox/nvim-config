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
local GetCurrentDiagnostic = function ()
  local bufnr = 0
  local line_nr = vim.api.nvim_win_get_cursor(0)[1] - 1
  local opts = { ["lnum"] = line_nr }

  local line_diagnostics = vim.diagnostic.get(bufnr, opts)
  if vim.tbl_isempty(line_diagnostics) then
    return
  end

  local best_diagnostic = nil

  for _, diagnostic in ipairs(line_diagnostics) do
    if best_diagnostic == nil or diagnostic.severity < best_diagnostic.severity then
      best_diagnostic = diagnostic
    end
  end

  return best_diagnostic
end
local GetCurrentDiagnosticString = function()
  local diagnostic = GetCurrentDiagnostic()

  if not diagnostic or not diagnostic.message then
    return
  end
  local message = vim.split(diagnostic.message, "\n")[1]
  local max_width = vim.api_nvim_win_get_width(0) - 35

  if string.len(message) < max_width then
    return message
  else
    return string.sub(message, 1, max_width) .. "..."
  end
end
Plugin.opts = function ()
  local trouble = require("trouble")
  local lualine_require = require("lualine_require")
  local symbols = trouble.statusline({
    mode = "symbols",
    groups = {},
    title = false,
    filter = { range = true },
    format = "{kind_icon}{symbol.name:Normal}",
    hl_group = "lualine_c_normal",
  })
  lualine_require.require = require
  local icons = require('lazy.core.config').icons
  local util = require('lazy.util')
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
        lualine_c = {'lsp_progress', "diagnostic-message"},
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
