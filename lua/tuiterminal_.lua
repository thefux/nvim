require("tui_terminal").setup({
    width = 0.9,
    height = 0.9,
    tools = {
        { name = "glim",    cmd = "glim",    vim_navigation = true },
        { name = "htop",    cmd = "htop",    vim_navigation = false },
        { name = "lazygit", cmd = "lazygit", vim_navigation = false },
        { name = "nu",      cmd = "nu",      vim_navigation = false, quit_key = false, detach = true },
        { name = "posting", cmd = "posting", vim_navigation = true,  detach = true },
        {
            name = "goose",
            cmd = "goose",
            args = {
                default = "session",
                prompt = true,
            },
            quit_key = false,
            detach = true,
            pre_cmd = "echo 'hello'",
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
