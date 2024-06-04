local Plugin = { "lukas-reineke/headlines.nvim" }

Plugin.dependencies = { "nvim-treesitter/nvim-treesitter" }

Plugin.ft = { "markdown", "norg", "rmd", "org" }
Plugin.opts = function()
  local opts = {}
  for _, ft in ipairs({ "markdown", "norg", "rmd", "org" }) do
    opts[ft] = {
      headline_highlights = {},
      -- disable bullets for now. See https://github.com/lukas-reineke/headlines.nvim/issues/66
      bullets = {},
    }
    for i = 1, 6 do
      local hl = "Headline" .. i
      vim.api.nvim_set_hl(0, hl, { link = "Headline", default = true })
      table.insert(opts[ft].headline_highlights, hl)
    end
  end
  return opts
end

Plugin.config = function(_, opts)
  vim.schedule(function()
    require("headlines").setup(opts)
    require("headlines").refresh()
  end)
end

return Plugin
