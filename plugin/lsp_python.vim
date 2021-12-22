lua << EOF
local opts = {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_dir = function(startpath)
        return M.search_ancestors(startpath, matcher)
      end,
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = true
        }
      }
    },
    single_file_support = true
}

require'lspconfig'.pyright.setup{}
EOF
" pythonPath = "C:\\Users\\abdou\\OneDrive\\Master\\Semester_3\\deepLearning\\exercises\\thefux8\\Scripts\\python.exe",
" venvPath = "C:\\Users\\abdou\\OneDrive\\Master\\Semester_3\\deepLearning\\exercises\\thefux8"
