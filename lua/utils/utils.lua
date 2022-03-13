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

return
{
    get_root = get_root
}
