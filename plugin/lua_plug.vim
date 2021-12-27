fun! FirstPluting(buf)
    lua for k in pairs(package.loaded) do if k:match("^tools") then package.loaded[k] = nil end end
    lua require("tools").create_fwin(vim.fn.eval("$MYVIMRC"))
endfunction


augroup plug
    autocmd!
    let a = $MYVIMRC
    command! FirstPlugin :call FirstPluting(a)
    autocmd VimResized * :lua require('tools').on_resize()
augroup end
