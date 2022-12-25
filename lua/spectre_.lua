local module = require'general-settings.utils'.M

module.nmap('<leader>F', '<cmd>lua require("spectre").open()<CR>')

-- "search current word
module.nmap('<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>')
module.vmap('<leader>s', '<esc>:lua require("spectre").open_visual()<CR>')

-- "  search in current file
module.nmap('<leader>sp', 'viw:lua require("spectre").open_file_search({})<cr>')

-- " run command :Spectre
