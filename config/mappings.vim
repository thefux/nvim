" terminal [[
nnoremap <leader>tt :terminal<CR>
nnoremap <leader>tv <C-w>v :terminal<CR>
"]]

" navigation"[[
nnoremap bn ^
nnoremap en $
nnoremap <silent> <leader>q :q<CR>
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>x :x<CR>
nnoremap <silent> <leader>xa :xall<CR>
"]]

nnoremap <C-f> ?

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

" ctrlp [[
nnoremap <silent> <c-p> :CtrlP<CR>
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.d,*.pdb
let g:ctrlp_custom_ignore = {
  \ 'file': '\v\.(exe|d|pdb)$',
  \ }
"]]

" fzf finder [[
" map <silent> <c-b> :CocFzfList<CR>
"]] <silent>

" tagbar [[
nmap <silent> <F8> :TagbarToggle<CR>
""]]

" nerdtree [[
" nnoremap <silent> <leader>n :NERDTreeFocus<CR>
" toggling is more convinient for now
nnoremap <silent> <C-n> :NERDTreeToggle<CR>
"]]

" escape terminal insert mode [[
tnoremap <Esc> <C-\><C-n>
"]]

" undo tree toggle[[
nnoremap <silent> <F4> :UndotreeToggle<CR>
"]]

" maximize current window[[
nnoremap <silent> <c-m> :MaximizerToggle<CR>
"]]

" resize windows splits [[
noremap <silent> <C-left> <C-w><
noremap <silent> <C-right> <C-w>>
noremap <silent> <C-up> :3winc +<CR>
noremap <silent> <C-down> :3winc -<CR>
noremap <silent> <C-\|> <C-w>v
"]]

" startify [[
nnoremap <silent> <C-s> :Startify<CR>
"]]

" coc code navigation [[
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
"]]

" set default peekup register [[
lua require('nvim-peekup.config').on_keystroke["paste_reg"] = '"'
lua require('nvim-peekup.config').on_keystroke["delay"] = '30ms'
lua require('nvim-peekup.config').geometry["height"] = 0.8
lua require('nvim-peekup.config').geometry["title"] = 'thefux register'
lua require('nvim-peekup.config').geometry["wrap"] = false
"]]

" fugitive, git[[
nmap <leader>gs :G<CR>
nmap <leader>gr :diffget //3<CR>
nmap <leader>gl :diffget //2<CR>
"]]

" copy and paste from clipboard [[
nnoremap <silent> <leader>p "+p 
map <silent> <leader>c "*y
"]]

" coc tab comletion[[
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endfunction

" inoremap <silent><expr> <Tab>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<Tab>" :
"       \ coc#refresh()
 "]]
 
" remap <c-z> to not break the editor [[
nnoremap <c-z> <c>
"]]

" searching mapping, commands are defined in settings.vim [[
command! -nargs=0 ReplaceCurrentWord :call ReplaceCurrentWord()<CR>
command! -nargs=0 RaplceWordInFile :call RaplceWordInFile()<CR>
map <silent> <F6> :call ReplaceCurrentWord()<CR>
map <silent> <c-F6> :call RaplceWordInFile()<CR>

command! -nargs=0 SearchAll :call s:doStuf(1)
command! -nargs=0 ReplaceCurrentWordAll :call s:doStuf(2)
command! -nargs=0 UndoLastReplaceCurrentWord :call s:doStuf(3)
command! -nargs=0 ReplaceWordAll :call s:doStuf(4)

" map <silent> <F9> :Rooter<CR> :call SearchAll()<CR> :cd %:p:h<CR>
map <silent> <F9> :Rooter<CR> :call SearchAll()<CR> :cd %:p:h<CR>
map <silent> <c-F9> :Rooter<CR> :call SearchFor()<CR> :cd %:p:h<CR>
map <silent> <F7> :<C-U> :Rooter<CR>:call ReplaceCurrentWordAll()<CR> :cd %:p:h<CR>
map <silent> <c-F8> :Rooter<CR> :call UndoLastReplaceCurrentWord()<CR>  :cd %:p:h<CR>
map <silent> <c-F7> :Rooter<CR> :call ReplaceWordAll()<CR>  :cd %:p:h<CR>
"]]

" refresh existing buffer[[
" nnoremap <leader>z :bd | e #<CR>
"]]

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
"
"
"
" Relative number modus.
" [#]j: go to the #(line number) forward
" [#]k: go to the #(line number) backward
"
"
"
" move vim page up and down.
" <c-b>   -   move back one full screen
" <c-f>   -   move forward one full screen
" <c-d>   -   move forward 1/2 screen
" <c-u>   -   move back 1/2 screen
"
"
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

