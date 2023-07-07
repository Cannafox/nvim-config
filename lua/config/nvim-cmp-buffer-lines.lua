require "cmp".setup.cmdline({ "/", "?" }, {
    mapping = require "cmp".mapping.preset.cmdline(),
    sources = {
        {
            name = "buffer",
            option = { keyword_pattern = [[\k\+]] }
        },
        { name = "buffer-lines" }
    }
})
