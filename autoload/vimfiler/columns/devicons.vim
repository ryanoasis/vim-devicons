"=============================================================================
" FILE: devicons.vim
" Version: 0.11.0
" Webpage: https://github.com/ryanoasis/vim-devicons
" Maintainer: Ryan McIntyre <ryanoasis@gmail.com>
" License: MIT license  {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}
"=============================================================================

let s:save_cpo = &cpo
set cpo&vim

function! vimfiler#columns#devicons#define()
  return s:column
endfunction

let s:column = {
      \ 'name' : 'devicons',
      \ 'description' : 'get devicon glyph',
      \ 'syntax' : 'vimfilerColumn__devicons',
      \ }

function! s:column.length(files, context)
  return 3
endfunction

function! s:column.define_syntax(context) "{{{
  syntax match   vimfilerColumn__TypeText       '\[T\]'
        \ contained containedin=vimfilerColumn__Type
  syntax match   vimfilerColumn__TypeImage      '\[I\]'
        \ contained containedin=vimfilerColumn__Type
  syntax match   vimfilerColumn__TypeArchive    '\[A\]'
        \ contained containedin=vimfilerColumn__Type
  syntax match   vimfilerColumn__TypeExecute    '\[X\]'
        \ contained containedin=vimfilerColumn__Type
  syntax match   vimfilerColumn__TypeMultimedia '\[M\]'
        \ contained containedin=vimfilerColumn__Type
  syntax match   vimfilerColumn__TypeDirectory  '\[do\]'
        \ contained containedin=vimfilerColumn__Type
  syntax match   vimfilerColumn__TypeSystem     '\[S\]'
        \ contained containedin=vimfilerColumn__Type
  syntax match   vimfilerColumn__TypeLink       '\[L\]'
        \ contained containedin=vimfilerColumn__Type

  highlight def link vimfilerColumn__TypeText Constant
  highlight def link vimfilerColumn__TypeImage Type
  highlight def link vimfilerColumn__TypeArchive Special
  highlight def link vimfilerColumn__TypeExecute Statement
  highlight def link vimfilerColumn__TypeMultimedia Identifier
  highlight def link vimfilerColumn__TypeDirectory Preproc
  highlight def link vimfilerColumn__TypeSystem Comment
  highlight def link vimfilerColumn__TypeLink Comment
endfunction"}}}

function! s:column.get(file, context)
  return WebDevIconsGetFileTypeSymbol(strpart(a:file.action__path, strridx(a:file.action__path, '/')), a:file.vimfiler__is_directory)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: foldmethod=marker
