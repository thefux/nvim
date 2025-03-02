return {
	{
		"mg979/vim-visual-multi",
		branch = "master",
		init = function()
			vim.g.VM_default_mappings = 0
			vim.g.VM_set_statusline = 0
			vim.g.VM_silent_exit = 1
			vim.g.VM_quit_after_leaving_insert_mode = 1
			vim.g.VM_show_warnings = 0
			vim.g.VM_maps = {
				["Undo"] = "u",
				["Redo"] = "<C-r>",
				["Find Under"] = "<leader-i>",
				["Skip Region"] = "<C-s>",
				["Select h"] = "<S-Left>",
				["Select l"] = "<S-Right>",
				["Add Cursor Up"] = "<C-Up>",
				["Find Subword Under"] = "<leader-i>",
				["Add Cursor Down"] = "<C-Down>",
				["Mouse Cursor"] = "<C-LeftMouse>",
				["Mouse Column"] = "<C-RightMouse>",
			}
			vim.g.VM_custom_remaps = {
				["<C-c>"] = "<Esc>",
			}
			vim.g.VM_highlight_matches = ""
			vim.g.multi_cursor_use_default_mapping = 0

			-- Default mapping
			vim.g.multi_cursor_start_word_key = "<C-b>"
			vim.g.multi_cursor_select_all_word_key = "<C-a>"
			vim.g.multi_cursor_start_key = "g<C-b>"
			vim.g.multi_cursor_select_all_key = "g<C-q>"
			vim.g.multi_cursor_next_key = "<C-b>"
			vim.g.multi_cursor_prev_key = "<C-l>"
			vim.g.multi_cursor_skip_key = "<C-x>"
			vim.g.multi_cursor_quit_key = "<Esc>"
		end,
	},
}
