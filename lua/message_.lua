require('social-nvim').setup({
    notification_timeout = 5000,
    notification_position = "top-right",
    window_width = 40,
    window_height = 20,
    views = {
        notify = {
            timeout = 3000,
            max_width = 50,
            max_height = 10,
            position = "top-right",
            border = {
                style = "rounded",
                padding = { 0, 1 },
            },
        }

    },
    server = {
        path = "social-nvim-server", -- Optional: custom server path
        enabled = false,             -- Optional: disable server auto-start
    }
})
