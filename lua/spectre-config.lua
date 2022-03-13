require('spectre').setup()

local get_root = require'utils.utils'.get_root

local function open_spectre()
    require('spectre').open(
        {
            is_insert_mode = true,
            cwd = get_root(),
        }
    )
end

vim.api.nvim_set_keymap('n', '<leader>F', '<cmd>lua require("spectre-config").open_spectre()<cr>', { noremap = true, silent = true })

return
{
    open_spectre = open_spectre,
}
