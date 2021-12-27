let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
let g:python3_host_prog = "python"
let g:vimspector_install_gadgets = [ "debugpy", "vscode-cpptools", "CodeLLDB" ]
" let g:vimspector_base_dir=expand( "$HOME/.vim/vimspector-config/configuration/windows" )

" let g:vimspector_enable_mappings = 'HUMAN'
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput
