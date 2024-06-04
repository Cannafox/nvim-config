local Plugin = { "lukas-reineke/indent-blankline.nvim" }

local exclude_ft =
  { "help", "git", "markdown", "snippets", "text", "gitconfig", "alpha", "dashboard", "Trouble", "trouble", "lazy" }

Plugin.main = "ibl"
Plugin.opts = { enabled = true }

function Plugin.config(_, opts)
  local gid = vim.api.nvim_create_augroup("indent_blankline", { clear = true })
  vim.api.nvim_create_autocmd("InsertEnter", {
    pattern = "*",
    group = gid,
    command = "IBLDisable",
  })
  vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    group = gid,
    callback = function()
      if not vim.tbl_contains(exclude_ft, vim.bo.filetype) then
        vim.cmd([[IBLEnable]])
      end
    end,
  })
  require("ibl").setup(opts)
end

return Plugin
