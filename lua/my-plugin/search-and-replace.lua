local path = '.'

local function search_files()
    buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_command(':redir @a')
    vim.api.nvim_command(':! rg local ' .. path)
    vim.api.nvim_command(':redir END')
end

local function raplce_word_in_file()

end

local function replace()
end


return
{
    search_files = search_files,
}


-- ReplaceCurrentWord()
-- ReplaceCurrentWordAll()
-- ReplaceForAll(old,new)
-- ReplaceWordAll()
-- SearchAll()
-- SearchFor()
-- SearchWord(word)
-- UndoLastReplaceCurrentWord()
-- s:doStuf(id)
-- s:get_visual_selection()
