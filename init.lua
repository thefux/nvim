vim.g.mapleader = ","

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)

vim.env["CODECOMPANION_TOKEN_PATH"] = vim.fn.expand("~/.config")
vim.env["OLLAMA_API_BASE"] = "http://100.90.84.147:11434"

-- require("general-settings/settings")

require("lazy").setup({
	import = "custom/plugins",
	log = {
		level = "debug",
	},
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})

vim.cmd([[colorscheme tokyonight]])
-- colorscheme tokyonight
-- require("general-settings/mappings")

-- require("setup-lua")
