let s:save_cpo = &cpo
set cpo&vim

echom "Loading..."

function! webdevicons#Hello()
    echom "Hello, webdevicons!"
endfunction

echom "Done loading."

echo "webdev auto!!!"
echom "webdev autoloading"
"call WebDevIconsSetDictionaries()

if !exists('g:zstuff')
	  let g:zstuff = "hey"
endif


function! webdevicons#test()
	echom "webdev auto test"
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
