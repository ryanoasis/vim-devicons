" Version: 0.4.1
" Webpage: https://github.com/ryanoasis/vim-webdevicons
" Maintainer: Ryan McIntyre <ryanoasis@gmail.com>
" Licencse: see LICENSE

let s:version = '0.4.1'

" standard fix/safety: line continuation (avoiding side effects) {{{1
"========================================================================
let s:save_cpo = &cpo
set cpo&vim

" standard loading / not loading {{{1
"========================================================================

if exists('g:loaded_webdevicons')
  finish
endif

let g:loaded_webdevicons = 1

" config enable / disable settings {{{1
"========================================================================

if !exists('g:webdevicons_enable')
  let g:webdevicons_enable = 1
endif

if !exists('g:webdevicons_enable_nerdtree')
  let g:webdevicons_enable_nerdtree = 1
endif

if g:webdevicons_enable_nerdtree == 1
   if !exists('g:NERDTreePathNotifier')
      let g:webdevicons_enable_nerdtree = 0
      echohl WarningMsg |
      \ echomsg "vim-webdevicons requires a newer version of NERDTree to show glyphs in NERDTree - consider updating NERDTree"
   endif
endif

if !exists('g:webdevicons_enable_airline_tabline')
  let g:webdevicons_enable_airline_tabline = 1
endif

if !exists('g:webdevicons_enable_airline_statusline')
  let g:webdevicons_enable_airline_statusline = 1
endif

if !exists('g:webdevicons_conceal_nerdtree_brackets')
  let g:webdevicons_conceal_nerdtree_brackets = 1
endif


" config options {{{1
"========================================================================

let g:WebDevIconsUnicodeDecorateFileNodes = 1

" whether to show default folder glyphs on directories:
let g:WebDevIconsUnicodeDecorateFolderNodes = 0

" whether to try to match folder notes with any exact file node matches
" default is to match but requires WebDevIconsUnicodeDecorateFolderNodes set
" to 1:
if !exists('g:WebDevIconsUnicodeDecorateFolderNodesExactMatches')
  let g:WebDevIconsUnicodeDecorateFolderNodesExactMatches = 1
endif

if !exists('g:WebDevIconsUnicodeGlyphDoubleWidth')
  let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
endif

if !exists('g:WebDevIconsNerdTreeAfterGlyphPadding')
  let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
endif


" config defaults {{{1
"========================================================================

if !exists('g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol')
  let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = ''
endif

if !exists('g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol')
  let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
endif

" functions {{{1
"========================================================================

" local functions {{{2
"========================================================================

" scope: local
function! s:setDictionaries()

	let s:file_node_extensions = {
		\	'styl'     : '',
		\	'scss'     : '',
		\	'htm'      : '',
		\	'html'     : '',
		\	'css'      : '',
		\	'less'     : '',
		\	'md'       : '',
		\	'json'     : '',
		\	'js'       : '',
		\	'rb'       : '',
		\	'php'      : '',
		\	'py'       : '',
		\	'pyc'      : '',
		\	'pyo'      : '',
		\	'pyd'      : '',
		\	'coffee'   : '',
		\	'mustache' : '',
		\	'hbs'      : '',
		\	'conf'     : '',
		\	'ini'      : '',
		\	'yml'      : '',
		\	'jpg'      : '',
		\	'jpeg'     : '',
		\	'bmp'      : '',
		\	'png'      : '',
		\	'gif'      : '',
		\	'ai'       : '',
		\	'twig'     : '',
		\	'cpp'      : '',
		\	'c++'      : '',
		\	'cxx'      : '',
		\	'cc'       : '',
		\	'cp'       : '',
		\	'c'        : '',
		\	'hs'       : '',
		\	'lhs'      : '',
		\	'lua'      : '',
		\	'java'     : '',
		\	'sh'       : '',
		\	'diff'     : '',
		\	'db'       : '',
		\	'clj'      : '',
		\	'scala'    : '',
		\	'go'       : '',
		\	'dart'     : '',
		\	'xul'      : '',
		\	'sln'      : '',
		\	'suo'      : ''
	\}

	let s:file_node_exact_matches = {
		\	'exact-match-case-sensitive-1.txt' : 'X1',
		\	'exact-match-case-sensitive-2'     : 'X2',
		\	'gruntfile.coffee'                 : '',
		\	'gruntfile.js'                     : '',
		\	'gruntfile.ls'                     : '',
		\	'gulpfile.coffee'                  : '',
		\	'gulpfile.js'                      : '',
		\	'gulpfile.ls'                      : '',
		\	'dropbox'                          : ''
	\}

	if !exists('g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols')
		let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
	endif

	if !exists('g:WebDevIconsUnicodeDecorateFileNodesExactSymbols')
		" do not remove: exact-match-case-sensitive-*
		let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {}
	endif

	" iterate to fix allow user overriding of specific individual keys in vimrc (only gvimrc was working previously)
	for [key, val] in items(s:file_node_extensions)
		if !has_key(g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols, key)
			let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols[key] = val
		endif
	endfor

	" iterate to fix allow user overriding of specific individual keys in vimrc (only gvimrc was working previously)
	for [key, val] in items(s:file_node_exact_matches)
		if !has_key(g:WebDevIconsUnicodeDecorateFileNodesExactSymbols, key)
			let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols[key] = val
		endif
	endfor

endfunction

function! s:setSyntax()
   if g:webdevicons_conceal_nerdtree_brackets == 1
      exec 'autocmd filetype nerdtree syntax match hideBracketsInNerdTree "[\]|\[]*" contained conceal cchar=_ containedin=ALL'
      exec 'autocmd filetype nerdtree set conceallevel=3'
      exec 'autocmd filetype nerdtree set concealcursor=nvic'
   endif
endfunction

" scope: local
function! s:initialize()
   call s:setDictionaries()
   call s:setSyntax()
endfunction

" initialization {{{1
"========================================================================

call s:initialize()

" public functions {{{2
"========================================================================

" scope: public
function! webdevicons#version()
   return s:version
endfunction

" a:1 (bufferName), a:2 (isDirectory)
" scope: public
function! WebDevIconsGetFileTypeSymbol(...)

  if a:0 == 0
    let fileNodeExtension = expand("%:e")
    let fileNode = expand("%:t")
    let isDirectory = 0
  else
    let fileNodeExtension = fnamemodify(a:1, ':e')
    let fileNode = fnamemodify(a:1, ':t')
    if a:0 == 2
      let isDirectory = a:2
    else
      let isDirectory = 0
    endif
  endif

  let fileNodeExtension = tolower(fileNodeExtension)
  let fileNode = tolower(fileNode)

  if has_key(g:WebDevIconsUnicodeDecorateFileNodesExactSymbols, fileNode)
    let symbol = g:WebDevIconsUnicodeDecorateFileNodesExactSymbols[fileNode]
  elseif has_key(g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols, fileNodeExtension)
    let symbol = g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols[fileNodeExtension]
  else
    if isDirectory == 1
      let symbol = g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol
    else
      let symbol = g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol
    endif
  endif

  return symbol

endfunction

" for airline plugin {{{3
"========================================================================

" scope: global
function! AirlineWebDevIcons(...)
  let w:airline_section_x = get(w:, 'airline_section_x', g:airline_section_x)
  let w:airline_section_x .= ' %{WebDevIconsGetFileTypeSymbol()} '
endfunction

if g:webdevicons_enable == 1 && g:webdevicons_enable_airline_statusline
  call airline#add_statusline_func('AirlineWebDevIcons')
endif

if g:webdevicons_enable == 1 && g:webdevicons_enable_airline_tabline
  " Store original formatter.
  if exists('g:airline#extensions#tabline#formatter')
    let g:_webdevicons_airline_orig_formatter = g:airline#extensions#tabline#formatter
  else
    let g:_webdevicons_airline_orig_formatter = 'default'
  endif
  let g:airline#extensions#tabline#formatter = 'webdevicons'
endif

" for nerdtree plugin {{{3
"========================================================================

" scope: public
function! NERDTreeWebDevIconsRefreshListener(event)
  let path = a:event.subject
  let padding = g:WebDevIconsNerdTreeAfterGlyphPadding

  if g:WebDevIconsUnicodeGlyphDoubleWidth == 0
    let padding = ''
  endif

  if !path.isDirectory
    let flag = WebDevIconsGetFileTypeSymbol(path.str()) . padding
  elseif path.isDirectory && g:WebDevIconsUnicodeDecorateFolderNodes == 1
    if g:WebDevIconsUnicodeDecorateFolderNodesExactMatches == 1
      let flag = WebDevIconsGetFileTypeSymbol(path.str(), path.isDirectory) . padding
    else
      let flag = g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol
    endif
  else
    let flag = ''
  endif

  call path.flagSet.clearFlags("webdevicons")

  if flag != ''
    call path.flagSet.addFlag("webdevicons", flag)
  endif

endfunction

" standard fix/safety: line continuation (avoiding side effects) {{{1
"========================================================================
let &cpo = s:save_cpo
unlet s:save_cpo

" vim: fdm=marker:
