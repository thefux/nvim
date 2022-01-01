nnoremap <silent> <c-p> :CtrlP<CR>
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.d,*.pdb
let g:ctrlp_custom_ignore = {
  \ 'file': '\v\.(exe|d|pdb)$',
  \ }

