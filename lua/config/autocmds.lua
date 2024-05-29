local aucmd = vim.api.nvim_create_autocmd
local augrp = vim.api.nvim_create_augroup

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
})

augrp("ReloadOnChange", {clear = true})
aucmd(
    {"FileChangedShellPost"},
    {
        pattern = "*",
        group = "ReloadOnChange",
        callback = function()
            vim.notify("File changed on disk. Buffer reloaded!", vim.log.levels.WARN, {title = "nvim-config"})
        end
    }
)
aucmd(
    {"FocusGained"},
    {
        pattern = "*",
        group = "ReloadOnChange",
        callback = function()
            if vim.fn.getcmdwintype() == "" then
                vim.cmd("checktime")
            end
        end
    }
)

augrp("YankHighlight", {clear = true})
aucmd(
    "TextYankPost",
    {
        group = "YankHighlight",
        callback = function()
            vim.highlight.on_yank({higroup = "IncSearch", timeout = "1000"})
        end
    }
)

augrp("RestoreAfterYank", {clear = true})
aucmd(
    "TextYankPost",
    {
        pattern = "*",
        group = "RestoreAfterYank",
        callback = function()
            vim.cmd([[
      silent! normal! `y
      silent! delmarks y
    ]])
        end
    }
)

-- augrp("TrailSpaceOnSave", {clear = true})
-- aucmd(
--     "BufWritePre",
--     {
--         group = "TrailSpaceOnSave",
--         pattern = "",
--         command = ":%s/\\s\\+$//e"
--     }
-- )

augrp("DontAutoCommentNLines", {clear = true})
aucmd(
    {"BufEnter"},
    {
        group = "DontAutoCommentNLines",
        pattern = "*",
        command = "set fo-=c fo-=r fo-=o"
    }
)

augrp("setLineLength", {clear = true})
aucmd(
    {"Filetype"},
    {
        group = "setLineLength",
        pattern = {"text", "markdown", "html", "xhtml", "javascript", "typescript"},
        command = "setlocal cc=0"
    }
)
augrp("termPos", {clear = true})
aucmd(
    {"CmdlineEnter"},
    {
        group = "termPos",
        pattern = "*",
        command = "command! Term :botright vsplit term://$SHELL"
    }
)

-- Enter insert mode when switching to terminal
augrp("termUi", {clear = true})
aucmd(
    {"TermOpen"},
    {
        group = "termUi",
        pattern = "*",
        command = "setlocal listchars= nonumber norelativenumber nocursorline"
    }
)
augrp("termInsertMode", {clear = true})
aucmd(
    {"TermOpen"},
    {
        group = "termInsertMode",
        pattern = "*",
        command = "startinsert"
    }
)
augrp("termInsertMode", {clear = true})
aucmd(
    {"TermOpen"},
    {
        group = "termInsertMode",
        pattern = "*",
        command = "startinsert"
    }
)

-- Close terminal buffer on process exit
augrp("termLeave", {clear = true})
aucmd(
    {"BufLeave"},
    {
        group = "termLeave",
        pattern = "term://*",
        command = "stopinsert"
    }
)

augrp("pythonRelated", {clear = true})
aucmd(
    {"Filetype"},
    {
        group = "pythonRelated",
        pattern = "*.py",
        command = "nmap <leader>d <Plug>(pydocstring)"
    }
)
aucmd(
    {"Filetype"},
    {
        group = "pythonRelated",
        pattern = "*.py",
        command = "nmap <leader>p :Black<CR>"
    }
)

augrp("dynamic_smartcase", {clear = true})
aucmd(
    {"CmdLineEnter"},
    {
        pattern = "*",
        group = "dynamic_smartcase",
        command = "set nosmartcase"
    }
)
aucmd(
    {"CmdLineLeave"},
    {
        pattern = "*",
        group = "dynamic_smartcase",
        command = "set smartcase"
    }
)

augrp("acc_syntax_hl", {clear = true})
aucmd(
    {"BufEnter"},
    {
        pattern = "*",
        group = "acc_syntax_hl",
        command = "syntax sync fromstart"
    }
)
