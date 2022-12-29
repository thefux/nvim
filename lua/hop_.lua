local hop = require('hop')

hop.setup()

local opts = {noremap = true, silent = true}
-- place this in one of your configuration file(s)
vim.api.nvim_set_keymap('n', 'W', ':lua require"hop".hint_words()<CR>', opts)
vim.api.nvim_set_keymap('n', 'P', ':lua require"hop".hint_patterns()<CR>', opts)
vim.api.nvim_set_keymap('n', 'F', ':lua require"hop".hint_lines()<CR>', opts)

