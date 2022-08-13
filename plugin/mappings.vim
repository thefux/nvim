" navigation"[[
nnoremap bn ^
nnoremap en $
if exists("g:vscode")
    nnoremap <silent> ,q :q<CR>
    nnoremap <silent> ,w :w<CR>
    nnoremap <silent> ,x :x<CR>
    nnoremap <silent> ,xa :xall<CR>
    nnoremap <silent> ,bq :bd!<CR>
else
    nnoremap <silent> <leader>q :q<CR>
    nnoremap <silent> <leader>w :w<CR>
    nnoremap <silent> <leader>x :x<CR>
    nnoremap <silent> <leader>xa :xall<CR>
    nnoremap <silent> <leader>bq :bd!<CR>
endif
"]]

" search [[
nnoremap <C-f> ?
"]]

" navigate quickfix [[
augroup QFixToggle
    autocmd!
    autocmd BufWinEnter quickfix let g:qfix_win = bufnr('$')
    autocmd BufWinLeave quickfix unlet g:qfix_win
augroup END
function! ToggleQuickfix()
    if exists('g:qfix_win')
        cclose
        unlet g:qfix_win
    else
        copen
        let g:qfix_win = 1
    endif
endfunction

nnoremap <silent> <c-q> :call ToggleQuickfix()<CR>
nnoremap <c-a> :cn<CR>
nnoremap <c-b> :cp<CR>
""]]

" center the screen [[
nnoremap G Gzz
nnoremap } }zz
nnoremap { {zz
nnoremap n nzz
noremap N Nzz
"]]

" update or. load soure[[
nnoremap <silent> <leader>v :split $MYVIMRC<CR>
nnoremap <silent> <leader>s :source $MYVIMRC<CR>
nnoremap <silent> <leader>S :source %<CR>
"]]

" resize windows splits [[
noremap <silent> <C-left> <C-w><
noremap <silent> <C-right> <C-w>>
noremap <silent> <C-up> :3winc +<CR>
noremap <silent> <C-down> :3winc -<CR>
noremap <silent> <C-\|> <C-w>v
"]]

" copy and paste from clipboard [[
nnoremap <silent> <leader>p "+p
map <silent> <leader>c "*y
"]]

" remap <c-z> to not break the editor [[
nnoremap <c-z> <c>
"]]

" copy in visual mode [[
xnoremap <silent> p pgvy
" ]]

" Folding commands.
" zf#j create a fold from the cursor down # lines.
" zf/string creates a fold form the cursor to string.
" zj moves the cursor to the next fold.
" zo opens all fold at the cursor.
" zO opens all folds at the cursor.
" zm increases the foldlevel by one.
" zM closes all open folds.
" zr decreases the foldlevel by one.
" zR decrease the foldlevel to zero -- all fold will be open.
" zd delete the fold at the cursor.
" zE delete all folds.
" [z move to start of open fold.
" ]z move to end of open fold.
" @ Source: www.linux.com/lean/vim-tips-folding-fun@



" Relative number modus.
" [#]j: go to the #(line number) forward
" [#]k: go to the #(line number) backward



" move vim page up and down.
" <c-b>   -   move back one full screen
" <c-f>   -   move forward one full screen
" <c-d>   -   move forward 1/2 screen
" <c-u>   -   move back 1/2 screen


" move in the screen
" zz - move current line to the middle of the screen
" zt - move current line to the top of the screen
" zb - move current line to the bottom of the screen
"
"
" remove all spaces (begin of line)
" =
" works with a sequence
"
"
" add word to vi library, for spellcheck
" zg
"
"
" command-T shortcuts
"
" <CR>  open selected file.
" <C-CR>, <C-s> open selected file in a new split window.
" <C-v> open selected file in new vertical split window.
" <C-t> open selected file in a new tab.

