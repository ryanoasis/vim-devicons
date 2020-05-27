scriptencoding utf-8

" Please use nerd-font if you watch icon-font

let s:suite = themis#suite('WebDevIconsGetFileTypeSymbol')
let s:assert = themis#helper('assert')

function! s:suite.FileNodesDefaultSymbol()
  call s:assert.equals('', WebDevIconsGetFileTypeSymbol())
endfunction

function! s:suite.VimSymbol()
  call s:assert.equals('', WebDevIconsGetFileTypeSymbol('.vimrc'))
endfunction

function! s:suite.LicenseSymbol()
  call s:assert.equals('', WebDevIconsGetFileTypeSymbol('LICENSE'))
endfunction

function! s:suite.MarkdownSymbol()
  call s:assert.equals('', WebDevIconsGetFileTypeSymbol('test.md'))
endfunction
