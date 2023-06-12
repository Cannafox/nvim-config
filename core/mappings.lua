local keymap = vim.keymap
local api = vim.api
local g = vim.g

keymap.set({ "n", "x"}, ";", ":")

keymap.set("i", "<c-t>", "<Esc>b~lea", { desc = "current word to title case"})

keymap.set("n", "<leader>p", "m`o<ESC>p``", { desc = "paste below current line" })
keymap.set("n", "<leader>P", "m`O<ESC>p``", { desc = "paste above current line" })

keymap.set("n", "<leader>w", "<cmd>update<cr>", { silent = true, desc = "save buffer" })
keymap.set("n", "<leader>q", "<cmd>x<cr>", { silent = true, desc = "quit current window" })
keymap.set("n", "<leader>Q", "<cmd>qa!<cr>", { silent = true, desc = "quit nvim" })

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

keymap.set("n", [[\d]], "<cmd>bprevious <bar> bdelete #<cr>", {
  silent = true,
  desc = "delete buffer",
})

keymap.set("n", "<space>o", "printf('m`%so<ESC>``', v:count1)", {
  expr = true,
  desc = "insert line below",
})

keymap.set("n", "<space>O", "printf('m`%sO<ESC>``', v:count1)", {
  expr = true,
  desc = "insert line above",
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

keymap.set("n", "<leader>y", "<cmd>%yank<cr>", { desc = "yank entire buffer" })
keymap.set("n", "gb", '<cmd>call buf_utils#GoToBuffer(v:count, "forward")<cr>', {
  desc = "go to buffer (forward)",
})
keymap.set("n", "gB", '<cmd>call buf_utils#GoToBuffer(v:count, "backward")<cr>', {
  desc = "go to buffer (backward)",
})
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

keymap.set("n", "<space>s", ":ASToggle<CR>", {desc = "Toggle auto save"})

