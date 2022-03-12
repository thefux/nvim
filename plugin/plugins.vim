call plug#begin('$HOME/AppData/Local/nvim/plugged')

Plug 'brooth/far.vim'
Plug 'rust-lang/rust.vim'

Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'szw/vim-maximizer'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify'

Plug 'dense-analysis/ale'

" scheme
Plug 'rafi/awesome-vim-colorschemes'

Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'thefux/lazygit.nvim'

Plug 'vimwiki/vimwiki'

Plug 'nikvdp/neomux'

" vim register overview and more
Plug 'gennaro-tedesco/nvim-peekup'

Plug 'jiangmiao/auto-pairs'
Plug 'blackcauldron7/surround.nvim'

" git client, commit navigator and more
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'itchyny/vim-gitbranch'  " get branch name

Plug 'thefux/git-worktree.nvim'   " Plug 'ThePrimeagen/git-worktree.nvim'

" comment code or whatever
Plug 'b3nj5m1n/kommentary'

" list key bindings
Plug 'liuchengxu/vim-which-key' ", { 'on': ['WhichKey', 'WhichKey!'] }

Plug 'github/copilot.vim'

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" Completion framework
 Plug 'hrsh7th/nvim-cmp'

 " LSP completion source for nvim-cmp
 Plug 'hrsh7th/cmp-nvim-lsp'

 " Other usefull completion sources
 Plug 'hrsh7th/cmp-path'
 Plug 'hrsh7th/cmp-buffer'

" See hrsh7th's other plugins for more completion sources!

" To enable more of the features of rust-analyzer, such as inlay hints and more!
 Plug 'simrat39/symbols-outline.nvim'
 Plug 'simrat39/rust-tools.nvim'
 Plug 'saecki/crates.nvim', {'tag': 'v0.1.0'}

" Snippet engine
Plug 'hrsh7th/vim-vsnip'
Plug 'Neevash/awesome-flutter-snippets'

" Fuzzy finder
" Optional
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" zoom In/Out
Plug 'drzel/vim-gui-zoom'

" linter
Plug 'mfussenegger/nvim-lint'
Plug 'mfussenegger/nvim-dap'

Plug 'nvim-lua/lsp-status.nvim'
Plug 'nvim-treesitter/nvim-treesitter' ", {'do': ':TSUpdate'}
" Plug 'nvim-treesitter/playground'

Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

" If you want to display icons, then use one of these plugins:
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'windwp/nvim-spectre'

Plug 'sidebar-nvim/sidebar.nvim'
Plug 'elihunter173/dirbuf.nvim'


" Plug 'ervandew/supertab'
" status line scheme
" Plug 'itchyny/lightline.vim'
" code snippets
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" folding
" Plug 'pseewald/vim-anyfold'

" Plug 'wincent/ferret'
" Plug 'nvim-lua/completion-nvim'
" Color scheme used in the GIFs!
" Plug 'arcticicestudio/nord-vim'

" Plug 'dhruvmanila/telescope-bookmarks.nvim'
" tree
" Plug 'rhysd/nyaovim-tree-view'

" Plug 'gruvbox-community/gruvbox'
" Plug 'whatyouhide/vim-gotham'
" Plug 'dracula/vim', { 'as': 'dracula' }
" prettier
" Plug 'sbdchd/neoformat'

" Plug 'akinsho/toggleterm.nvim'
" Plug 'akinsho/bufferline.nvim'
" Plug 'SmiteshP/nvim-gps'
" Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" Plug 'airblade/vim-rooter'
" Plug 'preservim/tagbar'
" Plug 'preservim/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" save last position
" Plug 'tweekmonster/gofmt.vim'


" use later
" Plug 'skywind3000/asyncrun.vim'
" Plug 'skywind3000/asynctasks.vim'

call plug#end()

