local highlight = require"general-settings.utils".highlight

vim.api.nvim_set_hl(0, 'Normal', {bg='black'})

vim.cmd[[colorscheme tokyonight]]
-- vim.cmd[[colorscheme nvcode]]


highlight("@function", {italic=true, bold=true, fg="#00BCD4"})
highlight("@variable", {italic=false, fg="#42A5F5"})
highlight("@variable.readonly.defaultLibrary", {italic=false, fg="#A89F9B"})
highlight("@type", {italic=false, fg="#26A69A"})
highlight("@type.modification", {italic=false, fg="#00897B"})
highlight("@namespace", {italic=false, fg="#00897B"})
highlight("@number", {italic=false, bold=true, fg="#90A4AE"})
highlight("@string", {italic=true, fg="#FF9500"})
highlight("@comment", {italic=true, fg="#546E7A"})
highlight("@macro", {italic=false, fg="#7E57C2"})
highlight("@keyword", {italic=false, fg="#7986CB"})
highlight("@operator", {italic=false, fg="#9575CD"})
highlight("@punctuation", {italic=false, fg="#A1887F"})

