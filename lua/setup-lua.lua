local all = {
	-- { vscode = false, name = "lsp-config" },
	-- -- { vscode = false, name = 'status-line-config' },
	-- { vscode = false, name = "terminal-config" },
	-- -- { vscode = false, name = "git-config" },
	-- { vscode = false, name = "tree-config" },
	-- { vscode = false, name = "surround-config" },
	-- { vscode = false, name = "general-settings/settings" },
	-- { vscode = false, name = "outline-config" },
	-- { vscode = false, name = "telescope-config" },
	-- { vscode = false, name = "telescope-bookmark" },
	-- { vscome = false, name = "worktree-config" },
	-- -- { vscode = false, name = "commentary-config" },
	-- -- { vscode = false, name = "mason-config" },

	-- { vscode = false, name = "treesitter-config" },
	-- -- { vscode = false, name = "bufferline-config" },
	-- { vscode = false, name = "trouble-config" },
	-- -- { vscode = false, name = "goto-preview-config" },
	-- -- { vscode = false, name = "buffer-manager-config" },
	-- -- { vscode = false, name = "autopair-config" },
	-- -- { vscode = false, name = "startify" },
	-- { vscode = false, name = "peekup" },
	-- { vscode = false, name = "colorscheme" },
	-- { vscode = false, name = "tokyonight_" },
	-- -- { vscode = false, name = "spectre_" },
	-- { vscode = false, name = "hop_" },
	-- { vscode = false, name = "substitute_" },
	-- -- { vscode = false, name = "rust_creates_" },
	-- { vscode = false, name = "omnisharp_" },
	-- -- { vscode = false, name = "neovide" },
	-- -- { vscode = false, name = 'chatgpt_' },
	-- -- { vscode = false, name = 'sourcegraph_' },
	-- { vscode = false, name = "promo_" },
	-- { vscode = false, name = "obsidian_" },
	-- { vscode = false, name = "lualine_" },
	-- { vscode = false, name = "null_ls_" },
	-- -- { vscode = false, name = "lint_" },
	-- -- { vscode = false, name = "format_" },
	-- { vscode = false, name = "tuiterminal_" },
	-- -- { vscode = false, name = "gooseai_" },
	-- { vscode = false, name = "message_" },
	-- { vscode = false, name = "noice_" },
	-- -- { vscode = false, name = "better-notes_" },
	-- { vscode = false, name = "avante_" },
	-- { vscode = false, name = 'codecompanion' },
	-- { vscode = false, name = 'aider_' },
	-- { vscode = false, name = 'bacon-config' },
	-- { vscode = false, name = 'aerial-config' },
	-- { vscode = false, name = 'compe_' },
	-- { vscode = false, name = 'tabnine' },
	-- { vscode = false, name = 'debug-python' },
	-- { vscode = false, name = 'debug-config' },
	-- { vscode = false, name = 'debug-rust' },
	-- 'bufferline-config', out for now because it's not working as i like
	-- 'sidebar-config',
}

for k in pairs(package.loaded) do
	for _, value in ipairs(all) do
		if k:match(value.name) then
			if value.vscode == nil then
				goto continue
			end
			package.loaded[k] = nil
		end
		::continue::
	end
end

for _, value in ipairs(all) do
	if vim.g.vscode and value.vscode then
		require(value.name)
	elseif not vim.g.vscode then
		require(value.name)
	end
end
