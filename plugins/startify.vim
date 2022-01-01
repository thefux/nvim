let g:startify_session_dir = '$HOME/.config/nvim/session'
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']             },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()]  },
          \ { 'type': 'sessions',  'header': ['   Sessions']        },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']       },
          \ ]
let g:startify_bookmarks = [
            \ { 'i': '$HOME/AppData/Local/nvim/init.vim'  },
            \ ]
let g:startify_session_autoload = 1
let g:startify_custom_header = [
        \ '  _______  _   _     ______________  _      _  __   __ ',
        \ ' |__   __|| | | |   /____/| |______|| |    | | \ \ / / ',
        \ '    | |   | |_| |  /___   | |______ | |    | |  \ \ /  ',
        \ '    | |   |  _  | /___/   | |______|| |    | |  /\ \   ',
        \ '    | |   | | | |/____    | |       | \____/ | / /\ \  ',
        \ '    |_|   |_| |_|____/    |_|       \________//_/  \_\ ',
        \]

nnoremap <silent> <C-s> :Startify<CR>

