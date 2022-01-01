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
set noincsearch       " show search matches

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
set showmode
set foldmethod=manual

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
