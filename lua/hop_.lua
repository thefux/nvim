require("hop").setup()

local opts = { noremap = true, silent = true }
-- place this in one of your configuration file(s)
vim.api.nvim_set_keymap("n", "<leader>W", ':lua require"hop".hint_words()<CR>', opts)
vim.api.nvim_set_keymap("n", "<leader>P", ':lua require"hop".hint_patterns()<CR>', opts)
vim.api.nvim_set_keymap("n", "<leader>F", ':lua require"hop".hint_lines()<CR>', opts)
