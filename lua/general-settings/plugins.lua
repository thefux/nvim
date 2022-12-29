local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug('folke/tokyonight.nvim', {['branch'] = 'main'})
-- Plug 'brooth/far.vim'
Plug 'rust-lang/rust.vim'

Plug 'christoomey/vim-tmux-navigator'
-- Plug 'ctrlpvim/ctrlp.vim'

Plug 'szw/vim-maximizer'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify'

Plug "MunifTanjim/nui.nvim"

-- " scheme
Plug 'rafi/awesome-vim-colorschemes'

-- Plug 'octol/vim-cpp-enhanced-highlight'

-- " Plug 'thefux/lazygit.nvim'
-- " Using a non-default branch
Plug 'thefux/lazygit.nvim'

Plug 'vimwiki/vimwiki'

Plug 'nikvdp/neomux'

-- " vim register overview and more
Plug 'gennaro-tedesco/nvim-peekup'

-- " Plug 'jiangmiao/auto-pairs'
Plug 'kylechui/nvim-surround'
Plug 'windwp/nvim-autopairs'

-- " git client, commit navigator and more
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'itchyny/vim-gitbranch'

Plug 'thefux/git-worktree.nvim' --   " Plug 'ThePrimeagen/git-worktree.nvim'

-- " comment code or whatever
Plug 'b3nj5m1n/kommentary'

-- " list key bindings
Plug('liuchengxu/vim-which-key', { on = {'WhichKey', 'WhichKey!'} })

-- " Plug 'github/copilot.vim'

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

-- " Plug 'williamboman/nvim-lsp-installer'

-- " Completion framework
Plug 'hrsh7th/nvim-cmp'

-- " LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'

Plug 'onsails/lspkind.nvim'

-- " Other usefull completion sources
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'

-- " See hrsh7th's other plugins for more completion sources!

-- " To enable more of the features of rust-analyzer, such as inlay hints and more!
Plug 'simrat39/symbols-outline.nvim'
Plug 'simrat39/rust-tools.nvim'
Plug('saecki/crates.nvim', {['tag'] = 'v0.1.0'})

-- " Snippet engine
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'Neevash/awesome-flutter-snippets'

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

-- " Fuzzy finder
-- " Optional
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

-- " zoom In/Out
Plug 'drzel/vim-gui-zoom'

-- " linter
Plug 'mfussenegger/nvim-lint'

-- " debug
-- Plug 'mfussenegger/nvim-dap'

Plug 'nvim-lua/lsp-status.nvim'

Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug('nvim-treesitter/playground')
Plug 'stevearc/aerial.nvim' -- " TODO: configuration missing

Plug('glepnir/galaxyline.nvim', {['branch'] = 'main'})

-- " If you want to display icons, then use one of these plugins:
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

-- " buffer line
Plug('akinsho/bufferline.nvim', { ['tag'] = 'v2.*' })

Plug 'sidebar-nvim/sidebar.nvim'
Plug 'elihunter173/dirbuf.nvim'

-- " mutil cursor support
Plug 'terryma/vim-multiple-cursors'

-- " show all lsp infos (warning, error, etc.)
Plug 'folke/trouble.nvim'

-- " code formatter
Plug 'mhartington/formatter.nvim'

Plug 'rmagatti/goto-preview'

Plug 'sonarom/buffer_manager.nvim'

Plug 'ray-x/lsp_signature.nvim'

-- Plug 'pantharshit00/vim-prisma'

Plug 'vscode-neovim/vscode-neovim'

Plug 'christianchiarulli/nvcode-color-schemes.vim'

-- search and replace
Plug 'windwp/nvim-spectre'

Plug 'phaazon/hop.nvim'

Plug 'gbprod/substitue.nvim'

-- if os.getenv('OS') == 'Window_NT'  then
--     Plug('tzachar/cmp-tabnine', { ['do']= 'powershell ./install.ps1' })
-- else
--     Plug('tzachar/cmp-tabnine', { ['do']= './install.sh' })
-- end

-- " Plug 'ervandew/supertab'
-- " status line scheme
-- " Plug 'itchyny/lightline.vim'
-- " code snippets
-- " Plug 'SirVer/ultisnips'
-- " Plug 'mlaursen/vim-react-snippets'
-- " Plug 'honza/vim-snippets'

-- " folding
-- " Plug 'pseewald/vim-anyfold'

-- " Plug 'wincent/ferret'
-- " Plug 'nvim-lua/completion-nvim'
-- " Color scheme used in the GIFs!
-- " Plug 'arcticicestudio/nord-vim'

-- " Plug 'dhruvmanila/telescope-bookmarks.nvim'
-- " tree
-- " Plug 'rhysd/nyaovim-tree-view'

-- " Plug 'gruvbox-community/gruvbox'
-- " Plug 'whatyouhide/vim-gotham'
-- " Plug 'dracula/vim', { 'as': 'dracula' }
-- " prettier
-- " Plug 'sbdchd/neoformat'

-- " Plug 'akinsho/toggleterm.nvim'
-- " Plug 'akinsho/bufferline.nvim'
-- " Plug 'SmiteshP/nvim-gps'
-- " Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
-- " Plug 'airblade/vim-rooter'
-- " Plug 'preservim/tagbar'
-- " Plug 'preservim/nerdtree'
-- " Plug 'Xuyuanp/nerdtree-git-plugin'
-- " save last position
-- " Plug 'tweekmonster/gofmt.vim'

-- " use later
-- " Plug 'skywind3000/asyncrun.vim'
-- " Plug 'skywind3000/asynctasks.vim'

vim.call("plug#end")

