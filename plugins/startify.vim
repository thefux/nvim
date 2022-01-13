let g:startify_session_dir = '$HOME/.config/nvim/session'
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']             },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()]  },
          \ { 'type': 'sessions',  'header': ['   Sessions']        },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']       },
          \ ]
let g:startify_bookmarks = [
            \ { 'i': '$HOME/AppData/Local/nvim/init.vim'  },
            \ { 'l': '$HOME/AppData/Local/nvim/lua'  },
            \ { 'p': '$HOME/AppData/Local/nvim/plugins'  },
            \ { 'b': '$HOME/AppData/Local/nvim/plugin'  },
            \ ]
let g:startify_session_autoload = 1
" topleft, topright, botleft, botright = '╭', '╮', '╰', '╯'
let g:startify_custom_header = [
        \ '  _______  _   _     ______________ __    __  __   __ ',
        \ ' |__   __|| | | |   /____/| |______| |    | | \ \ / / ',
        \ '    | |   | |_| |  /___   | |______  |    | |  \ \ /  ',
        \ '    | |   |  _  | /___/   | |______| |    | |  /\ \   ',
        \ '    | |   | | | |/____    | |       \ \__/  | / /\ \  ',
        \ '    |_|   |_| |_|____/    |_|        \_____/ /_/  \_\ ',
        \]

nnoremap <silent> <C-s> :Startify<CR>

