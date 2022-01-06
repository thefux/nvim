local diagnostic = require('galaxyline.provider_diagnostic')
local vcs = require('galaxyline.provider_vcs')
local fileinfo = require('galaxyline.provider_fileinfo')
local extension = require('galaxyline.provider_extensions')
-- local colors = require('galaxyline.colors')
local buffer = require('galaxyline.provider_buffer')
local whitespace = require('galaxyline.provider_whitespace')
local lspclient = require('galaxyline.provider_lsp')
local condition = require('galaxyline.condition')
local gitsigns = require('gitsigns')


local gl = require('galaxyline')
-- local gps = require('nvim-gps')
local gls = gl.section
local extension = require('galaxyline.provider_extensions')
local dap = require('dap')

gl.short_line_list = {
    'LuaTree',
    'NvimTree',
    'vista',
    'dbui',
    'startify',
    'term',
    'nerdtree',
    'fugitive',
    'fugitiveblame',
    'plug',
    'plugins'
}


local ProgFileTypes = {
    'lua',
    'python',
    'typescript',
    'typescriptreact',
    'react',
    'javascript',
    'javascriptreact',
    'rust',
    'go',
    'html',
    'cpp',
    'c'
}


local colors = {
    bg = "#282c34",
    line_bg = "#353644",
    fg = '#8FBCBB',
    fg_green = '#65a380',
    yellow = '#fabd2f',
    cyan = '#008080',
    darkblue = '#081633',
    green = '#afd700',
    orange = '#FF8800',
    purple = '#5d4d7a',
    magenta = '#c678dd',
    blue = '#51afef';
    red = '#ec5f67'
}


local function file_readonly(readonly_icon)
    if vim.bo.filetype == 'help' then
        return ''
    end
    local icon = readonly_icon or ''
    if vim.bo.readonly == true then
        return " " .. icon .. " "
    end
    return ''
end
-- get current file name
local function get_current_file_name()
    local file = vim.fn.expand('%:t:r')
    -- local file = vim.fn.expand('%:f')
    if vim.fn.empty(file) == 1 then return '' end
    if string.len(file_readonly(readonly_icon)) ~= 0 then
        return file .. file_readonly(readonly_icon)
    end
    local icon = modified_icon or ''
    if vim.bo.modifiable then
        if vim.bo.modified then
            return file .. ' ' .. icon .. '  '
        end
    end
    return file .. ' '
end


local function lsp_status(status)
    shorter_stat = ''
    for match in string.gmatch(status, "[^%s]+")  do
        err_warn = string.find(match, "^[WE]%d+", 0)
        if not err_warn then
            shorter_stat = shorter_stat .. ' ' .. match
        end
    end
    return shorter_stat
end


local function get_debug_status()
    local status = dap.status()
    if not status or status == '' then
        return ''
    end
    return  '  ' .. status
end


local function trailing_whitespace()
    local trail = vim.fn.search("\\s$", "nw")
    if trail ~= 0 then
        return trail
    else
        return nil
    end
end


local function branch_name()
    -- this require a plugin 'gitbranch'
    local name = vim.api.nvim_eval('gitbranch#name()')
    if tonumber(name) ~= nil then
        return 'HEAD detached at ' .. name
    end

    if name == 'main' then
        return 'stop working in main'
    end
    return name
end


local time_trach_status =
{
    paused = 'Paused',
    inprogress = 'InProgress',
    done = 'done',
}


local function timetrack()
    if not vim.g.timetrackBuffer then
        return '    '
    end

    local lines = vim.api.nvim_buf_get_lines(vim.api.nvim_eval('timetrackBuffer'), 0, 10, false)
    for _, v in pairs(lines) do
        for str in v:gmatch('%S+') do
            if str == time_trach_status.inprogress then
                return '  神'
            end
        end
    end

    return '  精'
end



TimeTrack = timetrack
BranchName = branch_name
DebugInfo = get_debug_status
-- TreesitterContext = get_current_func_from_treesitter
TrailingWhiteSpace = trailing_whitespace

local function has_file_type()
    local f_type = vim.bo.filetype
    if not f_type or f_type == '' then
        return false
    end
    return true
end


local buffer_not_empty = function()
    if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
        return true
    end
    return false
end


gls.left[1] = {
    FirstElement = {
        provider = function() return '   ' end,
        highlight = {colors.orange, colors.line_bg},
    },
}

gls.left[2] = {
    ViMode = {
        provider = function()
            -- auto change color() according the vim mode
            local alias = {
                n = 'NORMAL',
                i = 'INSERT',
                c= 'COMMAND',
                V= 'VISUAL',
                [''] = 'VISUAL',
                v ='VISUAL',
                c  = 'COMMAND-LINE',
                ['r?'] = ':CONFIRM',
                rm = '--MORE',
                R  = 'REPLACE',
                Rv = 'VIRTUAL',
                s  = 'SELECT',
                S  = 'SELECT',
                ['r']  = 'HIT-ENTER',
                [''] = 'SELECT',
                t  = 'TERMINAL',
                ['!']  = 'SHELL',
            }
            local mode_color = {
                n = colors.green,
                i = colors.blue,v=colors.magenta,[''] = colors.blue,V=colors.blue,
                c = colors.red,no = colors.magenta,s = colors.orange,S=colors.orange,
                [''] = colors.orange,ic = colors.yellow,R = colors.purple,Rv = colors.purple,
                cv = colors.red,ce=colors.red, r = colors.cyan,rm = colors.cyan, ['r?'] = colors.cyan,
                ['!']  = colors.green,t = colors.green,
                c  = colors.purple,
                ['r?'] = colors.red,
                ['r']  = colors.red,
                rm = colors.red,
                R  = colors.yellow,
                Rv = colors.magenta,
            }
            local vim_mode = vim.fn.mode()
            vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim_mode])
            return alias[vim_mode] .. '   '
        end,
        highlight = {colors.red,colors.line_bg,'bold'},
    },
}

gls.left[3] ={
    FileIcon = {
        provider = 'FileIcon',
        condition = buffer_not_empty,
        highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.line_bg},
    },
}

gls.left[4] = {
    FileName = {
        provider = {get_current_file_name},
        condition = buffer_not_empty,
        highlight = {colors.fg,colors.line_bg,'bold'}
    }
}


gls.left[10] = {
    Space = {
        provider = function () return '' end
    }
}

gls.left[11] = {
    TrailingWhiteSpace = {
        provider = TrailingWhiteSpace,
        icon = '  ',
        separator_highlight = {colors.bg,colors.line_bg},
        highlight = {colors.yellow,colors.bg},
    }
}

gls.left[12] = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = '   ',
        separator_highlight = {colors.bg,colors.line_bg},
        highlight = {colors.red,colors.bg}
    }
}

gls.left[13] = {
    Space = {
        provider = function () return '' end
    }
}

gls.left[14] = {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = '   ',
        separator_highlight = {colors.bg,colors.line_bg},
        highlight = {colors.yellow,colors.bg},
    }
}


gls.left[15] = {
    DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        highlight = {colors.cyan,colors.bg},
        separator_highlight = {colors.bg,colors.line_bg},
        icon = '   '
    }
}


gls.right[1]= {
    FileFormat = {
        provider = 'FileFormat',
        separator = ' ',
        separator_highlight = {colors.bg,colors.line_bg},
        highlight = {colors.fg,colors.line_bg,'bold'},
    }
}

gls.right[2] = {
    Debug = {
        provider = DebugInfo,
        separator = ' ',
        separator_highlight = {colors.blue,colors.line_bg},
        highlight = {colors.red,colors.line_bg,'bold'},
    }
}

gls.right[3] = {
    GitBranch = {
        provider = BranchName,
        condition = vcs.check_git_workspace,
        icon = '  ',
        highlight = {colors.yellow,colors.line_bg,'bold'},
    }
}

local checkwidth = function()
    local squeeze_width  = vim.fn.winwidth(0) / 2
    if squeeze_width > 40 then
        return true
    end
    return false
end


gls.right[4] = {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = checkwidth,
        icon = '   ',
        highlight = {colors.green,colors.line_bg},
    }
}

-- comment out for now
-- gls.left[8] = {
--   DiffModified = {
--     provider = 'DiffModified',
--     condition = checkwidth,
--     icon = '   ',
--     highlight = {colors.orange,colors.line_bg},
--   }
-- }


gls.right[5] = {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = checkwidth,
        icon = '   ',
        highlight = {colors.red,colors.line_bg},
    }
}


gls.right[6] = {
    TimeTrackStopped = {
        provider = TimeTrack,
        condition = function () return true end,
        separator_highlight = {colors.line_bg,colors.line_bg},
        highlight = {colors.red,colors.line_bg},
    }
}

gls.right[8] = {
    PerCent = {
        provider = 'LinePercent',
        separator = ' ',
        separator_highlight = {colors.line_bg,colors.line_bg},
        highlight = {colors.cyan,colors.darkblue,'bold'},
    }
}


-- gls.right[4] = {
--   ScrollBar = {
--     provider = 'ScrollBar',
--     highlight = {colors.blue,colors.purple},
--   }
-- }

-- short line configuration
gls.short_line_left[1] =
{
    BufferIcon = {
        provider= 'BufferIcon',
        -- separator = ' ',
        separator = '',
        condition = has_file_type,
        separator_highlight = {colors.purple,colors.bg},
        highlight = {colors.fg,colors.purple}
    }
}

gls.short_line_left[2] = {
    BufferType = {
        provider =  'FileTypeName',
        separator = '',
        -- separator = ' ',
        condition = has_file_type,
        separator_highlight = {colors.purple,colors.bg},
        highlight = {colors.fg,colors.purple}
    }
}

