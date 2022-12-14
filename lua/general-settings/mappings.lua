local module = require"general-settings.utils".M
local nmap = module.nmap
local xmap = module.xmap

nmap("bn", "^")
nmap("en", "$")
nmap("<C-f>", "?")

-- copy and paste from clipboard
nmap("<leader>p", '"+p')
nmap("<leader>c", '"*y')
xmap("p", "pgvy")

if not vim.g.vscode then
    nmap("<leader>q", ":q<CR>")
    nmap("<leader>w", ":w<CR>")
    nmap("<leader>x", ":x<CR>")
    nmap("<leader>xa", ":xall<CR>")
    nmap("<leader>bq", ":bd!<CR>")
    -- center the screen
    nmap("G", "Gzz")
    nmap("}", "}zz")
    nmap("{", "{zz")
    nmap("n", "nzz")
    nmap("N", "Nzz")

    -- update or. load soure
    nmap("<leader>v", ":split")
    nmap("<leader>s", ":source")
    nmap("<leader>S", ":source")

    -- resize windows splits
    nmap("<C-left>", "<C-w><")
    nmap("<C-right>", "<C-w>>")
    nmap("<C-up>", ":3winc +<")
    nmap("<C-down>", ":3winc -<")
    nmap([[<C-\|>]], "<C-w>v")

    -- remap <c-z> to not break the editor
    nmap("<C-z>", "<c>")

    -- " navigate quickfix [[
    -- augroup QFixToggle
    --     autocmd!
    --     autocmd BufWinEnter quickfix let g:qfix_win = bufnr('$')
    --     autocmd BufWinLeave quickfix unlet g:qfix_win
    -- augroup END
    -- function! ToggleQuickfix()
    --     if exists('g:qfix_win')
    --         cclose
    --         unlet g:qfix_win
    --     else
    --         copen
    --         let g:qfix_win = 1
    --     endif
    -- endfunction

    -- nnoremap <silent> <c-q> :call ToggleQuickfix()<CR>
    -- nnoremap <c-a> :cn<CR>
    -- nnoremap <c-b> :cp<CR>
    -- ""]]

    --  move vim page up and down.
    --  <c-b>   -   move back one full screen
    --  <c-f>   -   move forward one full screen
    --  <c-d>   -   move forward 1/2 screen
    --  <c-u>   -   move back 1/2 screen

    --  move in the screen
    --  zz - move current line to the middle of the screen
    --  zt - move current line to the top of the screen
    --  zb - move current line to the bottom of the screen

    --  remove all spaces (begin of line)
    --  =
    --  works with a sequence

    --  add word to vi library, for spellcheck
    --  zg

else
    nmap("<leader>w", "<Cmd>call VSCodeNotify('workbench.action.files.save', {})<CR>")
    nmap("<leader>q", "<Cmd>call VSCodeNotify('workbench.action.closeActiveEditor', {})<CR>")
    nmap("<leader>x", "<Cmd>call VSCodeCall('workbench.action.files.save', {})<CR> | <Cmd>call VSCodeCall('workbench.action.closeActiveEditor', {})<CR>")
    nmap("<leader>xa", "<Cmd>call VSCodeCall('workbench.action.files.saveAll', {})<CR> | <Cmd>call VSCodeCall('workbench.action.closeAllEditors', {})<CR>")
    nmap("<leader>wa", "<Cmd>call VSCodeNotify('workbench.action.files.saveAll', {})<CR>")
    nmap("<leader>qa", "<Cmd>call VSCodeNotify('workbench.action.closeAllEditors', {})<CR>")
    nmap("<C-f>", "<Cmd>call VSCodeNotify('action.find', {})<CR>")
end

