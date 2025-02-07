if not vim.g.vscode then
local job = require'plenary.job'

local function get_root()
  local cwd = vim.loop.cwd()
  local gitroot_job = job:new({
    'git',
    'rev-parse',
    '--show-toplevel',
    cwd=cwd
  })

  local path, code = gitroot_job:sync()
  if (code ~= 0) then
    return vim.fn.getcwd():gsub('\\', '/')
  end

  return table.concat(path, "")
end

local M = {}

M.map = function(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

M.nmap = function(shortcut, command)
  M.map('n', shortcut, command)
end

M.imap = function(shortcut, command)
  M.map('i', shortcut, command)
end

M.vmap = function(shortcut, command)
  M.map('v', shortcut, command)
end

M.cmap = function(shortcut, command)
  M.map('c', shortcut, command)
end

M.tmap = function(shortcut, command)
  M.map('t', shortcut, command)
end

M.xmap =  function(shortcut, command)
  M.map('x', shortcut, command)
end

local function highlight(name, value)
    vim.api.nvim_set_hl(0, name, value)
end

return
{
    M = M,
    get_root = get_root,
    highlight = highlight,
}
end
