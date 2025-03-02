return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns_")
		end,
	},
	"tpope/vim-fugitive",
	"junegunn/gv.vim",
	"itchyny/vim-gitbranch",

	{
		"thefux/git-worktree.nvim",
		config = function()
			require("worktree_")
		end,
	},
	{
		"thefux/lazygit.nvim",
		config = function()
			vim.api.nvim_set_keymap(
				"n",
				"<leader>gg",
				"<cmd>lua require'tools'.lazygit_toggle()<CR>",
				{ noremap = true, silent = true }
			)

			return {
				lazygit_toggle = lazygit_toggle,
			}
		end,
	},
	{
		"akinsho/git-conflict.nvim",
		config = function()
			require("git-conflict").setup({
				default_mappings = true, -- disable buffer local mapping created by this plugin
				default_commands = true, -- disable commands created by this plugin
				disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
				list_opener = "copen", -- command or function to open the conflicts list
				highlights = { -- They must have background color, otherwise the default color will be used
					incoming = "DiffAdd",
					current = "DiffText",
				},
			})
		end,
	},
	"rhysd/git-messenger.vim",
}
