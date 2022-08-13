source $HOME/AppData/local/nvim/plugin/plugins.vim
source $HOME/AppData/local/nvim/plugin/settings.vim
source $HOME/AppData/local/nvim/plugin/mappings.vim


if !exists("g:vscode")
    source $HOME/AppData/local/nvim/plugins/peekup.vim
    source $HOME/AppData/local/nvim/plugins/neovide.vim
    source $HOME/AppData/local/nvim/plugins/startify.vim
    source $HOME/AppData/local/nvim/plugins/which-key.vim
    source $HOME/AppData/local/nvim/plugins/tree.vim
endif

" source $HOME/AppData/local/nvim/plugins/grpc.vim
" " make sure the base plugin is loaded first
" source $HOME/AppData/local/nvim/plugins/my-plugin/base.vim

" " before those two
" source $HOME/AppData/local/nvim/plugins/my-plugin/timetrack.vim
" source $HOME/AppData/local/nvim/plugins/my-plugin/me-make-shit.vim

" call TheFuxInit()   " rust plugin (ugly !!!!)

" this step is required to setup lua scripts
lua require("setup-lua")

