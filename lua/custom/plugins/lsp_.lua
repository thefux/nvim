return {
	{ "Hoffs/omnisharp-extended-lsp.nvim" },
	{ "ray-x/lsp_signature.nvim" },
	{
		"hrsh7th/nvim-cmp",
		-- event = "InsertEnter",
		dependencies = {
			-- " LSP completion source for nvim-cmp
			"hrsh7th/cmp-nvim-lsp",

			-- " Other usefull completion sources
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/nvim-compe",
		},
		config = function()
			require("lsp_")
		end,
	},
	{ "L3MON4D3/LuaSnip" },

	{ "williamboman/mason.nvim" },
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason_")
		end,
	},
	{ "neovim/nvim-lspconfig" },
	-- " show all lsp infos (warning, error, etc.)
	{
		"folke/trouble.nvim",
		config = function()
			require("trouble_")
		end,
	},
	{ "rust-lang/rust.vim" },
	"simrat39/rust-tools.nvim",
	{
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		lazy = true,
		config = function()
			require("crates").setup()
		end,
	},
}
