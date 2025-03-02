return {
	{
		dir = "~/nvim-plugin/tui_terminal.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("tuiterminal_")
		end,
	},
	{
		dir = "~/nvim-plugin/gooseai.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("gooseai").setup({
				sessions_path = "/Users/rakezab/.local/share/goose/sessions",
				-- template = {
				--     description = "Default session template",
				--     model = "llama2",
				--     provider = "ollama",
				--     extensions = {
				--         developer = { enabled = true }
				--     }
				-- }
			})
		end,
	},
	{
		dir = "~/nvim-plugin/message.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"folke/noice.nvim",
		},
	},
	{
		dir = "~/nvim-plugin/better-search.nvim/",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim", -- required by telescope
		},
		config = function()
			require("vscode-search").setup({
				-- Optional configuration
				root_patterns = { ".git", ".github", "package.json" },
				search = {
					case_sensitive = false,
					ignore_patterns = {
						"*.git/*",
						"node_modules/*",
						"vendor/*",
					},
				},
			})
		end,
	},
	{
		dir = "~/nvim-plugin/better-notes.nvim/",
		dependencies = {
			"nvim-lua/plenary.nvim", -- for http requests
		},
		opts = {
			-- Optional custom configuration
			notes_dir = vim.fn.expand("~/.notes"),
			date_format = "%Y-%m-%d",
			time_format = "%H:%M:%S",
			mcp_host = "localhost",
			mcp_port = 8080,
		},
		config = function()
			require("better-notes").setup()
		end,
	},
}
