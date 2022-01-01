call plug#begin('$HOME/AppData/Local/nvim/plugged')

" " Debugger Plugins
" Plug 'puremourning/vimspector'

Plug 'rust-lang/rust.vim'


Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-rooter'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/tagbar'

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'szw/vim-maximizer'

Plug 'mbbill/undotree'

Plug 'mhinz/vim-startify'

" save last position
Plug 'tweekmonster/gofmt.vim'
Plug 'gennaro-tedesco/nvim-peekup'

" scheme
Plug 'gruvbox-community/gruvbox'
Plug 'whatyouhide/vim-gotham'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'octol/vim-cpp-enhanced-highlight'

" prettier
Plug 'sbdchd/neoformat'

Plug 'kdheepak/lazygit.nvim', { 'branch': 'nvim-v0.4.3' }
Plug 'kdheepak/lazygit.nvim'


Plug 'vimwiki/vimwiki'

" Plug 'ervandew/supertab'


Plug 'nikvdp/neomux'

" vim register overview and more
Plug 'gennaro-tedesco/nvim-peekup'

" status line scheme
Plug 'itchyny/lightline.vim'

Plug 'jiangmiao/auto-pairs'
Plug 'blackcauldron7/surround.nvim'

" git client, commit navigator and more
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" code snippets
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'


" comment code or whatever
Plug 'tpope/vim-commentary'

" list key bindings
Plug 'liuchengxu/vim-which-key'

" folding
Plug 'pseewald/vim-anyfold'

" coc
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

Plug 'wincent/ferret'

" Plug 'C:\Users\abdou\AppData\Local\nvim\Plugins\vim-timetrack'

Plug 'github/copilot.vim'
Plug 'f-person/git-blame.nvim'

Plug 'neovim/nvim-lspconfig'

" Completion framework
 Plug 'hrsh7th/nvim-cmp'
 
 " LSP completion source for nvim-cmp
 Plug 'hrsh7th/cmp-nvim-lsp'
 
 " Other usefull completion sources
 Plug 'hrsh7th/cmp-path'
 Plug 'hrsh7th/cmp-buffer'
 
" See hrsh7th's other plugins for more completion sources!
 
" To enable more of the features of rust-analyzer, such as inlay hints and more!
 Plug 'simrat39/rust-tools.nvim'

" Snippet engine
Plug 'hrsh7th/vim-vsnip'
Plug 'Neevash/awesome-flutter-snippets'
 
" Fuzzy finder
" Optional
" Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Color scheme used in the GIFs!
" Plug 'arcticicestudio/nord-vim'

" zoom In/Out
Plug 'drzel/vim-gui-zoom'

" tag support
Plug 'ludovicchabant/vim-gutentags'

" linter
Plug 'mfussenegger/nvim-lint'
Plug 'mfussenegger/nvim-dap'

" Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" tree
" Plug 'rhysd/nyaovim-tree-view'

Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

" If you want to display icons, then use one of these plugins:
Plug 'kyazdani42/nvim-web-devicons' " lua

" Plug 'SmiteshP/nvim-gps'

call plug#end()

