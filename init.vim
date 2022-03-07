source $HOME/AppData/local/nvim/plugin/plugins.vim
source $HOME/AppData/local/nvim/plugin/settings.vim
source $HOME/AppData/local/nvim/plugin/mappings.vim

source $HOME/AppData/local/nvim/plugins/tmux-like.vim
source $HOME/AppData/local/nvim/plugins/startify.vim
source $HOME/AppData/local/nvim/plugins/rooter.vim
source $HOME/AppData/local/nvim/plugins/snippets.vim
source $HOME/AppData/local/nvim/plugins/undotree.vim
source $HOME/AppData/local/nvim/plugins/rooter.vim
source $HOME/AppData/local/nvim/plugins/maximizer.vim
source $HOME/AppData/local/nvim/plugins/peekup.vim
source $HOME/AppData/local/nvim/plugins/which-key.vim
source $HOME/AppData/local/nvim/plugins/lazygit.vim
source $HOME/AppData/local/nvim/plugins/neovide.vim
source $HOME/AppData/local/nvim/plugins/tags.vim
source $HOME/AppData/local/nvim/plugins/lsp.vim
source $HOME/AppData/local/nvim/plugins/lua_plug.vim
source $HOME/AppData/local/nvim/plugins/ctrlP.vim

source $HOME/AppData/local/nvim/plugins/grpc.vim

source $HOME/AppData/local/nvim/plugins/tree.vim
" source $HOME/AppData/local/nvim/plugins/nerdtree.vim
"
source $HOME/AppData/local/nvim/plugins/my-plugin/thefuxVimScripting.vim

" my plugins
" make sure the base plugin is loaded first
source $HOME/AppData/local/nvim/plugins/my-plugin/base.vim
source $HOME/AppData/local/nvim/plugins/my-plugin/timetrack.vim
source $HOME/AppData/local/nvim/plugins/my-plugin/me-make-shit.vim

call TheFuxInit()   " rust proccess (ugly !!!!)


" this step is required to setup lua scripts
lua require("setup-lua")

source $HOME/AppData/local/nvim/plugins/debug.vim

augroup LaygitBuffEnter
    autocmd!
    autocmd BufEnter * :lua require('lazygit.utils').project_root_dir()
augroup end

" TODO: move this to somewhere else
augroup Terminal
    autocmd!
    autocmd! TermOpen * setlocal nospell nonumber norelativenumber
augroup end


" source $HOME/AppData/local/nvim/plugins/completion.vim

" source $HOME/AppData/local/nvim/plugins/setup_lsp.vim
" source $HOME/AppData/local/nvim/Plugins/vim-timetrack/plugin/vim-timetrack.vim
" source $HOME/AppData/local/nvim/config/vimspector.vim

" au FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyrightconfig.json', 'env']
