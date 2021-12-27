call plug#begin('$HOME/AppData/Local/nvim/plugged')

" " Debugger Plugins
" Plug 'puremourning/vimspector'

" screen resizing
Plug 'szw/vim-maximizer'


Plug 'rust-lang/rust.vim'

" save last position
Plug 'tweekmonster/gofmt.vim'


" <F4> last changes on file
Plug 'mbbill/undotree'

" scheme
Plug 'gruvbox-community/gruvbox'
Plug 'whatyouhide/vim-gotham'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'octol/vim-cpp-enhanced-highlight'

" prettier
Plug 'sbdchd/neoformat'

" nvim v0.4.3
Plug 'kdheepak/lazygit.nvim', { 'branch': 'nvim-v0.4.3' }
Plug 'kdheepak/lazygit.nvim'


" vimwiki
Plug 'vimwiki/vimwiki'

Plug 'ervandew/supertab'

" search dir
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" code outlines
Plug 'preservim/tagbar'

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

" tmux navigator
Plug 'christoomey/vim-tmux-navigator'

" startup view, save workspace, etc...
Plug 'mhinz/vim-startify'

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
Plug 'airblade/vim-rooter'

" Plug 'C:\Users\abdou\AppData\Local\nvim\Plugins\vim-timetrack'

" Plug 'github/copilot.vim'
Plug 'f-person/git-blame.nvim'

Plug 'neovim/nvim-lspconfig'

" Completion framework
 Plug 'hrsh7th/nvim-cmp'
 
 " LSP completion source for nvim-cmp
 Plug 'hrsh7th/cmp-nvim-lsp'
 
 " Snippet completion source for nvim-cmp
 Plug 'hrsh7th/cmp-vsnip'
 
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
" Plug 'nvim-telescope/telescope.nvim'

" Color scheme used in the GIFs!
" Plug 'arcticicestudio/nord-vim'

" zoom In/Out
Plug 'drzel/vim-gui-zoom'

" tag support
Plug 'ludovicchabant/vim-gutentags'

" linter
Plug 'mfussenegger/nvim-lint'


" tree
" Plug 'rhysd/nyaovim-tree-view'

" floating windows
" Plug 'fhill2/floating.nvim' broken

call plug#end()

