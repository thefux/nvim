local module = require"general-settings.utils".M
local nmap = module.nmap
local xmap = module.xmap

nmap("bn", "^")
nmap("en", "$")
nmap("<C-f>", "?")

-- copy and paste from clipboard [[
nmap("<leader>p", '"+p')
nmap("<leader>c", '"*y')
xmap("p", "pgvy")
-- ]]

if not vim.g.vscode then
    nmap("<leader>q", ":q<CR>")
    nmap("<leader>w", ":w<CR>")
    nmap("<leader>x", ":x<CR>")
    nmap("<leader>xa", ":xall<CR>")
    nmap("<leader>bq", ":bd!<CR>")

else
    nmap("<leader>w", "<Cmd>call VSCodeNotify('workbench.action.files.save', {})<CR>")
    nmap("<leader>q", "<Cmd>call VSCodeNotify('workbench.action.closeActiveEditor', {})<CR>")
    nmap("<leader>x", "<Cmd>call VSCodeCall('workbench.action.files.save', {})<CR> | <Cmd>call VSCodeCall('workbench.action.closeActiveEditor', {})<CR>")
    nmap("<leader>xa", "<Cmd>call VSCodeCall('workbench.action.files.saveAll', {})<CR> | <Cmd>call VSCodeCall('workbench.action.closeAllEditors', {})<CR>")
    nmap("<leader>wa", "<Cmd>call VSCodeNotify('workbench.action.files.saveAll', {})<CR>")
    nmap("<leader>qa", "<Cmd>call VSCodeNotify('workbench.action.closeAllEditors', {})<CR>")
    nmap("<C-f>", "<Cmd>call VSCodeNotify('action.find', {})<CR>")
end

