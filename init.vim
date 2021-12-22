source $HOME/AppData/local/nvim/plugin/plugins.vim
source $HOME/AppData/local/nvim/plugin/settings.vim
source $HOME/AppData/local/nvim/plugin/mappings.vim

source $HOME/AppData/local/nvim/plugin/which-key.vim
source $HOME/AppData/local/nvim/plugin/lazygit.vim
source $HOME/AppData/local/nvim/plugin/lsp_rust.vim
source $HOME/AppData/local/nvim/plugin/lsp_python.vim
source $HOME/AppData/local/nvim/plugin/neovide.vim
source $HOME/AppData/local/nvim/plugin/tags.vim
source $HOME/AppData/local/nvim/plugin/lsp.vim
" source $HOME/AppData/local/nvim/plugin/lint.vim


au FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyrightconfig.json', 'env']


" source $HOME/AppData/local/nvim/Plugins/vim-timetrack/plugin/vim-timetrack.vim
" source $HOME/AppData/local/nvim/plugin/vimspector.vim
