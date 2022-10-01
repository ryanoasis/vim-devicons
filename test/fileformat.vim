scriptencoding utf-8

" Please use nerd-font if you watch icon-font

let s:suite = themis#suite('WebDevIconsGetFileFormatSymbol')
let s:assert = themis#helper('assert')

function! s:suite.UnixIcon()
  set fileformat=unix
  let os = system('uname -a')
  if os =~# 'Darwin'
    call s:assert.equals(WebDevIconsGetFileFormatSymbol(), '')
  " It may return Ubuntu because github-actions's OS is Ubuntu
  elseif os =~# 'Ubuntu'
    call s:assert.equals(WebDevIconsGetFileFormatSymbol(), '')
  else
    call s:assert.skip('Skip testing except for Ubuntu and Mac.')
  endif
endfunction

function! s:suite.WindowsIcon()
  set fileformat=dos
  call s:assert.equals(WebDevIconsGetFileFormatSymbol(), '')
endfunction

function! s:suite.MacIcon()
  set fileformat=mac
  call s:assert.equals(WebDevIconsGetFileFormatSymbol(), '')
endfunction
