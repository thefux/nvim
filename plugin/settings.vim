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
set listchars=tab:>-,extends:>,trail:*

set hlsearch        " highlight search
set incsearch       " show search matches

set title           " change title

set nobackup        " not backup or swap files

" set history=1000    " more command and search
" set ff=dos
" set backupdir=.
" set guicursor=

set scrolloff=2
set sidescrolloff=4

set pastetoggle=<F2>
set nohlsearch
set smartindent
set noswapfile
set termguicolors
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set colorcolumn=120

set cmdheight=2
set updatetime=50
set shortmess+=c
set hidden

set foldlevel=0
set foldenable
set foldmethod=manual
set showmode

set ruler       " show the cursor position all the time
set nospell

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
        set nocursorline nocursorcolumn
    augroup END
endif

function! SetLineHighlight()
    if &cursorline == 0
        set cursorline cursorcolumn
    else
        set nocursorline nocursorcolumn
    endif

    hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=green
    hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=green
endfunction
nnoremap <leader>h :call SetLineHighlight()<CR>
"]]

" color scheme [[
colorscheme onedark
highlight Normal guibg=dark
"]]

" TODO: fix this
" stay same line after living the Editor "[[
" au BufWinLeave *.* mkview
" au BufWinEnter *.* silent loadview
"]]

" tab Makefile"[[
au BufNewFile,BufReadPost Makefile se noexpandtab
"]]

