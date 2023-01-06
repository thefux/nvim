require'substitute'.setup{
  on_substitute = nil,
  yank_substituted_text = false,
  range = {
    prefix = "s",
    prompt_current_text = false,
    confirm = false,
    complete_word = false,
    motion1 = false,
    motion2 = false,
    suffix = "",
  },
  exchange = {
    motion = false,
    use_esc_to_cancel = true,
  },
}

local opts = {noremap = true, silent = true}

vim.keymap.set("n", "<leader>s", "<cmd>lua require('substitute').operator()<cr>", opts)
vim.keymap.set("n", "<leader>ss", "<cmd>lua require('substitute').line()<cr>", opts)
vim.keymap.set("n", "<leader>S", "<cmd>lua require('substitute').eol()<cr>", opts)
vim.keymap.set("x", "<leader>s", "<cmd>lua require('substitute').visual()<cr>", opts)

vim.keymap.set("n", "<leader>rs", "<cmd>lua require('substitute.range').operator()<cr>", opts)
vim.keymap.set("x", "<leader>rss", "<cmd>lua require('substitute.range').visual()<cr>", opts)
vim.keymap.set("n", "<leader>rS", "<cmd>lua require('substitute.range').word()<cr>", opts)

vim.keymap.set("n", "<leader>xs", "<cmd>lua require('substitute.exchange').operator()<cr>", opts)
vim.keymap.set("x", "<leader>xss", "<cmd>lua require('substitute.exchange').visual()<cr>", opts)
vim.keymap.set("n", "<leader>xS", "<cmd>lua require('substitute.exchange').line()<cr>", opts)
-- vim.keymap.set("n", "<leader>xs", "<cmd>lua require('substitute.exchange').cancel()<cr>", opts)
