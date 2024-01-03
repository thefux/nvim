local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require"general-settings/settings"

require("lazy").setup({
    'folke/which-key.nvim',
    { 'folke/neoconf.nvim', cmd = 'Neoconf' },
    'folke/neodev.nvim',
    {
        "folke/tokyonight.nvim",
        priority = 1000, -- make sure to load this before all the other start plugins
        lazy = false,
        init = function()
            vim.cmd([[colorscheme tokyonight]])
        end,
    },
    'nvim-lua/plenary.nvim',
    'thefux/lazygit.nvim',
    'rust-lang/rust.vim',
    'christoomey/vim-tmux-navigator',
    'szw/vim-maximizer',
    'mbbill/undotree',
    'mhinz/vim-startify',

    -- " scheme
    'rafi/awesome-vim-colorschemes',

    -- " Using a non-default branch
    'thefux/lazygit.nvim',

    'vimwiki/vimwiki',

    'nikvdp/neomux',

    -- " vim register overview and more
    'gennaro-tedesco/nvim-peekup',

    -- " Plug 'jiangmiao/auto-pairs'
    'kylechui/nvim-surround',
    'windwp/nvim-autopairs',

    -- " git client, commit navigator and more
    'lewis6991/gitsigns.nvim',
    'tpope/vim-fugitive',
    'junegunn/gv.vim',
    'itchyny/vim-gitbranch',

    'thefux/git-worktree.nvim',

    -- " comment code or whatever
    'b3nj5m1n/kommentary',

    -- " list key bindings
    {
        'liuchengxu/vim-which-key',
        lazy = true,
    },

    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',

    {
        'hrsh7th/nvim-cmp',
        -- event = "InsertEnter",
        dependencies = {
            -- " LSP completion source for nvim-cmp
            'hrsh7th/cmp-nvim-lsp',

            -- " Other usefull completion sources
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'hrsh7th/nvim-compe',
        }
    },
    {
        "sourcegraph/sg.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        'onsails/lspkind.nvim',
    },

    -- " See hrsh7th's other plugins for more completion sources!

    -- " To enable more of the features of rust-analyzer, such as inlay hints and more!
    'simrat39/symbols-outline.nvim',
    'simrat39/rust-tools.nvim',
    {
        'saecki/crates.nvim',
        lazy = true,
    },

    -- " Snippet engine
    'hrsh7th/vim-vsnip',
    'hrsh7th/vim-vsnip-integ',
    'Neevash/awesome-flutter-snippets',

    'saadparwaiz1/cmp_luasnip',

    -- " Optional
    "MunifTanjim/nui.nvim",
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',

    -- " zoom In/Out
    'drzel/vim-gui-zoom',

    'nvim-lua/lsp-status.nvim',

    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/playground',
    -- 'stevearc/aerial.nvim', -- " TODO: configuration missing

    'glepnir/galaxyline.nvim',

    -- " If you want to display icons, then use one of these plugins:
    {
        'kyazdani42/nvim-web-devicons',
        lazy = true,
    },

    {
        'kyazdani42/nvim-tree.lua',
        lazy = true,
    },

    -- " buffer line
    'akinsho/bufferline.nvim', -- , { ['tag'] = 'v2.*' })

    'sidebar-nvim/sidebar.nvim',
    'elihunter173/dirbuf.nvim',

    -- " mutil cursor support
    -- 'terryma/vim-multiple-cursors',

    -- " show all lsp infos (warning, error, etc.)
    'folke/trouble.nvim',

    -- " code formatter
    -- Plug 'mhartington/formatter.nvim'

    'rmagatti/goto-preview',

    'sonarom/buffer_manager.nvim',

    'ray-x/lsp_signature.nvim',

    'vscode-neovim/vscode-neovim',

    'christianchiarulli/nvcode-color-schemes.vim',

    -- search and replace
    'windwp/nvim-spectre',

    'phaazon/hop.nvim',

    'gbprod/substitute.nvim',

    'mattn/emmet-vim',

    'OmniSharp/omnisharp-vim',

    'jackMort/ChatGPT.nvim',
    'rhysd/git-messenger.vim',
    'Hoffs/omnisharp-extended-lsp.nvim',
})

require"general-settings/mappings"

require'setup-lua'
