" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>
 
" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100


" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

"" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map['/'] = [ '<Plug>NERDCommenterToggle'  , 'comment'  ]
let g:which_key_map['e'] = [ ':CocCommand explorer'       , 'explorer'  ]
let g:which_key_map['f'] = [ ':Files'                     , 'search files'  ]
let g:which_key_map['S'] = [ ':Startify'                  , 'start screen'  ]

" g is for git commands
let g:which_key_map.g = {
      \ 'name' : '+gitCommands' ,
      \ 'c' : [':Commits'      , 'commits'],
      \ 'C' : [':BCommits'     , 'buffer commits'],
      \ 'f' : [':Files'        , 'files'],
      \ 'g' : [':GFiles'       , 'git files'],
      \ 'G' : [':GFiles?'      , 'modified git files'],
      \ 'l' : [':LazyGit'      , 'git client'],
      \ }

let g:which_key_map.c = {
      \ 'name' : '+custom' ,
      \ 't' : [':terminal'      , 'terminal new tab'],
      \ 'u' : [':UndotreeToggle'  , 'undo tree'],
      \ 'm' : [':MaximizerToggle' , 'maximize win'],
      \ }

" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ 'g' : [':GFiles'       , 'git files'],
      \ 'G' : [':GFiles?'      , 'modified git files'],
      \ 's' : [':UltiSnipsEdit'     , 'snippets'],
      \ 'a' : [':ReplaceCurrentWord'     , 'ReplaceCurrentWord'],
      \ 'b' : [':ReplaceWordInFile'     , 'ReplaceWordInFile'],
      \ 'c' : [':SearchAll'     , 'SearchAll'],
      \ 'd' : [':SearchFor'     , 'SearchFor'],
      \ 'e' : [':UndoLastReplaceCurrentWord'     , 'UndoLastReplaceCurrentWord'],
      \ 'f' : [':ReplaceWordAll'     , 'ReplaceWordAll'],
      \ 'h' : [':ReplaceCurrentWordAll'     , 'ReplaceCurrentWordAll'],
      \ }

let g:which_key_map.f = {
      \ 'name' : '+codenavhelp' ,
      \ 'd' : ['gD'      , 'declaration'],
      \ 'D' : ['gd'     , 'definition'],
      \ 'k' : ['K'        , 'hover'],
      \ 'c' : ['ca'       , 'code action'],
      \ 'g' : ['gi'      , 'implementation'],
      \ }

let g:which_key_map.p = {
      \ 'name' : '+position' ,
      \ 'h' : ['<C-w>H'      , 'horizontal left'],
      \ 'l' : ['<C-w>L'     , 'horizontal right'],
      \ 'j' : ['<C-w>J'     , 'vertical Top'],
      \ 'k' : ['<C-w>K'     , 'vertical Bottom'],
      \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")

