local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.autoflake,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.beautysh,
        null_ls.builtins.formatting.fish_indent,
        null_ls.builtins.formatting.fixjson,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.diagnostics.fish,
        null_ls.builtins.diagnostics.flake8,
        null_ls.builtins.diagnostics.jsonlint,
        null_ls.builtins.diagnostics.luacheck,
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.diagnostics.vint,
        null_ls.builtins.diagnostics.vulture,
        null_ls.builtins.diagnostics.checkmake,
        null_ls.builtins.diagnostics.cmake_lint,
        null_ls.builtins.diagnostics.cppcheck,
        null_ls.builtins.diagnostics.editorconfig_checker,
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.code_actions.shellcheck,
        null_ls.builtins.completion.tags,
        null_ls.builtins.completion.vsnip,
        null_ls.builtins.hover.printenv,
    },
})
