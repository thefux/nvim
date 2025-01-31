local get_root = require'general-settings.utils'.get_root

local actions = require'telescope.actions'
local trouble = require("trouble.sources.telescope")

require"telescope".load_extension('ui-select')


require('telescope').setup {
  extensions = {
    ["ui-select"] = {
    },
    bookmarks = {
      -- Available: 'brave', 'chrome', 'edge', 'firefox', 'safari'
      selected_browser = 'brave',

      -- Either provide a shell command to open the URL
      url_open_command = 'open',

      -- Or provide the plugin name which is already installed
      -- Available: 'vim_external', 'open_browser'
      url_open_plugin = nil,

      -- Show the full path to the bookmark instead of just the bookmark name
      full_path = false,

      -- Provide a custom profile name for Firefox
      firefox_profile_name = nil,
    },
  },
  defaults = {
      mappings = {
          i = {['<c-t>'] = trouble.open},
          n = {['<c-t>'] = trouble.open},
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

-- vim.keymap.set('n', '<leader>sg', require('telescope.builtin').git_files, { desc = '[S]earch [G]it Files' })
-- vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
-- vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
-- vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
-- vim.keymap.set('n', '<leader>f',  require('telescope.builtin').live_grep, { desc = '[F]ind text' })
-- vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
-- vim.keymap.set('n', '<leader>gl', require('telescope.builtin').git_commits, { desc = 'Show [G]it [L]og' })
-- vim.keymap.set('n', '<leader>glb', require('telescope.builtin').git_bcommits, { desc = 'Show [G]it [L]og of current [B]uffer' })
