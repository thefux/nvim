" replace a word in current file [[
function! Replace(old)
    let l:input = input('replace "' . a:old . '" (in file) with: ')

    if len(l:input) == 0
        return
    endif

    let l:option = input('confirm options (e.g. c): ')
    execute '%s/' . a:old . '/' . l:input . '/g' . l:option
    execute ':wa!'
endfunction

function! ReplaceCurrentWord()
    let [line, column] = [line('.'), col('.')]
    let l:old = s:get_visual_selection()
    if len(l:old) == 0
        let l:old = expand('<cword>')
        if len(l:old) == 0
            return
        endif
    endif

    call cursor(line, column)
    call Replace(l:old)
endfunction

function! RaplceWordInFile()
    call inputsave()
    let l:old = input('type word to replace: ')
    if len(l:old) == 0
        return
    endif
    call inputrestore()

    call Replace(l:old)
endfunction

"]]

" find word and replace in whole project [[
" https://stackoverflow.com/questions/5686206/search-replace-using-quickfix-list-in-vim
function! QuickfixFilenames()
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[ quickfix_item['bufnr'] ] = bufname(quickfix_item['bufnr'])
  endfor

  return join(values(buffer_numbers))

endfunction

" Search Word [[
function! SearchWord(word)
    call inputsave()
    let l:option = '**/*.' . input('(word to find: "' . a:word . '")' . ', look for in file type: ')
    call inputrestore()

    " match only exact occurrence for now
    execute 'silent vimgrep! /' . a:word . '\C/gj ' . ' ' . l:option
endfunction

function! SearchAll()
    let l:input = expand('<cword>')
    if len(l:input) == 0
        return
    endif

    call SearchWord(l:input)
    execute ':copen'
endfunction

function! SearchFor()
    call inputsave()
    let l:input = input('type what you looking for: ')
    call inputrestore()
    if len(l:input) == 0
        return
    endif

    call SearchWord(l:input)
endfunction
"]]

function! ReplaceForAll(old, new)
    " store file names
    execute 'args ' . QuickfixFilenames()
    " apply change desired
    "
    execute 'argdo ' . '%s/' . a:old . '/' . a:new . '/ge | update'
    execute 'cdo ' . 's/' . a:old . '/' . a:new . '/ge | update'

    let g:undo_command = 'argdo ' . '%s/' . a:new . '/' . a:old . '/ge | update'
    let g:undo_command_cdo = 'cdo ' . 's/' . a:new . '/' . a:old . '/ge | update'
endfunction

function! ReplaceCurrentWordAll()
    let [line, column] = [line('.'), col('.')]
    let l:old = s:get_visual_selection()
    if len(l:old) == 0
        let l:old = expand('<cword>')
        if len(l:old) == 0
            return
        endif
    endif

    call inputsave()
    let l:input = input('replace "' . l:old . '" with: ')
    if len(l:input) == 0
        return
    endif

    call cursor(line, column)
    call inputrestore()

    " find all occurrence
    call SearchWord(l:old)

    call ReplaceForAll(l:old, l:input)
endfunction

function! ReplaceWordAll()
    call inputsave()
    let l:old = input('type word to replace: ')
    if len(l:old) == 0
        return
    endif

    let l:input = input('replace "' . l:old . '" with: ')
    if len(l:input) == 0
        return
    endif

    call inputrestore()

    " find all occurence
    call SearchWord(l:old)

    call ReplaceForAll(l:old, l:input)
endfunction

function! UndoLastReplaceCurrentWord()
    if !exists('g:undo_command')
        return
    endif

    execute g:undo_command
    execute g:undo_command_cdo
endfunction

function! s:doStuf(id)
    execute 'Rooter'

    if a:id == 1
        call SearchAll()
    elseif a:id == 2
        call ReplaceCurrentWordAll()
    elseif a:id == 3
        call UndoLastReplaceCurrentWord()
    elseif a:id == 4
        call ReplaceWordAll()
    endif
    execute 'cd %:p:h'
endfunction
"]]

" get visual selection [[
function! s:get_visual_selection()
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]

    " clear last search position
    call setpos("'<", [0, 0, column_end, 0])
    call setpos("'>", [0, 0, column_end, 0])
    return join(lines, "\n")
endfunction
"]]

" searching mapping, commands are defined in settings.vim [[
command! -nargs=0 ReplaceCurrentWord :call ReplaceCurrentWord()<CR>
command! -nargs=0 RaplceWordInFile :call RaplceWordInFile()<CR>
map <silent> <F6> :call ReplaceCurrentWord()<CR>
map <silent> <c-F6> :call RaplceWordInFile()<CR>

command! -nargs=0 SearchAll :call s:doStuf(1)
command! -nargs=0 ReplaceCurrentWordAll :call s:doStuf(2)
command! -nargs=0 UndoLastReplaceCurrentWord :call s:doStuf(3)
command! -nargs=0 ReplaceWordAll :call s:doStuf(4)

" map <silent> <F9> :Rooter<CR> :call SearchAll()<CR> :cd %:p:h<CR>
map <silent> <leader>S :Rooter<CR> :call SearchAll()<CR> :cd %:p:h<CR>
map <silent> <c-F9> :Rooter<CR> :call SearchFor()<CR> :cd %:p:h<CR>
map <silent> <F7> :<C-U> :Rooter<CR>:call ReplaceCurrentWordAll()<CR> :cd %:p:h<CR>
map <silent> <c-F8> :Rooter<CR> :call UndoLastReplaceCurrentWord()<CR>  :cd %:p:h<CR>
map <silent> <c-F7> :Rooter<CR> :call ReplaceWordAll()<CR>  :cd %:p:h<CR>
"]]


