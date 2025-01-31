local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)

vim.env["CODECOMPANION_TOKEN_PATH"] = vim.fn.expand("~/.config")

require"general-settings/settings"

require("lazy").setup({
    spec = {
        'folke/which-key.nvim',
        {
            "folke/tokyonight.nvim",
            priority = 1000, -- make sure to load this before all the other start plugins
            event = "VeryLazy",
            lazy = false,
            init = function()
                vim.cmd([[colorscheme tokyonight]])
            end,
        },
        'thefux/lazygit.nvim',
        'rust-lang/rust.vim',
        'christoomey/vim-tmux-navigator',
        'szw/vim-maximizer',
        'mbbill/undotree',

        'mhinz/vim-startify',

        -- " scheme
        'rafi/awesome-vim-colorschemes',

        -- 'vimwiki/vimwiki',
        -- 'nikvdp/neomux',

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
        -- {
        --     "sourcegraph/sg.nvim",
        --     dependencies = { "nvim-lua/plenary.nvim" },
        --     'onsails/lspkind.nvim',
        -- },

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

        -- " Optional
        "MunifTanjim/nui.nvim",
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
        'nvim-telescope/telescope-ui-select.nvim',

        -- -- " zoom In/Out
        -- 'drzel/vim-gui-zoom',


        'L3MON4D3/LuaSnip',
        -- 'saadparwaiz1/cmp_luasnip',
        -- {
        --     "L3MON4D3/LuaSnip",
        --     -- follow latest release.
        --     version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        --     -- install jsregexp (optional!).
        --     build = "make install_jsregexp"
        -- },

        -- 'nvim-lua/lsp-status.nvim',

        'nvim-treesitter/nvim-treesitter',
        'nvim-treesitter/playground',
        -- 'stevearc/aerial.nvim', -- " TODO: configuration missing

        -- 'glepnir/galaxyline.nvim',

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

        -- 'sidebar-nvim/sidebar.nvim',
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
        -- 'windwp/nvim-spectre',

        'phaazon/hop.nvim',

        'gbprod/substitute.nvim',

        'mattn/emmet-vim',

        -- 'OmniSharp/omnisharp-vim',

        'nvim-lualine/lualine.nvim',
        -- 'jackMort/ChatGPT.nvim',
        -- {
            --     'nvim-lualine/lualine.nvim',
            --     dependencies = { 'nvim-tree/nvim-web-devicons' }
            -- },
            'rhysd/git-messenger.vim',
            {
                'epwalsh/pomo.nvim',
                version = '*',  -- Recommended, use latest release instead of latest commit
                lazy = true,
                cmd = { 'TimerStart', 'TimerRepeat' },
                dependencies = {
                    'rcarriga/nvim-notify',
                },
            },
            'Hoffs/omnisharp-extended-lsp.nvim',
            {
                "epwalsh/obsidian.nvim",
                version = "*",  -- recommended, use latest release instead of latest commit
                lazy = true,
                event = {
                    "BufReadPre (PATH)/**.md",
                    "BufNewFile (PATH)/**.md",
                },
                ft = "markdown",
                dependencies = {
                    -- Required.
                    'nvim-lua/plenary.nvim',

                    'hrsh7th/nvim-cmp',
                    'nvim-telescope/telescope.nvim',
                    'nvim-treesitter',
                    'epwalsh/pomo.nvim',
                },
            },
            {
                "nvimtools/none-ls.nvim",
                dependencies = {
                    'davidmh/cspell.nvim',
                    'nvim-lua/plenary.nvim',
                }
            },
            {
                "mg979/vim-visual-multi",
                branch = "master",
                init = function()
                    vim.g.VM_default_mappings = 0
                    vim.g.VM_set_statusline = 0
                    vim.g.VM_silent_exit = 1
                    vim.g.VM_quit_after_leaving_insert_mode = 1
                    vim.g.VM_show_warnings = 0
                    vim.g.VM_maps = {
                        ["Undo"] = "u",
                        ["Redo"] = "<C-r>",
                        ["Find Under"] = "<leader-i>",
                        ["Skip Region"] = "<C-s>",
                        ["Select h"] = "<S-Left>",
                        ["Select l"] = "<S-Right>",
                        ["Add Cursor Up"] = "<C-Up>",
                        ["Find Subword Under"] = "<leader-i>",
                        ["Add Cursor Down"] = "<C-Down>",
                        ["Mouse Cursor"] = "<C-LeftMouse>",
                        ["Mouse Column"] = "<C-RightMouse>",
                    }
                    vim.g.VM_custom_remaps = {
                        ["<C-c>"] = "<Esc>",
                    }
                    vim.g.VM_highlight_matches = ""
                end,
            },
            -- {
            --     "olimorris/codecompanion.nvim",
            --     dependencies = {
            --         { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
            --         { "nvim-lua/plenary.nvim" },
            --     },
            --     opts = {
            --         config = function () return true end,
            --         sources = {
            --             default = { "lsp", "path", "buffer", "codecompanion" },
            --             cmdline = {}, -- Disable sources for command-line mode
            --             per_filetype = {
            --                 codecompanion = { "codecompanion" },
            --             }
            --         },
            --         adapters = {
            --             ollama = function()
            --                 return require("codecompanion.adapters").extend("ollama", {
            --                     env = {
            --                         url = "http://100.90.84.147:11434",
            --                         api_key = "OLLAMA_API_KEY",
            --                     },
            --                     headers = {
            --                         ["Content-Type"] = "application/json",
            --                         ["Authorization"] = "Bearer ${api_key}",
            --                     },
            --                     parameters = {
            --                         sync = true,
            --                     },
            --                     name = "llama3.2", -- Give this adapter a different name to differentiate it from the default ollama adapter
            --                     schema = {
            --                         model = {
            --                             default = "deepseek-r1:32b",
            --                         },
            --                         num_ctx = {
            --                             default = 16384,
            --                         },
            --                         num_predict = {
            --                             default = -1,
            --                         },
            --                     },
            --                 })
            --             end,
            --         },
            --         strategies = {
            --             chat = {
            --                 adapter = "ollama",
            --             },
            --         },
            --         opts = {
            --             log_level = "DEBUG",
            --         },
            --     }
            -- }
        },
        {
          "joshuavial/aider.nvim",
          opts = {
            -- your configuration comes here
            -- if you don't want to use the default settings
            auto_manage_context = true, -- automatically manage buffer context
            default_bindings = true,    -- use default <leader>A keybindings
            debug = false,              -- enable debug logging
          },
        },
        install = { colorscheme = { "habamax" } },
        -- automatically check for plugin updates
        checker = { enabled = true },
    })

        require"general-settings/mappings"

        require'setup-lua'
