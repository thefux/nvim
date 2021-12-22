let mapleader = ","

" settings [[
set exrc
set expandtab
set nowrap
set linebreak
set shiftwidth=4
set tabstop=4
set softtabstop=4
" set ignorecase " ignore case when searching
" set smartcase

set inccommand=nosplit

" no sound effectzz
set noerrorbells
set visualbell

set path+=$PWD/**,.  " search every subdirectory
set wildmode=longest,list,full
set wildmenu  " show all matches

set autochdir
set background=dark
set autoindent
set copyindent
set nu
set relativenumber
set showmatch             " match parenthesis
set showmode
set bs=indent,eol,start     " allow backspacing over everything in insert
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        " than 50 lines of registers
set list
set listchars=tab:>-,extends:>

set hlsearch        " highlight search
set noincsearch       " show search matches

set title           " change title

set nobackup        " not backup or swap files

" set history=1000    " more command and search
" set ff=dos
" set backupdir=.
" set guicursor=
" set scrolloff=8

set pastetoggle=<F2>
set nohlsearch
set smartindent
set noswapfile
set termguicolors
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set colorcolumn=80

set cmdheight=2
set updatetime=50
set shortmess+=c
set hidden

set foldlevel=0
set foldenable
set showmode
set foldmethod=indent
autocmd! BufEnter,BufRead *.vim setlocal foldmethod=marker 
set foldmarker=[[,]]
set cindent

set ruler       " show the cursor position all the time
set spell

hi clear SpellBad
hi SpellBad cterm=underline
" set spelllang=de_de,en_us

highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

set splitbelow
set splitright
"]]

" color config [[
if &t_Co > 2 || has("gui_running")
    set t_Co=8
    augroup setColor
        autocmd!
        color desert
        set nocursorline
    augroup END
endif

function! SetLineHighlight()
    if &cursorline == 0
        set cursorline
    else
        set nocursorline
    endif

    hi CursorLine cterm=bold
    return
endfunction
nnoremap <leader>h :call SetLineHighlight()<CR>
"]]

" color scheme [[
colorscheme onedark
highlight Normal guibg=none
"]]

" stay same line after living the Editor "[[
" au BufWinLeave * mkview
" au BufWinEnter * silent loadview
"]]

" tab Makefile"[[
au BufNewFile,BufReadPost Makefile se noexpandtab
"]]

" tmux navigator [[
" save after switch
let g:tmux_navigator_save_on_switch = 2
"]]

" startify config [[
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
"]]

" set powershell as default [[
" set shell=powershell
"]]

" replace a word in current file [[
function! Replace(old)
    let l:input = input('replace "' . a:old . '" (in file) with: ')

    if len(l:input) == 0
        return
    endif

    let l:option = input('confirm options (e.g. c): ')
    execute '%s/' . a:old . '/' . l:input . '/g' . l:option
    execute ':wa!'
endfunction

function! ReplaceCurrentWord()
    let [line, column] = [line('.'), col('.')]
    let l:old = s:get_visual_selection()
    if len(l:old) == 0
        let l:old = expand('<cword>')
        if len(l:old) == 0
            return
        endif
    endif

    call cursor(line, column)
    call Replace(l:old)
endfunction

function! RaplceWordInFile()
    call inputsave()
    let l:old = input('type word to replace: ')
    if len(l:old) == 0
        return
    endif
    call inputrestore()

    call Replace(l:old)
endfunction

"]]

" find word and replace in whole project [[
" https://stackoverflow.com/questions/5686206/search-replace-using-quickfix-list-in-vim
function! QuickfixFilenames()
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[ quickfix_item['bufnr'] ] = bufname(quickfix_item['bufnr'])
  endfor

  return join(values(buffer_numbers))

endfunction

" Search Word [[
function! SearchWord(word)
    call inputsave()
    let l:option = '**/*.' . input('(word to find: "' . a:word . '")' . ', look for in file type: ')
    call inputrestore()

    " match only exact occurrence for now
    execute 'silent vimgrep! /' . a:word . '\C/gj ' . ' ' . l:option
endfunction

function! SearchAll()
    let l:input = expand('<cword>')
    if len(l:input) == 0
        return
    endif

    call SearchWord(l:input)
    execute ':copen'
endfunction

function! SearchFor()
    call inputsave()
    let l:input = input('type what you looking for: ')
    call inputrestore()
    if len(l:input) == 0
        return
    endif

    call SearchWord(l:input)
endfunction
"]]

function! ReplaceForAll(old, new)
    " store file names
    execute 'args ' . QuickfixFilenames()
    " apply change desired
    "
    execute 'argdo ' . '%s/' . a:old . '/' . a:new . '/ge | update'
    execute 'cdo ' . 's/' . a:old . '/' . a:new . '/ge | update'

    let g:undo_command = 'argdo ' . '%s/' . a:new . '/' . a:old . '/ge | update'
    let g:undo_command_cdo = 'cdo ' . 's/' . a:new . '/' . a:old . '/ge | update'
endfunction

function! ReplaceCurrentWordAll()
    let [line, column] = [line('.'), col('.')]
    let l:old = s:get_visual_selection()
    if len(l:old) == 0
        let l:old = expand('<cword>')
        if len(l:old) == 0
            return
        endif
    endif

    call inputsave()
    let l:input = input('replace "' . l:old . '" with: ')
    if len(l:input) == 0
        return
    endif

    call cursor(line, column)
    call inputrestore()

    " find all occurrence
    call SearchWord(l:old)

    call ReplaceForAll(l:old, l:input)
endfunction

function! ReplaceWordAll()
    call inputsave()
    let l:old = input('type word to replace: ')
    if len(l:old) == 0
        return
    endif

    let l:input = input('replace "' . l:old . '" with: ')
    if len(l:input) == 0
        return
    endif

    call inputrestore()

    " find all occurence
    call SearchWord(l:old)

    call ReplaceForAll(l:old, l:input)
endfunction

function! UndoLastReplaceCurrentWord()
    if !exists('g:undo_command')
        return
    endif

    execute g:undo_command
    execute g:undo_command_cdo
endfunction

function! s:doStuf(id)
    execute 'Rooter'

    if a:id == 1
        call SearchAll()
    elseif a:id == 2
        call ReplaceCurrentWordAll()
    elseif a:id == 3
        call UndoLastReplaceCurrentWord()
    elseif a:id == 4
        call ReplaceWordAll()
    endif
    execute 'cd %:p:h'
endfunction
"]]

" get visual selection [[
function! s:get_visual_selection()
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]

    " clear last search position
    call setpos("'<", [0, 0, column_end, 0])
    call setpos("'>", [0, 0, column_end, 0])
    return join(lines, "\n")
endfunction
"]]

" vim-rooter settings [[
let g:rooter_manual_only = 1
let g:rooter_patterns = ['.git']
let g:rooter_silent_chdir = 1
"]]

" ultisnips config [[
let g:UltiSnipsExpandTrigger='<c-j>'
" shortcut to go to next position
" let g:UltiSnipsJumpForwardTrigger='<c-j>'
" shortcut to go to previous position
" let g:UltiSnipsJumpBackwardTrigger='<c-k>'
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
" nmap        s   <Plug>(vsnip-select-text)
" xmap        s   <Plug>(vsnip-select-text)
" nmap        S   <Plug>(vsnip-cut-text)
" xmap        S   <Plug>(vsnip-cut-text)

" If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
" let g:vsnip_filetypes = {}
" let g:vsnip_filetypes.rust = ['rust']
" let g:vsnip_filetypes.rust = ['rust']
" ]]
