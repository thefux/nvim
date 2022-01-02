local dap = require('dap')

dap.adapters.python =
{
    type = 'executable';
    command = "C:\\Users\\abdou\\OneDrive\\Master\\Semester_3\\deepLearning\\exercises\\thefux8\\Scripts\\python",
    -- command = "C://Users//abdou//.conda//envs//grpc//python",
    args = { '-m', 'debugpy.adapter' };
}


dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python';
    request = 'launch';
    name = "Launch file";
    program = "${file}";
    pythonPath = function()
        -- return "C://Users//abdou//.conda//envs//grpc//python"
        return 'C:\\Users\\abdou\\OneDrive\\Master\\Semester_3\\deepLearning\\exercises\\thefux8\\Scripts\\python'
    end;
    runInTerminal = false;

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
    -- program = "${file}"; -- This configuration will launch the current file if used.
    -- pythonPath = function()
    --   -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
    --   -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
    --   -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
    --   local cwd = vim.fn.getcwd()
    --   if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
    --     return cwd .. '/venv/bin/python'
    --   elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
    --     return cwd .. '/.venv/bin/python'
    --   else
    --     return '/usr/bin/python'
    --   end
    -- end;
  },
}
