if !exists("g:thefuxid")
    let g:thefuxid = 0
endif

if exists("g:timetrackbuffer")
    unlet g:timetrackbuffer
endif

let s:task_list = []

let s:dir = resolve(expand("<sfile>:p:h") . "/../../")
let s:executable = s:dir . "/target/vim-timetrack"

let s:terminate = "terminate"

function! TheFuxInit()
    let id = s:connect()

    if id == 0
        echoerr "timetrack process could not be started"
    elseif id == -1
        echoerr "timetrack is not an executable"
    else
        let g:thefuxid = id
    endif
endfunction


function! s:connect()
    if g:thefuxid == 0
        return jobstart([s:executable], { 'rpc': v:true, 'on_stderr': function('s:onerror') })
    else
        return g:thefuxid
    endif
endfunction


" function! senddatatotimetrackserviceenv()
"     call rpcnotify(g:thefuxid, 'env', "echo \"hello\"")
" endfunction

" function! testenv()
"     echo "hello env !!!!"
" endfunction


function! s:TerminaTethefux()
    call jobstop(g:thefuxid)
    " call rpcnotify(s:thefuxid, s:terminate)
endfunction

command! Terminatethefux :call s:terminatethefux()


function! s:onerror(id, data, event)
    echoerr 'error: ' . a:event . join(a:data, "\n")

    let g:thefuxid = 0
endfunction


function! s:HandleError(source, errormassage)
    let s:source = get(a:, 1, '')
    let s:errormassage = get(a:, 2, '')
    echoerr 'service: ' . s:source . ' send the follwing error: ' . s:errormassage
endfunction


" call s:Init()

nnoremap <silent> <c-t> :call senddatatotimetrackservice("getall")<cr> :b thefux_timetrack<cr>
nnoremap <silent> <c-z>z :call updatetask()<cr>


