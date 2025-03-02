require("nvim-surround").setup({
	keymaps = {
		insert = "<C-g>s",
		insert_line = "<C-g>S",
		normal = "ys",
		normal_cur = "yss",
		normal_line = "yS",
		normal_cur_line = "ySS",
		visual = "S",
		visual_line = "gS",
		delete = "ds",
		change = "cs",
	},
})

-- vim.api.nvim_set_keymap('v', 'S', '<ESC>gv<Cmd>lua require"surround".surround_add()<CR>', opts)
-- vim.api.nvim_set_keymap('v', 'ds', '<ESC>gv<Cmd>lua require"surround".surround_delete()<CR>', opts)
-- vim.api.nvim_set_keymap('v', 'dr', '<ESC>gv<Cmd>lua require"surround".surround_replace()<CR>', opts)

--     Old text                    Command         New text
-- --------------------------------------------------------------------------------
--     surr*ound_words             ysiw)           (surround_words)
--     *make strings               ys$"            "make strings"
--     [delete ar*ound me!]        ds]             delete around me!
--     remove <b>HTML t*ags</b>    dst             remove HTML tags
--     'change quot*es'            cs'"            "change quotes"
--     <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
--     delete(functi*on calls)     dsf             function calls
