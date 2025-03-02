require("tui_terminal").setup({
    width = 0.9,
    height = 0.9,
    tools = {
        { name = "yazi",     cmd = "yazi",     vim_navigation = true,  detach = true,    quit_key = true },
        { name = "atac",     cmd = "atac",     vim_navigation = true,  detach = true,    quit_key = true },
        { name = "rainfrog", cmd = "rainfrog", vim_navigation = true,  detach = true,    quit_key = true },
        { name = "serie",    cmd = "serie",    vim_navigation = true,  detach = true,    quit_key = true },
        { name = "joutnal",  cmd = "tjournal", vim_navigation = true,  detach = true,    quit_key = true },
        { name = "term",     cmd = "zsh",      vim_navigation = false, detach = true,    quit_key = false },
        { name = "glim",     cmd = "glim",     vim_navigation = true },
        { name = "htop",     cmd = "htop",     vim_navigation = false },
        { name = "lazygit",  cmd = "lazygit",  vim_navigation = false },
        { name = "nu",       cmd = "nu",       vim_navigation = false, quit_key = false, detach = true },
        { name = "posting",  cmd = "posting",  vim_navigation = false, detach = true },
        {
            name = "goose",
            cmd = "goose",
            args = {},
            -- args = {
            --     default = "session -n ",
            --     prompt = false,
            -- },
            quit_key = false,
            detach = true,
            map_ctrl_c = false,
            pre_cmd = { -- Script with arguments
                script = "~/.config/nvim/config/goose.sh",
                args = "activate developer computercontroller deactivate memory"
            },
            pre_cmd_nvim = function(callback)
                require('telescope').extensions.gooseai.select_session_for_command(callback)
            end,
            env = {
                set = { -- Set these environment variables
                    GOOSE_PROVIDER = "ollama",
                    GOOSE_MODEL = "llama3.2:latest",
                    OLLAMA_HOST = "http://100.90.84.147:11434",
                },
                unset = { -- Unset these environment variables
                },
            },
        },
        {
            name = "gooseOpenAI",
            cmd = "goose",
            inherit = "goose",
            env = {
                set = { -- Set these environment variables
                    GOOSE_PROVIDER = "openai",
                    GOOSE_MODEL = "o3-mini",
                },
                unset = { -- Unset these environment variables
                },
            },
        }
    },
    border = {
        type = "double",
        chars = {
            top_left = "╔",
            top = "═",
            top_right = "╗",
            right = "║",
            bottom_right = "╝",
            bottom = "═",
            bottom_left = "╚",
            left = "║",
        }
    }
})

require("telescope").load_extension("tui_terminal")


vim.api.nvim_set_keymap('n', '<leader>to', ':Telescope tui_terminal tools<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tp', ':Telescope tui_terminal detached<CR>', { noremap = true, silent = true })
