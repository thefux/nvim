local opt = vim.opt
local g = vim.g


opt.laststatus = 3 -- global statusline

opt.clipboard = "unnamedplus"
opt.cursorline = true

-- Indenting
opt.expandtab = true
opt.smartindent = true

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.relativenumber=true
opt.number = true
opt.numberwidth = 2

-- disable nvim intro
opt.shortmess:append "sI"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

opt.exrc = true
opt.wrap = false
opt.linebreak = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.inccommand = 'nosplit'

opt.errorbells = false
opt.visualbell = false

-- opt.path:append "$PWD/**,."
opt.wildmode={'longest','list','full'}
opt.wildmenu = true

opt.autochdir = true
opt.background = 'dark'
opt.autoindent = true
opt.copyindent = true
opt.showmatch = true
opt.showmode = true
opt.hlsearch = true
opt.incsearch = true
opt.title = true
opt.backup = false
opt.swapfile = false

opt.scrolloff = 2
opt.sidescrolloff = 4
opt.pastetoggle = '<F2>'
opt.completeopt = {'menuone','noinsert','noselect'}
opt.cmdheight = 1
opt.hidden = true
opt.foldlevel = 0
opt.foldenable = true
opt.foldmethod = 'manual'

opt.ruler = true
opt.spell = false


opt.bs = {'indent','eol','start'}
-- opt.viminfo = '20,\"50'
opt.list = true
opt.listchars = "tab:>-,extends:>,trail:*"
opt.clipboard:append('unnamedplus')
-- hi clear SpellBad
-- hi SpellBad cterm=underline
-- " set spelllang=de_de,en_us
-- " highlight Cursor guifg=white guibg=black
-- " highlight iCursor guifg=white guibg=steelblue
-- " set guicursor=n-v-c:block-Cursor
-- " set guicursor+=i:ver100-iCursor
-- " set guicursor+=n-v-c:blinkon0
-- " set guicursor+=i:blinkwait10
opt.colorcolumn = {120}
-- set shortmess+=c

g.mapleader = ","

local group = vim.api.nvim_create_augroup('Spell', {clear = true})

vim.api.nvim_create_autocmd(
    'BufEnter',
    {
        pattern = '*.md',
        command = ':setlocal spell',
        group = group,
    }
)

vim.api.nvim_create_autocmd(
    'VimEnter',
    {
        group = group,
        callback = function()
            vim.api.nvim_set_keymap('n', '<cr>', ':MaximizerToggle<cr>', {noremap = true, silent = true})
            vim.api.nvim_set_keymap('n', '<F4>', ':UndotreeToogle<cr>', {noremap = true, silent = true})
            vim.api.nvim_set_keymap('n', '<leader>gs', ':G<cr>', {noremap = true, silent = true})
            vim.api.nvim_set_keymap('n', '<leader>gr', ':diffget //3<cr>', {noremap = true, silent = true})
            vim.api.nvim_set_keymap('n', '<leader>gl', ':diffget //2<cr>', {noremap = true, silent = true})

            vim.api.nvim_command("set wildignore+=*\\tmp\\*,*.swp,*.zip")
            vim.g.tmux_navigator_save_on_switch = 2
            vim.g.ctrlp_custom_ignore = {
                file = "\\v\\.(exe|d|pdb)$",
            }
            vim.g.ctrlp_working_path_mode = 'rs'
        end,
    }
)


vim.api.nvim_create_autocmd(
    'BufEnter',
    {
        group = group,
        callback = function()
            vim.api.nvim_command(":lua require('lazygit.utils').project_root_dir()")
            -- TODO: this applies for all project, better to specify the query for project with
            --       different languages
            vim.api.nvim_command("setlocal wildignore+=*.dll,*.rlib,*.rmeta,*.lib,*.exp,*.timestamp,*.bin,target\\*")
        end
    }
)


vim.api.nvim_create_autocmd(
    'TermOpen',
    {
        group = group,
        callback = function()
            vim.api.nvim_command("setlocal nospell nonumber norelativenumber")
        end
    }
)


-- to heavy
-- vim.api.nvim_create_autocmd(
--     'CursorMoved',
--     {
--         group = group,
--         callback = function()
--             vim.rpcnotify(0, 'all', {'test'})
--         end
--     }
-- )

-- " color scheme [[
vim.cmd[[colorscheme onedark]]
vim.api.nvim_set_hl(0, 'Normal', {guibg='dark'})
-- vim.cmd[[colorscheme tokyonight]]
-- "]]
