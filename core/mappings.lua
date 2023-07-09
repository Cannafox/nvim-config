local keymap = vim.keymap
local api = vim.api
local g = vim.g

keymap.set("i", "<c-t>", "<Esc>b~lea", { desc = "current word to title case"})

keymap.set("n", "[l", "<cmd>lprevious<cr>zv", { silent = true, desc = "previous location item" })
keymap.set("n", "]l", "<cmd>lnext<cr>zv", { silent = true, desc = "next location item" })

keymap.set("n", "[L", "<cmd>lfirst<cr>zv", { silent = true, desc = "first location item" })
keymap.set("n", "]L", "<cmd>llast<cr>zv", { silent = true, desc = "last location item" })

keymap.set("n", "[q", "<cmd>cprevious<cr>zv", { silent = true, desc = "previous qf item" })
keymap.set("n", "]q", "<cmd>cnext<cr>zv", { silent = true, desc = "next qf item" })

keymap.set("n", "[Q", "<cmd>cfirst<cr>zv", { silent = true, desc = "first qf item" })
keymap.set("n", "]Q", "<cmd>clast<cr>zv", { silent = true, desc = "last qf item" })

keymap.set("n", [[\x]], "<cmd>windo lclose <bar> cclose <cr>", {
  silent = true,
  desc = "close qf and location list",
})

keymap.set("n", "<leader>ev", "<cmd>tabnew $MYVIMRC <bar> tcd %:h<cr>", {
  silent = true,
  desc = "open init.lua",
})

keymap.set("n", "<leader>sv", function()
  vim.cmd([[
      update $MYVIMRC
      source $MYVIMRC
    ]])
  vim.notify("Nvim config successfully reloaded!", vim.log.levels.INFO, { title = "nvim-config" })
end, {
  silent = true,
  desc = "reload init.lua",
})

keymap.set("n", "/", [[/\v]])
keymap.set("n", "<leader>cd", "<cmd>lcd %:p:h<cr><cmd>pwd<cr>", { desc = "change cwd" })
keymap.set("t", "<Esc>", [[<c-\><c-n>]])

keymap.set("n", "<F11>", "<cmd>set spell!<cr>", { desc = "toggle spell" })
keymap.set("i", "<F11>", "<c-o><cmd>set spell!<cr>", { desc = "toggle spell" })

keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {desc = "Telescope find file"})
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", {desc = "Telescope live grep"})
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", {desc = "Telescope buffers"})
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", {desc = "Telescope help tags"})
keymap.set("n", "<leader>fc", "<cmd>Telescope colorscheme<cr>", {desc = "Telescope colorscheme"})
keymap.set("n", "<leader>f/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", {desc = "Telescope buffer fuzzy find"})

g.UltiSnipsExpandTrigger="<tab>"
g.UltiSnipsJumpForwardTrigger="<c-n>"
g.UltiSnipsJumpBackwardTrigger="<c-p>"
g.UltiSnipsEnableSnipMate = 1
g.UltiSnipsSnippetDirectories={'UltiSnips', 'my_snippets'}

