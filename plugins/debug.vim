func! OpenScopes()
lua << EOF
    require'debug-config'.debug_scopes()
EOF
endfunction

func! OpenFrames()
lua << EOF
require'debug-config'.debug_frames()
EOF
endfunction

augroup debug
    autocmd!
    command! OpenFrames :call OpenFrames()
    command! OpenScopes :call OpenScopes()
augroup end

