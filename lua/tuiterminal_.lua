require("tui_terminal").setup({
    width = 0.9,
    height = 0.9,
    tools = {
        { name = "glim",    cmd = "glim",    vim_navigation = true },
        { name = "htop",    cmd = "htop",    vim_navigation = false },
        { name = "lazygit", cmd = "lazygit", vim_navigation = false },
        { name = "nu",      cmd = "nu",      vim_navigation = false, quit_key = false, detach = true },
        { name = "posting", cmd = "posting", vim_navigation = false, detach = true },
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
