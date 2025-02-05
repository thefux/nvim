require("nvim_aider").setup({
  -- Command line arguments passed to aider
  args = {
    "--openai-api-base",
    "http://100.90.84.147:11434",
    "--model",
    -- "ollama_chat/deepseek-r1:32b",
    -- "ollama_chat/qwen2.5-coder:14b",
    "ollama_chat/llama3.2:latest",
    -- "--no-auto-commits",
    "--pretty",
    "--stream",
  },

  -- Theme colors (automatically uses Catppuccin flavor if available)
  theme = {
    user_input_color = "#a6da95",
    tool_output_color = "#8aadf4",
    tool_error_color = "#ed8796",
    tool_warning_color = "#eed49f",
    assistant_output_color = "#c6a0f6",
    completion_menu_color = "#cad3f5",
    completion_menu_bg_color = "#24273a",
    completion_menu_current_color = "#181926",
    completion_menu_current_bg_color = "#f4dbd6",
  },

  -- Other snacks.terminal.Opts options
  config = {
    os = { editPreset = "nvim-remote" },
    gui = { nerdFontsVersion = "3" },
  },

  win = {
    style = "nvim_aider",
    position = "bottom",
  },
})

-- require('aider').setup({
--   -- Automatically start Aider when an AI comment (`ai!`, `ai?`, or `ai`) is written
--   spawn_on_comment = true,

--   -- Automatically show aider terminal window
--   auto_show = {
--     on_ask = true, -- e.x. `ai? comment`
--     on_change_req = false, -- e.x. `ai! comment`
--     on_file_add = true, -- e.x. when using Telescope or `AiderLoad` to add files
--   },

--   -- function to run when aider updates file/s, useful for triggering git diffs
--   after_update_hook = nil,

--   -- Filters for the `Telescope model_picker`
--   model_picker_search = { "^llama3.2:latest/", "^openai/", "^gemini/", "^deepseek/" },

--   -- Enable the `--watch-files` flag for Aider, enabling automatic startup on valid comment creation
--   watch_files = true,

--   -- Configuration for `snacks.nvim` progress notifications
--   progress_notifier = {
--     style = "compact",
--     -- * compact: use border for icon and title
--     -- * minimal: no border, only icon and message
--     -- * fancy: similar to the default nvim-notify style
--   },

--   -- Display Aider's logs using fidget.nvim (requires fidget.nvim)
--   log_notifier = false,

--   -- code theme to use for markdown blocks when in dark mode
--   code_theme_dark = "monokai",

--   -- code theme to use for markdown blocks when in light mode
--   code_theme_light = "default",

--   -- Command to open a nested editor when invoking `/editor` from the Aider terminal (requires `flatten.nvim`)
--   editor_command = "nvim --cmd 'let g:flatten_wait=1' --cmd 'cnoremap wq write<bar>bdelete<bar>startinsert'",

--   -- auto insert mode
--   auto_insert = true,

--   -- additional arguments for aider CLI
--   aider_args = {
--     "--openi-api-base",
--     "http://100.90.84.147:11434",
--     "--model",
--     "ollama_chat/deepseek-r1:32b",
--   },

--   -- always start aider on startup
--   spawn_on_startup = false,

--   -- Restart Aider when the working directory changes.
--   -- Note that `aider.nvim` maintains separate terminals for each directory, often making restarts unnecessary.
--   restart_on_chdir = false,

--   -- function to run (e.x. for term mappings) when terminal is opened
--   on_term_open = nil,

--   -- Determines whether to use dark themes for code blocks and the `--dark-mode` flag (if a supported theme is unavailable)
--   dark_mode = function()
--     return vim.o.background == "dark"
--   end,
--   -- auto scroll terminal on output
--   auto_scroll = true,
--   -- Window layout settings for the Aider terminal
--   win = {
--     -- type of window layout to use
--     direction = "float", -- can be 'float', 'vertical', 'horizontal', 'tab'
--     -- size function for terminal
--     size = function(term)
--       if term.direction == "horizontal" then
--         return math.floor(vim.api.nvim_win_get_height(0) * 0.4)
--       elseif term.direction == "vertical" then
--         return math.floor(vim.api.nvim_win_get_width(0) * 0.4)
--       end
--     end,
--     -- Flat configuration options (see `toggleterm.nvim` for valid options)
--     float_opts = {
--       border = "single",
--       width = function()
--         return math.floor(vim.api.nvim_win_get_width(0) * 0.95)
--       end,
--       height = function()
--         return math.floor(vim.api.nvim_win_get_height(0) * 0.95)
--       end,
--     },
--   },
--   -- Telescope key mappings
--   telescope = {
--     -- Runs `/add <files>` for selected entries (with multi-select supported)
--     add = "<C-l>",
--     -- Runs `/read-only <files>` for selected entries (with multi-select supported)
--     read_only = "<C-r>",
--     -- Runs `/drop <files>` for selected entries (with multi-select supported)
--     drop = "<C-z>",
--   },
--   -- fzf-lua key mappings
--   fzf = {
--     -- Runs `/add <files>` for selected entries (with multi-select supported)
--     add = "ctrl-l",
--     -- Runs `/read-only <files>` for selected entries (with multi-select supported)
--     read_only = "ctrl-r",
--     -- Runs `/drop <files>` for selected entries (with multi-select supported)
--     drop = "ctrl-z",
--     },
--   -- theme colors for aider
--   theme = nil,

--   -- The Git pager to use. Defaults to `cat` to prevent blocking the `after_update_hook`
--   git_pager = "cat",

--   -- Enable experimental tmux support
--   use_tmux = true,
--   }
-- )
