if !exists("g:thefuxid")
    echoerr 'timetrack: no g:thefuxid, make sure you stated the process'
endif

if exists("g:timetrackBuffer")
    unlet g:timetrackBuffer
endif

let s:task_list = []

let s:timetrackBufferName = 'thefux_timetrack'
if !exists("g:timetrackBuffer")
    if bufexists(s:timetrackBufferName)
        bwipeout thefux_timetrack
    endif

    let g:timetrackBuffer = bufadd(s:timetrackBufferName)
    " set max number of tasks
    " if !exists('g:timetrackBufferSize')
    "     let g:timetrackBufferSize = 20
    "     let list = []
    "     let i = 0
    "     while i < g:timetrackBufferSize
    "         call add(list, '')
    "         let i += 1
    "     endwhile
    "     call nvim_buf_set_lines(g:timetrackBuffer, 0, g:timetrackBufferSize, 0, list)
    " endif

    call setbufvar(g:timetrackBuffer, "&filetype", "ThefuxTimetrack")
    call setbufvar(g:timetrackBuffer, "&buftype", "nofile")
    call setbufvar(g:timetrackBuffer, "&buflisted", "1")
    call setbufvar(g:timetrackBuffer, "&readonly", "1")
    call setbufvar(g:timetrackBuffer, "&modifiable", "0")

    " call nvim_buf_set_lines(g:timetrackBuffer, 0, 2, 0, list_all)
    " getline('.')
endif

let s:dir = resolve(expand("<sfile>:p:h") . "/..")
let s:executable = s:dir . "/target/release/vim-timetrack"


let s:StoreTask = "StoreTask"
let s:StoreInFile = "StoreInFile"
let s:TimeTrack = "timetrack"
let s:Add = "Add"
let s:Update = "Update"
let s:Remove = "Remove"
let s:GetAll = "GetAll"
let s:GetReport = "GetReport"


let s:Terminate = "terminate"

function! s:DoCommandConfigruation()
    command! -nargs=+ SendDataToTimeTrackService :call SendDataToTimeTrackService(<f-args>)
    command! -nargs=+ HandleError :call s:HandleError(<f-args>)
    command! -nargs=+ StoreTask :call StoreTask(<f-args>)
    command! -nargs=* StoreInFile :call StoreInFile(<f-args>)
    command! -nargs=0 AddTask :call AddTask()
    command! -nargs=0 UpdateTask :call UpdateTask()
    command! -nargs=0 GetReport :call GetReport()
endfunction

function! StoreTask(...)
    let l:taskname = get(a:, 1, 1)
    let l:time = get(a:, 2, 1)
    let l:state = get(a:, 3, 1)
    let l:task_line = taskname . ' ' . time . '(min) ' . state

    call add(s:task_list, l:task_line)
endfunction


function! StoreInFile(...)
    let arg = get(a:, 1, '')
    if len(arg) == 0
        let tasks = []
    else
        let tasks = split(a:1, '|')
    endif

    let all = []

    call setbufvar(g:timetrackBuffer, "&readonly", "0")
    call setbufvar(g:timetrackBuffer, "&modifiable", "1")

    let count = 0
    " hack to decrease cleanup the buffer
    call nvim_buf_set_lines(g:timetrackBuffer, count, line('$'), 0, [])

    for task in tasks
        let task_info = split(task, ',')
        let l:taskname = task_info[0]
        let l:time = task_info[1]
        let l:state = task_info[2]
        let l:task_line = taskname . ' ' . time . ' ' . state
        " parsing report and available tasks use the same function
        " but should be refactored and parse them differently !!
        " let l:task_line = taskname . ' ' . time . '(min) ' . state
        call add(all, l:task_line)
        call nvim_buf_set_lines(g:timetrackBuffer, count, count+1, 0, [l:task_line])
        let count += 1
    endfor

    " use set_text to write only one line without overriding all the file
    " call nvim_buf_set_text(g:timetrackBuffer, 0, 0, 0, 0, ['hello thefux'])

    call setbufvar(g:timetrackBuffer, "&readonly", "1")
    call setbufvar(g:timetrackBuffer, "&modifiable", "0")
    " let s:task_list = []
endfunction


function! GetReport()
    call SendDataToTimeTrackService(s:GetReport)
endfunction


function! AddTask()
    let l:input = input('insert task name: ')
    call SendDataToTimeTrackService(s:Add, l:input)
endfunction


function! SendDataToTimeTrackService(...)
    let l:command = get(a:, 1, '')
    let l:message = get(a:, 2, '')
    let l:state = get(a:, 3, '')
    call rpcnotify(g:thefuxid, s:TimeTrack, s:StoreInFile, l:command, l:message, l:state)
endfunction


function! s:TerminateTimeTrack()
    call jobstop(g:thefuxid)
    " call rpcnotify(s:thefuxid, s:Terminate)
endfunction


" function! s:OnError(id, data, event)
"     echoerr 'error: ' . a:event . join(a:data, "\n")

"     let s:thefuxid = 0
" endfunction


function! s:HandleError(source, errorMassage)
    let s:source = get(a:, 1, '')
    let s:errorMassage = get(a:, 2, '')
    echoerr 'service: ' . s:source . ' send the follwing error: ' . s:errorMassage
endfunction


function! UpdateTask()
    let l:buff_name = expand('%:t')
    if l:buff_name != s:timetrackBufferName
        return
    endif

    call inputsave()
    let l:input = inputlist(['follwing command are possible: ',
                \ '1) start', 
                \ '2) pause',
                \ '3) done',
                \ '4) remove',
                \])
    call inputrestore()

    let l:line = getline('.')
    if len(l:line) == 0
        return
    endif

    let l:task_name = split(line, ' ')[0]

    let l:option = str2nr(l:input)
    if l:option == 1
        call SendDataToTimeTrackService(s:Update, l:task_name, 'Start')
    elseif l:option == 2
        call SendDataToTimeTrackService(s:Update, l:task_name, 'Paused')
    elseif l:option == 3
        call SendDataToTimeTrackService(s:Update, l:task_name, 'Done')
    elseif l:option == 4
        call SendDataToTimeTrackService(s:Remove, l:task_name)
    else
        return
    endif

endfunction


call s:DoCommandConfigruation()
" nnoremap <silent> <c-t> :call SendDataToTimeTrackService("GetAll")<CR> :b thefux_timetrack<CR>
nnoremap <silent> <c-t> :call SendDataToTimeTrackService("GetAll")<CR> :lua require('tools').open_buffer(vim.g.timetrackBuffer)<CR>
nnoremap <silent> <c-z>z :call UpdateTask()<CR>

