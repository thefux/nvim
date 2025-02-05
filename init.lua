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
vim.env["OLLAMA_API_BASE"] = "http://100.90.84.147:11434"

require("general-settings/settings")

require("lazy").setup({
    spec = {
        "folke/which-key.nvim",
        {
            "folke/tokyonight.nvim",
            priority = 1000, -- make sure to load this before all the other start plugins
            event = "VeryLazy",
            lazy = false,
            init = function()
                vim.cmd([[colorscheme tokyonight]])
            end,
        },
        "thefux/lazygit.nvim",
        "rust-lang/rust.vim",
        "christoomey/vim-tmux-navigator",
        "szw/vim-maximizer",
        "mbbill/undotree",

        "mhinz/vim-startify",

        -- " scheme
        "rafi/awesome-vim-colorschemes",

        -- 'vimwiki/vimwiki',
        -- 'nikvdp/neomux',

        -- " vim register overview and more
        "gennaro-tedesco/nvim-peekup",

        -- " Plug 'jiangmiao/auto-pairs'
        "kylechui/nvim-surround",
        "windwp/nvim-autopairs",

        -- " git client, commit navigator and more
        "lewis6991/gitsigns.nvim",
        "tpope/vim-fugitive",
        "junegunn/gv.vim",
        "itchyny/vim-gitbranch",

        "thefux/git-worktree.nvim",

        -- " comment code or whatever
        "b3nj5m1n/kommentary",

        -- " list key bindings
        {
            "liuchengxu/vim-which-key",
            lazy = true,
        },

        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",

        {
            "hrsh7th/nvim-cmp",
            -- event = "InsertEnter",
            dependencies = {
                -- " LSP completion source for nvim-cmp
                "hrsh7th/cmp-nvim-lsp",

                -- " Other usefull completion sources
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-buffer",
                "hrsh7th/nvim-compe",
            },
        },
        -- {
        --     "sourcegraph/sg.nvim",
        --     dependencies = { "nvim-lua/plenary.nvim" },
        --     'onsails/lspkind.nvim',
        -- },

        -- " See hrsh7th's other plugins for more completion sources!

        -- " To enable more of the features of rust-analyzer, such as inlay hints and more!
        "simrat39/symbols-outline.nvim",
        "simrat39/rust-tools.nvim",
        {
            "saecki/crates.nvim",
            lazy = true,
        },

        -- " Snippet engine
        "hrsh7th/vim-vsnip",
        "hrsh7th/vim-vsnip-integ",
        "Neevash/awesome-flutter-snippets",

        -- " Optional
        "MunifTanjim/nui.nvim",
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "nvim-telescope/telescope-ui-select.nvim",

        -- -- " zoom In/Out
        -- 'drzel/vim-gui-zoom',

        "L3MON4D3/LuaSnip",
        -- 'saadparwaiz1/cmp_luasnip',
        -- {
        --     "L3MON4D3/LuaSnip",
        --     -- follow latest release.
        --     version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        --     -- install jsregexp (optional!).
        --     build = "make install_jsregexp"
        -- },

        -- 'nvim-lua/lsp-status.nvim',

        "nvim-treesitter/nvim-treesitter",
        "nvim-treesitter/playground",
        -- 'stevearc/aerial.nvim', -- " TODO: configuration missing

        -- 'glepnir/galaxyline.nvim',

        -- " If you want to display icons, then use one of these plugins:
        {
            "kyazdani42/nvim-web-devicons",
            lazy = true,
        },

        {
            "kyazdani42/nvim-tree.lua",
            lazy = true,
        },

        -- " buffer line
        "akinsho/bufferline.nvim", -- , { ['tag'] = 'v2.*' })

        -- 'sidebar-nvim/sidebar.nvim',
        "elihunter173/dirbuf.nvim",

        -- " mutil cursor support
        -- 'terryma/vim-multiple-cursors',

        -- " show all lsp infos (warning, error, etc.)
        "folke/trouble.nvim",

        -- " code formatter
        -- Plug 'mhartington/formatter.nvim'

        "rmagatti/goto-preview",

        "sonarom/buffer_manager.nvim",

        "ray-x/lsp_signature.nvim",

        "vscode-neovim/vscode-neovim",

        "christianchiarulli/nvcode-color-schemes.vim",

        -- search and replace
        -- 'windwp/nvim-spectre',

        "phaazon/hop.nvim",

        "gbprod/substitute.nvim",

        "mattn/emmet-vim",

        -- 'OmniSharp/omnisharp-vim',

        "nvim-lualine/lualine.nvim",
        -- 'jackMort/ChatGPT.nvim',
        -- {
        --     'nvim-lualine/lualine.nvim',
        --     dependencies = { 'nvim-tree/nvim-web-devicons' }
        -- },
        "rhysd/git-messenger.vim",
        {
            "epwalsh/pomo.nvim",
            version = "*", -- Recommended, use latest release instead of latest commit
            lazy = true,
            cmd = { "TimerStart", "TimerRepeat" },
            dependencies = {
                "rcarriga/nvim-notify",
            },
        },
        "Hoffs/omnisharp-extended-lsp.nvim",
        {
            "epwalsh/obsidian.nvim",
            version = "*", -- recommended, use latest release instead of latest commit
            lazy = true,
            event = {
                "BufReadPre (PATH)/**.md",
                "BufNewFile (PATH)/**.md",
            },
            ft = "markdown",
            dependencies = {
                -- Required.
                "nvim-lua/plenary.nvim",

                "hrsh7th/nvim-cmp",
                "nvim-telescope/telescope.nvim",
                "nvim-treesitter",
                "epwalsh/pomo.nvim",
            },
        },
        {
            "nvimtools/none-ls.nvim",
            dependencies = {
                "davidmh/cspell.nvim",
                "nvim-lua/plenary.nvim",
            },
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
        {
            "GeorgesAlkhouri/nvim-aider",
            cmd = {
                "AiderTerminalToggle",
                "AiderHealth",
            },
            keys = {
                { "<leader>ao", "<cmd>AiderTerminalToggle<cr>", desc = "Open Aider" },
                { "<leader>as", "<cmd>AiderTerminalSend<cr>", desc = "Send to Aider", mode = { "n", "v" } },
                { "<leader>ac", "<cmd>AiderQuickSendCommand<cr>", desc = "Send Command To Aider" },
                { "<leader>ab", "<cmd>AiderQuickSendBuffer<cr>", desc = "Send Buffer To Aider" },
                { "<leader>a+", "<cmd>AiderQuickAddFile<cr>", desc = "Add File to Aider" },
                { "<leader>a-", "<cmd>AiderQuickDropFile<cr>", desc = "Drop File from Aider" },
                { "<leader>ar", "<cmd>AiderQuickReadOnlyFile<cr>", desc = "Add File as Read-Only" },
                -- Example nvim-tree.lua integration if needed
                { "<leader>a+", "<cmd>AiderTreeAddFile<cr>", desc = "Add File from Tree to Aider", ft = "NvimTree" },
                {
                    "<leader>a-",
                    "<cmd>AiderTreeDropFile<cr>",
                    desc = "Drop File from Tree from Aider",
                    ft = "NvimTree",
                },
            },
            dependencies = {
                "folke/snacks.nvim",
                "nvim-telescope/telescope.nvim",
                --- The below dependencies are optional
                "catppuccin/nvim",
                "nvim-tree/nvim-tree.lua",
            },
            config = true,
        },
        {
            "YarikYar/posting.nvim",
            dependencies = { "akinsho/toggleterm.nvim" },
            config = function()
                require("posting").setup({
                    border = "curved", -- valid options are "single" | "double" | "shadow" | "curved"
                })
            end,
            event = "BufRead",
            keys = {
                {
                    "<leader>lp",
                    function()
                        require("posting").open()
                    end,
                    desc = "Open Posting floating window",
                },
            },
        },
        {
            "aweis89/aider.nvim",
            dependencies = {
                -- required for core functionality
                "akinsho/toggleterm.nvim",

                -- for fuzzy file `/add`ing functionality ("ibhagwan/fzf-lua" supported as well)
                "nvim-telescope/telescope.nvim",

                -- Optional, but great for diff viewing and after_update_hook integration
                "sindrets/diffview.nvim",

                -- Optional but will show aider spinner whenever active
                "folke/snacks.nvim",

                -- Only if you care about using the /editor command
                "willothy/flatten.nvim",
            },
            lazy = false,
            opts = {
                -- Auto trigger diffview after Aider's file changes
                after_update_hook = function()
                    require("diffview").open({ "HEAD^" })
                end,
            },
            keys = {
                {
                    "<leader>as",
                    "<cmd>AiderSpawn<CR>",
                    desc = "Toggle Aidper (default)",
                },
                {
                    "<leader>ao<space>",
                    "<cmd>AiderToggle<CR>",
                    desc = "Toggle Aider",
                },
                {
                    "<leader>af",
                    "<cmd>AiderToggle float<CR>",
                    desc = "Toggle Aider Float",
                },
                {
                    "<leader>av",
                    "<cmd>AiderToggle vertical<CR>",
                    desc = "Toggle Aider Float",
                },
                {
                    "<leader>al",
                    "<cmd>AiderAdd<CR>",
                    desc = "Add file to aider",
                },
                {
                    "<leader>ad",
                    "<cmd>AiderAsk<CR>",
                    desc = "Ask with selection",
                    mode = { "v", "n" },
                },
                {
                    "<leader>am",
                    desc = "Change model",
                },
                {
                    "<leader>ams",
                    "<cmd>AiderSend /model llama3.2:latest<CR>",
                    desc = "Switch to llama3.2",
                },
                {
                    "<C-x>",
                    "<cmd>AiderToggle<CR>",
                    desc = "Toggle Aider",
                    mode = { "i", "t", "n" },
                },
                -- Helpful mappings to utilize to manage aider changes
                {
                    "<leader>ghh",
                    "<cmd>Gitsigns change_base HEAD^<CR>",
                    desc = "Gitsigns pick reversals",
                },
                {
                    "<leader>dvh",
                    "<cmd>DiffviewOpen HEAD^<CR>",
                    desc = "Diffview HEAD^",
                },
                {
                    "<leader>dvo",
                    "<cmd>DiffviewOpen<CR>",
                    desc = "Diffview",
                },
                {
                    "<leader>dvc",
                    "<cmd>DiffviewClose!<CR>",
                    desc = "Diffview close",
                },
            },
        },
        {
            "GustavEikaas/easy-dotnet.nvim",
            -- 'nvim-telescope/telescope.nvim' or 'ibhagwan/fzf-lua'
            -- are highly recommended for a better experience
            dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
            config = function()
                local function get_secret_path(secret_guid)
                    local path = ""
                    local home_dir = vim.fn.expand("~")
                    if require("easy-dotnet.extensions").isWindows() then
                        local secret_path = home_dir
                        .. "\\AppData\\Roaming\\Microsoft\\UserSecrets\\"
                        .. secret_guid
                        .. "\\secrets.json"
                        path = secret_path
                    else
                        local secret_path = home_dir .. "/.microsoft/usersecrets/" .. secret_guid .. "/secrets.json"
                        path = secret_path
                    end
                    return path
                end

                local dotnet = require("easy-dotnet")
                -- Options are not required
                dotnet.setup({
                    --Optional function to return the path for the dotnet sdk (e.g C:/ProgramFiles/dotnet/sdk/8.0.0)
                    -- easy-dotnet will resolve the path automatically if this argument is omitted, for a performance improvement you can add a function that returns a hardcoded string
                    -- You should define this function to return a hardcoded path for a performance improvement 🚀
                    get_sdk_path = get_sdk_path,
                    ---@type TestRunnerOptions
                    test_runner = {
                        ---@type "split" | "float" | "buf"
                        viewmode = "float",
                        enable_buffer_test_execution = true, --Experimental, run tests directly from buffer
                        noBuild = true,
                        noRestore = true,
                        icons = {
                            passed = "",
                            skipped = "",
                            failed = "",
                            success = "",
                            reload = "",
                            test = "",
                            sln = "󰘐",
                            project = "󰘐",
                            dir = "",
                            package = "",
                        },
                        mappings = {
                            run_test_from_buffer = { lhs = "<leader>r", desc = "run test from buffer" },
                            filter_failed_tests = { lhs = "<leader>fe", desc = "filter failed tests" },
                            debug_test = { lhs = "<leader>d", desc = "debug test" },
                            go_to_file = { lhs = "g", desc = "got to file" },
                            run_all = { lhs = "<leader>R", desc = "run all tests" },
                            run = { lhs = "<leader>r", desc = "run test" },
                            peek_stacktrace = { lhs = "<leader>p", desc = "peek stacktrace of failed test" },
                            expand = { lhs = "o", desc = "expand" },
                            expand_node = { lhs = "E", desc = "expand node" },
                            expand_all = { lhs = "-", desc = "expand all" },
                            collapse_all = { lhs = "W", desc = "collapse all" },
                            close = { lhs = "q", desc = "close testrunner" },
                            refresh_testrunner = { lhs = "<C-r>", desc = "refresh testrunner" },
                        },
                        --- Optional table of extra args e.g "--blame crash"
                        additional_args = {},
                    },
                    ---@param action "test" | "restore" | "build" | "run"
                    terminal = function(path, action, args)
                        local commands = {
                            run = function()
                                return string.format("dotnet run --project %s %s", path, args)
                            end,
                            test = function()
                                return string.format("dotnet test %s %s", path, args)
                            end,
                            restore = function()
                                return string.format("dotnet restore %s %s", path, args)
                            end,
                            build = function()
                                return string.format("dotnet build %s %s", path, args)
                            end,
                        }

                        local command = commands[action]() .. "\r"
                        vim.cmd("vsplit")
                        vim.cmd("term " .. command)
                    end,
                    secrets = {
                        path = get_secret_path,
                    },
                    csproj_mappings = true,
                    fsproj_mappings = true,
                    auto_bootstrap_namespace = {
                        --block_scoped, file_scoped
                        type = "block_scoped",
                        enabled = true,
                    },
                    -- choose which picker to use with the plugin
                    -- possible values are "telescope" | "fzf" | "basic"
                    picker = "telescope",
                })

                -- Example command
                vim.api.nvim_create_user_command("Secrets", function()
                    dotnet.secrets()
                end, {})

                -- Example keybinding
                vim.keymap.set("n", "<C-p>", function()
                    dotnet.run_project()
                end)
            end,
        },
        {
            "harrisoncramer/gitlab.nvim",
            dependencies = {
                "MunifTanjim/nui.nvim",
                "nvim-lua/plenary.nvim",
                "sindrets/diffview.nvim",
                "stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
                "nvim-tree/nvim-web-devicons", -- Recommended but not required. Icons in discussion tree.
            },
            build = function () require("gitlab.server").build(true) end, -- Builds the Go binary
            config = function()
                require("gitlab").setup()
            end,
        },
        {
            "ibhagwan/fzf-lua",
            -- optional for icon support
            dependencies = { "nvim-tree/nvim-web-devicons" },
            -- or if using mini.icons/mini.nvim
            -- dependencies = { "echasnovski/mini.icons" },
            opts = {}
        }
    },
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})

require("general-settings/mappings")

require("setup-lua")
