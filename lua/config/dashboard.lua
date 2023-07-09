require("dashboard").setup {
    theme = 'hyper',
    config = {
        header = {
            "╔════════════════════════════════════╗",
            "║                                    ║",
            "║             ／＞-- フ              ║",
            "║            | 　_　_|  miau.        ║",
            "║          ／` ミ＿xノ               ║",
            "║        /　 　　 |                  ║",
            "║       /　  ヽ　ﾉ                   ║",
            "║       │　　 | ||   MIAU   ╱|、     ║",
            "║   ／￣|　　 | ||        (˚ˎ 。7    ║",
            "║  ( ￣ ヽ＿_ヽ_)__)       |、˜〵    ║",
            "║   ＼二)                  じしˍ,)ノ ║",
            "║                                    ║",
            "╚════════════════════════════════════╝",
        },
        shortcut = {
            { desc = ' Update', group = '@property', action = 'PackerSync', key = 'u' },
            {
              desc = ' Files',
              group = 'Label',
              action = 'Telescope find_files',
              key = 'f',
            },
            {
              desc = ' Apps',
              group = 'DiagnosticHint',
              action = 'Telescope app',
              key = 'a',
            },
            {
              desc = ' dotfiles',
              group = 'Number',
              action = 'Telescope dotfiles',
              key = 'd',
            },
        },
    },
}
