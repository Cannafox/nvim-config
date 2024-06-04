local Plugin = { "williamboman/mason.nvim" }

Plugin.cmd = { "Mason" }
Plugin.build = ":MasonUpdate"
Plugin.keys = {
  { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" },
}
Plugin.opts = {
  ensure_installed = {
    "autotools-language-server",
    "dot-language-server",
    "vim-language-server",
    "vint",
    "dockerfile-language-server",
    "cmake-language-server",
    "groovy-language-server",
    "marksman",
    "markdownlint",
    "html-lsp",
    "htmlbeautifier",
    "bash-language-server",
    "grammarly-languageserver",
    "yaml-language-server",
    "yamllint",
    "json-lsp",
    "jsonlint",
    "python-lsp-server",
    "pylint",
    "lua-language-server",
    "luacheck",
    "autoflake",
    "autopep8",
    "beautysh",
    "black",
    "buf",
    "clang-format",
    "cmakelang",
    "docformatter",
    "fixjson",
    "fprettify",
    "isort",
    "luaformatter",
    "markdownlint",
    "shellharden",
    "shfmt",
    "stylua",
    "typstfmt",
    "usort",
    "xmlformatter",
    "yamlfix",
    "yamlfmt",
    "yapf",
  },
  ui = { border = "rounded" },
  providers = {
    "mason.providers.client",
    "mason.providers.registry-api",
  },
}

Plugin.config = function(_, opts)
  require("mason").setup(opts)
  local mr = require("mason-registry")
  mr:on("package:install:success", function()
    vim.defer_fn(function()
      -- trigger FileType event to possibly load this newly installed LSP server
      require("lazy.core.handler.event").trigger({
        event = "FileType",
        buf = vim.api.nvim_get_current_buf(),
      })
    end, 100)
  end)

  mr.refresh(function()
    for _, tool in ipairs(opts.ensure_installed) do
      local p = mr.get_package(tool)
      if not p:is_installed() then
        p:install()
      end
    end
  end)
end

return Plugin
