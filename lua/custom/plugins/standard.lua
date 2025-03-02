return {
	{
		{ "folke/which-key.nvim" },
		{ "christoomey/vim-tmux-navigator" },
		{ "szw/vim-maximizer" },
		{ "mbbill/undotree" },

		{
			"mhinz/vim-startify",
			config = function()
				require("startify_")
			end,
		},

		-- " scheme
		{ "rafi/awesome-vim-colorschemes" },

		-- 'vimwiki/vimwiki',
		-- 'nikvdp/neomux',

		-- " vim register overview and more
		{ "gennaro-tedesco/nvim-peekup" },

		-- " Plug 'jiangmiao/auto-pairs'
		{ "kylechui/nvim-surround" },
		{
			"windwp/nvim-autopairs",
			config = function()
				require("surround_")
			end,
		},
		-- " comment code or whatever
		{
			"b3nj5m1n/kommentary",
			config = function()
				require("kommentary.config").use_extended_mappings()

				require("kommentary.config").configure_language("default", {
					prefer_single_line_comments = true,
				})
			end,
		},

		-- " list key bindings
		{
			"liuchengxu/vim-which-key",
			lazy = true,
		},
		{ "simrat39/symbols-outline.nvim" },

		-- " Snippet engine
		{ "hrsh7th/vim-vsnip" },
		{ "hrsh7th/vim-vsnip-integ" },
		{ "Neevash/awesome-flutter-snippets" },

		-- " Optional
		{ "MunifTanjim/nui.nvim" },
		{ "nvim-lua/popup.nvim" },
		{ "nvim-lua/plenary.nvim" },
		{
			"nvim-telescope/telescope.nvim",
			config = function()
				require("telescope_")
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{
			"folke/tokyonight.nvim",
			priority = 1000, -- make sure to load this before all the other start plugins
			-- event = "VeryLazy",
			lazy = false,
			init = function()
				vim.cmd([[colorscheme tokyonight]])
			end,
			config = function()
				require("tokyonight_")
			end,
		},
		{
			"nvim-treesitter/nvim-treesitter",
			config = function()
				require("treesitter_")
			end,
		},
		{ "nvim-treesitter/playground" },
		{
			"kyazdani42/nvim-web-devicons",
			lazy = true,
		},
		{
			"kyazdani42/nvim-tree.lua",
			-- lazy = true,
			config = function()
				require("tree_")
			end,
		},
		-- " buffer line
		{
			"akinsho/bufferline.nvim", -- , { ['tag'] = 'v2.*' })
			config = function()
				vim.opt.termguicolors = true
				require("bufferline").setup({})
			end,
		},

		-- {
		-- 	"sidebar-nvim/sidebar.nvim",
		-- 	config = function()
		-- 		local opts = {
		-- 			open = false,
		-- 		}

		-- 		require("sidebar-nvim").setup(opts)
		-- 	end,
		-- },
		{
			"elihunter173/dirbuf.nvim",
			config = function()
				require("dirbuf").setup({
					hash_padding = 2,
					show_hidden = true,
					sort_order = "default",
					write_cmd = "DirbufSync",
				})
			end,
		},

		{
			"rmagatti/goto-preview",
			config = function()
				require("goto-preview").setup({
					height = 100,
					default_mappings = true,
					opacity = 0,
				})
			end,
		},

		{
			"sonarom/buffer_manager.nvim",
			init = function()
				vim.api.nvim_set_keymap(
					"n",
					"<leader>m",
					':lua require("buffer_manager.ui").toggle_quick_menu()<CR>',
					{ silent = true }
				)
			end,
			config = function()
				require("buffer_manager").setup({})
			end,
		},

		{ "vscode-neovim/vscode-neovim" },

		{
			"christianchiarulli/nvcode-color-schemes.vim",
			config = function()
				require("colorscheme")
			end,
		},

		{
			"phaazon/hop.nvim",
			config = function()
				require("hop_")
			end,
		},

		{ "gbprod/substitute.nvim" },

		{ "mattn/emmet-vim" },
		{ "nvim-lualine/lualine.nvim" },
		{
			"epwalsh/pomo.nvim",
			version = "*", -- Recommended, use latest release instead of latest commit
			lazy = true,
			cmd = { "TimerStart", "TimerRepeat" },
			dependencies = {
				"rcarriga/nvim-notify",
			},
			config = function()
				require("promo_")
			end,
		},
		{
			"epwalsh/obsidian.nvim",
			version = "*", -- recommended, use latest release instead of latest commit
			lazy = true,
			event = {
				"BufReadPre (PATH)/**.md",
				"BufNewFile (PATH)/**.md",
			},
			ft = "markdown",
			dependencies = {
				-- Required.
				"nvim-lua/plenary.nvim",

				"hrsh7th/nvim-cmp",
				"nvim-telescope/telescope.nvim",
				"nvim-treesitter",
				"epwalsh/pomo.nvim",
			},
			config = function()
				require("obsidian_")
			end,
		},
		{
			"nvimtools/none-ls.nvim",
			dependencies = {
				"davidmh/cspell.nvim",
				"nvim-lua/plenary.nvim",
			},
		},
		{
			"YarikYar/posting.nvim",
			dependencies = { "akinsho/toggleterm.nvim" },
			config = function()
				require("posting").setup({
					border = "curved", -- valid options are "single" | "double" | "shadow" | "curved"
				})
			end,
			event = "BufRead",
			keys = {
				{
					"<leader>lp",
					function()
						require("posting").open()
					end,
					desc = "Open Posting floating window",
				},
			},
		},
		{
			"ibhagwan/fzf-lua",
			-- optional for icon support
			dependencies = { "nvim-tree/nvim-web-devicons" },
			-- or if using mini.icons/mini.nvim
			-- dependencies = { "echasnovski/mini.icons" },
			opts = {},
		},
		{ "glacambre/firenvim", build = ":call firenvim#install(0)" },
		{
			"folke/noice.nvim",
			event = "VeryLazy",
			opts = {
				-- add any options here
			},
			dependencies = {
				-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
				"MunifTanjim/nui.nvim",
			},
			config = function()
				require("notify").setup({
					top_down = false,
				})

				require("noice").setup({
					lsp = {
						-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
						override = {
							["vim.lsp.util.convert_input_to_markdown_lines"] = true,
							["vim.lsp.util.stylize_markdown"] = true,
							["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
						},
					},
					-- you can enable a preset for easier configuration
					presets = {
						bottom_search = true, -- use a classic bottom cmdline for search
						command_palette = true, -- position the cmdline and popupmenu together
						long_message_to_split = true, -- long messages will be sent to a split
						inc_rename = false, -- enables an input dialog for inc-rename.nvim
						lsp_doc_border = false, -- add a border to hover docs and signature help
					},
				})
			end,
		},
		{
			"linux-cultist/venv-selector.nvim",
			branch = "regexp",
			dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
			opts = {
				-- Your options go here
				-- name = "venv",
				-- auto_refresh = false
			},
			event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
			keys = {
				-- Keymap to open VenvSelector to pick a venv.
				{ "<leader>vs", "<cmd>VenvSelect<cr>" },
				-- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
				{ "<leader>vc", "<cmd>VenvSelectCached<cr>" },
			},
		},
	},
}
