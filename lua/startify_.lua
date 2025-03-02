local module = require("general-settings.utils").M

vim.g.startify_session_dir = "$HOME/.config/nvim/session"
vim.g.startify_lists = {
	{ type = "files", header = { "   Files" } },
	{ type = "dir", header = { "   Current Directory " .. vim.fn.getcwd() } },
	{ type = "sessions", header = { "   Sessions" } },
	{ type = "bookmarks", header = { "   Bookmarks" } },
}
vim.g.startify_bookmarks = {
	{ i = "~/AppData/Local/nvim/init.lua" },
	{ r = "~/AppData/Local/nvim/lua" },
	{ p = "~/.config/nvim/plugged/" },
}

vim.g.startify_session_autoload = true
vim.g.startify_custom_header = {
	[[  _______  _   _     ______________ __    __  __   __ ]],
	[[ |__   __|| | | |   /____/| |______| |    | | \ \ / / ]],
	[[    | |   | |_| |  /___   | |______  |    | |  \ \ /  ]],
	[[    | |   |  _  | /___/   | |______| |    | |  /\ \   ]],
	[[    | |   | | | |/____    | |       \ \__/  | / /\ \  ]],
	[[    |_|   |_| |_|____/    |_|        \_____/ /_/  \_\ ]],
}

module.nmap("<C-s>", ":Startify<CR>")
