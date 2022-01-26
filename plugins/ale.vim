let g:ale_cpp_ccls_init_options = {
\   'cache': {
\       'directory': 'C:/Users/abdou.AWINIA/AppData/Local/Temp/cache'
\   }
\ }

let g:ale_completion_enabled=1

augroup ALE
    autocmd!
    autocmd FileType cpp nnoremap <buffer> <silent> gd :ALEGoToDefinition<cr>
    autocmd FileType cpp nnoremap <buffer> <silent> gr :ALEFindReferences<cr>
    autocmd FileType cpp nnoremap <buffer> <silent> gD :ALESymbolSearch<cr>
    autocmd FileType cpp nnoremap <buffer> <silent>  K :ALEHover<cr>
augroup end
