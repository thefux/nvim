require'nvim-surround'.setup{
}

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
