return {
	{
		"GeorgesAlkhouri/nvim-aider",
		cmd = {
			"AiderTerminalToggle",
			"AiderHealth",
		},
		keys = {
			{ "<leader>ao", "<cmd>AiderTerminalToggle<cr>", desc = "Open Aider" },
			{
				"<leader>as",
				"<cmd>AiderTerminalSend<cr>",
				desc = "Send to Aider",
				mode = { "n", "v" },
			},
			{ "<leader>ac", "<cmd>AiderQuickSendCommand<cr>", desc = "Send Command To Aider" },
			{ "<leader>ab", "<cmd>AiderQuickSendBuffer<cr>", desc = "Send Buffer To Aider" },
			{ "<leader>a+", "<cmd>AiderQuickAddFile<cr>", desc = "Add File to Aider" },
			{ "<leader>a-", "<cmd>AiderQuickDropFile<cr>", desc = "Drop File from Aider" },
			{ "<leader>ar", "<cmd>AiderQuickReadOnlyFile<cr>", desc = "Add File as Read-Only" },
			-- Example nvim-tree.lua integration if needed
			{ "<leader>a+", "<cmd>AiderTreeAddFile<cr>", desc = "Add File from Tree to Aider", ft = "NvimTree" },
			{
				"<leader>a-",
				"<cmd>AiderTreeDropFile<cr>",
				desc = "Drop File from Tree from Aider",
				ft = "NvimTree",
			},
		},
		dependencies = {
			"folke/snacks.nvim",
			"nvim-telescope/telescope.nvim",
			--- The below dependencies are optional
			"catppuccin/nvim",
			"nvim-tree/nvim-tree.lua",
		},
		config = function()
			require("aider_")
		end,
	},
	--        {
	--            "aweis89/aider.nvim",
	--            dependencies = {
	--                -- required for core functionality
	--                "akinsho/toggleterm.nvim",

	--                -- for fuzzy file `/add`ing functionality ("ibhagwan/fzf-lua" supported as well)
	--                "nvim-telescope/telescope.nvim",

	--                -- Optional, but great for diff viewing and after_update_hook integration
	--                "sindrets/diffview.nvim",

	--                -- Optional but will show aider spinner whenever active
	--                "folke/snacks.nvim",

	--                -- Only if you care about using the /editor command
	--                "willothy/flatten.nvim",
	--            },
	--            lazy = false,
	--            opts = {
	--                -- Auto trigger diffview after Aider's file changes
	--                after_update_hook = function()
	--                    require("diffview").open({ "HEAD^" })
	--                end,
	--            },
	--            keys = {
	--                {
	--                    "<leader>as",
	--                    "<cmd>AiderSpawn<CR>",
	--                    desc = "Toggle Aidper (default)",
	--                },
	--                {
	--                    "<leader>ao<space>",
	--                    "<cmd>AiderToggle<CR>",
	--                    desc = "Toggle Aider",
	--                },
	--                {
	--                    "<leader>af",
	--                    "<cmd>AiderToggle float<CR>",
	--                    desc = "Toggle Aider Float",
	--                },
	--                {
	--                    "<leader>av",
	--                    "<cmd>AiderToggle vertical<CR>",
	--                    desc = "Toggle Aider Float",
	--                },
	--                {
	--                    "<leader>al",
	--                    "<cmd>AiderAdd<CR>",
	--                    desc = "Add file to aider",
	--                },
	--                {
	--                    "<leader>ad",
	--                    "<cmd>AiderAsk<CR>",
	--                    desc = "Ask with selection",
	--                    mode = { "v", "n" },
	--                },
	--                {
	--                    "<leader>am",
	--                    desc = "Change model",
	--                },
	--                {
	--                    "<leader>ams",
	--                    "<cmd>AiderSend /model llama3.2:latest<CR>",
	--                    desc = "Switch to llama3.2",
	--                },
	--                {
	--                    "<C-x>",
	--                    "<cmd>AiderToggle<CR>",
	--                    desc = "Toggle Aider",
	--                    mode = { "i", "t", "n" },
	--                },
	--                -- Helpful mappings to utilize to manage aider changes
	--                {
	--                    "<leader>ghh",
	--                    "<cmd>Gitsigns change_base HEAD^<CR>",
	--                    desc = "Gitsigns pick reversals",
	--                },
	--                {
	--                    "<leader>dvh",
	--                    "<cmd>DiffviewOpen HEAD^<CR>",
	--                    desc = "Diffview HEAD^",
	--                },
	--                {
	--                    "<leader>dvo",
	--                    "<cmd>DiffviewOpen<CR>",
	--                    desc = "Diffview",
	--                },
	--                {
	--                    "<leader>dvc",
	--                    "<cmd>DiffviewClose!<CR>",
	--                    desc = "Diffview close",
	--                },
	--            },
	--        },
}
