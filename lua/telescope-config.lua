local get_root = require'general-settings.utils'.get_root

local actions = require'telescope.actions'
local trouble = require'trouble.providers.telescope'


require('telescope').setup {
  extensions = {
    bookmarks = {
      -- Available: 'brave', 'chrome', 'edge', 'firefox', 'safari'
      selected_browser = 'brave',

      -- Either provide a shell command to open the URL
      url_open_command = 'open',

      -- Or provide the plugin name which is already installed
      -- Available: 'vim_external', 'open_browser'
      url_open_plugin = nil,

      -- Show the full path to the bookmark instead of just the bookmark name
      full_path = true,

      -- Provide a custom profile name for Firefox
      firefox_profile_name = nil,
    },
  },
  defaults = {
      mappings = {
          i = {['<c-t>'] = trouble.open_with_trouble},
          n = {['<c-t>'] = trouble.open_with_trouble},
      }
  }
}


local function setup_function(keymap, function_name)
    vim.api.nvim_set_keymap('n', keymap, '',
    {
        callback = function ()
            local cmd = string.format(':lua require("telescope.builtin").%s({ cwd = "%s" })', function_name, get_root())
            vim.api.nvim_command(cmd)
        end,
        noremap = true, silent = true
    })
end

setup_function('<leader>ff', 'find_files')
setup_function('<leader>fg', 'live_grep')
print(get_root())

-- vim.api.nvim_set_keymap('n', '<leader>ff', '',
-- {
--     callback = function ()
--         local cmd = string.format(':lua require("telescope.builtin").find_files({ cwd = "%s" })', get_root())
--         vim.api.nvim_command(cmd)
--     end,
--     noremap = true, silent = true
-- })

-- vim.api.nvim_set_keymap('n', '<leader>fg', '',
-- {
--     callback = function ()
--         local cmd = string.format(':lua require("telescope.builtin").live_grep({ cwd = "%s" })', get_root())
--         vim.api.nvim_command(cmd)
--     end,
--     noremap = true, silent = true
-- })


-- vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<cr>', {noremap = true, silent = true})
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<cr>', {noremap = true, silent = true})
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<cr>', {noremap = true, silent = true})
