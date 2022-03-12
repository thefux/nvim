nnoremap <silent> <c-p> :CtrlP<CR>
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.d,*.pdb,*.dll,*.rlib,*.rmeta,*.lib,*.exp,*.timestamp,*.bin
let g:ctrlp_custom_ignore = {
  \ 'file': '\v\.(exe|d|pdb)$',
  \ }

let g:ctrlp_working_path_mode = 'rs'
