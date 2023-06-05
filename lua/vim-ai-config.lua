vim.g.vim_ai_complete = {
  engine = "complete",
  options = {
    model = "text-davinci-003",
    max_tokens = 1000,
    temperature = 0.1,
    request_timeout = 20,
    selection_boundary = "#####",
  },
  ui = {
    paste_mode = 1,
  },
}
vim.g.vim_ai_edit = {
  engine = "complete",
  options = {
    model = "text-davinci-003",
    max_tokens = 1000,
    temperature = 0.1,
    request_timeout = 20,
    selection_boundary = "#####",
  },
  ui = {
    paste_mode = 1,
  },
}
vim.g.vim_ai_chat = {
  options = {
    model = "gpt-3.5-turbo",
    max_tokens = 1000,
    temperature = 1,
    request_timeout = 20,
    selection_boundary = "",
  },
  ui = {
    code_syntax_enabled = 1,
    populate_options = 0,
    open_chat_command = "preset_below",
    scratch_buffer_keep_open = 0,
    paste_mode = 1,
  },
}
