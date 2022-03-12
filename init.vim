source $HOME/AppData/local/nvim/plugin/plugins.vim
source $HOME/AppData/local/nvim/plugin/settings.vim
source $HOME/AppData/local/nvim/plugin/mappings.vim

source $HOME/AppData/local/nvim/plugins/startify.vim
source $HOME/AppData/local/nvim/plugins/peekup.vim
source $HOME/AppData/local/nvim/plugins/which-key.vim
source $HOME/AppData/local/nvim/plugins/neovide.vim
source $HOME/AppData/local/nvim/plugins/ctrlP.vim

source $HOME/AppData/local/nvim/plugins/grpc.vim

source $HOME/AppData/local/nvim/plugins/tree.vim
" my plugins
" make sure the base plugin is loaded first
source $HOME/AppData/local/nvim/plugins/my-plugin/base.vim
source $HOME/AppData/local/nvim/plugins/my-plugin/timetrack.vim
source $HOME/AppData/local/nvim/plugins/my-plugin/me-make-shit.vim

call TheFuxInit()   " rust proccess (ugly !!!!)

" this step is required to setup lua scripts
lua require("setup-lua")

augroup LaygitBuffEnter
    autocmd!
    autocmd BufEnter * :lua require('lazygit.utils').project_root_dir()
augroup end

" TODO: move this to somewhere else
augroup Terminal
    autocmd!
    autocmd! TermOpen * setlocal nospell nonumber norelativenumber
augroup end

