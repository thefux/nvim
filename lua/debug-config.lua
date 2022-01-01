local opts = { noremap=true, silent=true }


vim.api.nvim_set_keymap('n', '<F5>', '<Cmd>lua require"dap".continue()<CR>', opts)
vim.api.nvim_set_keymap('n', '<F9>', '<Cmd>lua require"dap".toggle_breakpoint()<CR>', opts)

vim.api.nvim_set_keymap('n', '<F12>', '<Cmd>lua require"dap".repl.open()<CR>', opts)
vim.api.nvim_set_keymap('n', '<F10>', '<Cmd>lua require"dap".step_over()<CR>', opts)
vim.api.nvim_set_keymap('n', '<F11>', '<Cmd>lua require"dap".step_into()<CR>', opts)

vim.api.nvim_set_keymap('n', '<leader>I', '<Cmd>lua require"dap.ui.widgets".centered_float(require"dap.ui.widgets".scopes)<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>K', '<Cmd>lua require"dap.ui.widgets".hover()<CR>', opts)


local widgets = require('dap.ui.widgets')

local widgets_opts = {}

local function debug_scopes()
    local side_bar = widgets.sidebar(widgets.scopes, widgets_opts)
    side_bar.toggle()
end


local function debug_frames()
    local side_bar = widgets.sidebar(widgets.frames, widgets_opts)
    side_bar.toggle()
end


return
{
    debug_frames = debug_frames,
    debug_scopes = debug_scopes
}


