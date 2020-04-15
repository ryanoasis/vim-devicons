scriptencoding utf-8

" Please use nerd-font if you watch icon-font

let s:suite = themis#suite('WebDevIconsGetFileFormatSymbol')
let s:assert = themis#helper('assert')

" It may return Ubuntu because github-actions's OS is Ubuntu
function! s:suite.DefaultIcon()
  call s:assert.equals('', WebDevIconsGetFileFormatSymbol())
endfunction
