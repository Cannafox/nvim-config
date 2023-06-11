local config = {
  config_file_preferred_name = 'cspell.json',

  find_json = function(cwd)
  end,

  encode_json = function(cspell_str)
  end,

  encode_json = function(cspell_tbl)
  end,

  on_success = function(cspell_config_file_path, params, action_name)
      -- For example, you can format the cspell config file after you add a word
      if action_name == 'add_to_json' then
          os.execute(
              string.format(
                  "cat %s | jq -S '.words |= sort' | tee %s > /dev/null",
                  cspell_config_file_path,
                  cspell_config_file_path
              )
          )
      end

      -- Note: The cspell_config_file_path param could be nil for the
      -- 'use_suggestion' action
  end
}

local cspell = require('cspell')
local sources = {
  cspell.diagnostics.with({ config = config }),
  cspell.code_actions.with({ config = config }),
}
