" Commands
" :GV to open commit browser
" You can pass git log options to the command, e.g. :GV -S foobar -- plugins.
" :GV! will only list commits that affected the current file
" :GV? fills the location list with the revisions of the current file
" :GV or :GV? can be used in visual mode to track the changes in the selected lines.
" 
" Mappings
" o or <cr> on a commit to display the content of it
" o or <cr> on commits to display the diff in the range
" O opens a new tab instead
" gb for :Gbrowse
" ]] and [[ to move between commits
" . to start command-line with :Git [CURSOR] SHA à la fugitive
" q or gq to close]]

" fugitive, git
nmap <leader>gs :G<CR>
nmap <leader>gr :diffget //3<CR>
nmap <leader>gl :diffget //2<CR>

