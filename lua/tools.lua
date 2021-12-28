local api = vim.api


local function resize()
    local ui_conf = api.nvim_list_uis()[1]

    local height = math.floor(ui_conf.height * 2 / 3)
    local width = math.floor(ui_conf.width * 2 / 3)

    local col = math.floor(width / 2 - width / 4)
    local row = math.floor(height / 2 - height / 4)

    return height,  width, col, row
end


local function create_fwin(buffer)
    local buf = api.nvim_create_buf(false, true)
    if buf == 0 then
        print('could not create buffer')
    end

    local height, width, col, row = resize()

    local opts = {
        relative = "editor",
        width = width,
        height = height,
        col = col,
        row = row,
        style = "minimal",
        -- anchor: "NW"
    }

    -- will jump right away to the new window
    local enter = true
    local win = api.nvim_open_win(buf, enter, opts)

    -- vim.win_execute(win, 'highlight CustomFloatingWindow ctermbg=11 guibg=yellow ctermfg=10 guifg=green')
    -- vim.win_execute(vim.win_getid(win), 'syntax enable')
    api.nvim_win_set_option(win, 'relativenumber', true)
    -- api.nvim_win_set_option(win, 'winhl', 'Normal:CustomFloatingWindow')
    -- api.nvim_win_set_option(win, 'winhl', 'Normal:ErrorFloating')

    vim.cmd(string.format("e %s", buffer))
end


return
{
    create_fwin = create_fwin,
    on_resize = resize
}
