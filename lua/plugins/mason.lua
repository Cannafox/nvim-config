local Plugin = { "williamboman/mason.nvim" }

Plugin.opts = {
  ensure_installed = {
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
  for _, tool in ipairs(opts.ensure_installed) do
    local p = mr.get_package(tool)
    if not p:is_installed() then
        p:install()
    end
  end
  require('mason-lspconfig').setup({
        automatic_installation = true,
    })
end

return Plugin
