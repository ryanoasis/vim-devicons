" Version: 0.5.0
" Webpage: https://github.com/ryanoasis/vim-webdevicons
" Maintainer: Ryan McIntyre <ryanoasis@gmail.com>
" Licencse: see LICENSE

let s:version = '0.5.0'

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

if !exists('g:webdevicons_enable_unite')
  let g:webdevicons_enable_unite = 1
endif

if !exists('g:webdevicons_enable_vimfiler')
  let g:webdevicons_enable_vimfiler = 1
endif

if !exists('g:webdevicons_enable_airline_tabline')
  let g:webdevicons_enable_airline_tabline = 1
endif

if !exists('g:webdevicons_enable_airline_statusline')
  let g:webdevicons_enable_airline_statusline = 1
endif

if !exists('g:webdevicons_enable_airline_statusline_fileformat_symbols')
  let g:webdevicons_enable_airline_statusline_fileformat_symbols = 1
endif

if !exists('g:webdevicons_enable_flagship_statusline')
  let g:webdevicons_enable_flagship_statusline = 1
endif

if !exists('g:webdevicons_enable_flagship_statusline_fileformat_symbols')
  let g:webdevicons_enable_flagship_statusline_fileformat_symbols = 1
endif

if !exists('g:webdevicons_conceal_nerdtree_brackets')
  let g:webdevicons_conceal_nerdtree_brackets = 1
endif


" config options {{{1
"========================================================================

if !exists('g:WebDevIconsUnicodeDecorateFileNodes')
  let g:WebDevIconsUnicodeDecorateFileNodes = 1
endif

" whether to show default folder glyphs on directories:
if !exists('g:WebDevIconsUnicodeDecorateFolderNodes')
  let g:WebDevIconsUnicodeDecorateFolderNodes = 0
endif

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
  let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
endif

if !exists('g:WebDevIconsNerdTreeGitPluginForceVAlign')
  let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
endif


" config defaults {{{1
"========================================================================

if !exists('g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol')
  let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = ''
endif

if !exists('g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol')
  let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
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
		\	'jsx'      : '',
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
		\	'cljs'     : '',
		\	'edn'      : '',
		\	'scala'    : '',
		\	'go'       : '',
		\	'dart'     : '',
		\	'xul'      : '',
		\	'sln'      : '',
		\	'suo'      : '',
		\	'pl'       : '',
		\	'pm'       : '',
		\	't'        : '',
		\	'rss'      : '',
		\	'f#'       : '',
		\	'fsscript' : '',
		\	'fsx'      : '',
		\	'fs'       : '',
		\	'fsi'      : '',
		\	'rs'       : '',
		\	'rlib'     : '',
		\	'd'        : '',
		\	'erl'      : '',
		\	'hrl'      : '',
		\	'vim'      : '',
		\	'ai'       : '',
		\	'psd'      : '',
		\	'psb'      : ''
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
		\	'dropbox'                          : '',
		\	'.ds_store'                        : '',
		\	'.gitconfig'                       : '',
		\	'.gitignore'                       : '',
		\	'.bashrc'                          : '',
		\	'.bashprofile'                     : '',
		\	'favicon.ico'                      : '',
		\	'license'                          : '',
		\	'node_modules'                     : ''
	\}

	let s:file_node_pattern_matches = {
		\ '.*jquery.*\.js$'       : '',
		\ '.*angular.*\.js$'      : '',
		\ '.*backbone.*\.js$'     : '',
		\ '.*require.*\.js$'      : '',
		\ '.*materialize.*\.js$'  : '',
		\ '.*materialize.*\.css$' : '',
		\ '.*mootools.*\.js$'     : ''
	\}

  if !exists('g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols')
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
  endif

  if !exists('g:WebDevIconsUnicodeDecorateFileNodesExactSymbols')
    " do not remove: exact-match-case-sensitive-*
    let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {}
  endif

  if !exists('g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols')
    let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {}
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

  " iterate to fix allow user overriding of specific individual keys in vimrc (only gvimrc was working previously)
  for [key, val] in items(s:file_node_pattern_matches)
    if !has_key(g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols, key)
      let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols[key] = val
    endif
  endfor

endfunction

" scope: local
function! s:setSyntax()
  if g:webdevicons_enable_nerdtree == 1 && g:webdevicons_conceal_nerdtree_brackets == 1
    augroup webdevicons_conceal_nerdtree_brackets
      au!
      autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\]" contained conceal containedin=ALL
      autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\[" contained conceal containedin=ALL
      autocmd FileType nerdtree set conceallevel=3
      autocmd FileType nerdtree set concealcursor=nvic
    augroup END
  endif
endfunction

" scope: local
function! s:hardRefreshNerdTree()
  if g:webdevicons_enable_nerdtree == 1 && g:webdevicons_conceal_nerdtree_brackets == 1 && g:NERDTree.IsOpen()
    NERDTreeClose
    NERDTree
  endif
endfunction

" scope: local
function! s:initialize()
  call s:setDictionaries()
  call s:setSyntax()
  call s:initializeFlagship()
  call s:initializeUnite()
  call s:initializeVimfiler()
endfunction


" public functions {{{2
"========================================================================

" scope: public
function! webdevicons#version()
  return s:version
endfunction

" scope: public
function! webdevicons#refresh()
  call s:setSyntax()
  call s:hardRefreshNerdTree()
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

  let symbol = g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol
  let fileNodeExtension = tolower(fileNodeExtension)
  let fileNode = tolower(fileNode)

  for [pattern, glyph] in items(g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols)
    if match(fileNode, pattern) != -1
      let symbol = glyph
    endif
  endfor

  if symbol == g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol
    if has_key(g:WebDevIconsUnicodeDecorateFileNodesExactSymbols, fileNode)
      let symbol = g:WebDevIconsUnicodeDecorateFileNodesExactSymbols[fileNode]
    elseif has_key(g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols, fileNodeExtension)
      let symbol = g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols[fileNodeExtension]
    elseif isDirectory == 1
      let symbol = g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol
    endif
  endif

  " Temporary (hopefully) fix for glyph issues in gvim (proper fix is with the
  " actual font patcher)
  let artifactFix = "\u00A0"

  return symbol . artifactFix

endfunction

" scope: public
function! WebDevIconsGetFileFormatSymbol(...)
  let fileformat = ""

  if &fileformat == "dos"
    let fileformat = ""
  elseif &fileformat == "unix"
    let fileformat = ""
  elseif &fileformat == "mac"
    let fileformat = ""
  endif

  " Temporary (hopefully) fix for glyph issues in gvim (proper fix is with the
  " actual font patcher)
  let artifactFix = "\u00A0"

  return fileformat . artifactFix
endfunction

" for airline plugin {{{3
"========================================================================

" scope: public
function! AirlineWebDevIcons(...)
  let w:airline_section_x = get(w:, 'airline_section_x', g:airline_section_x)
  let w:airline_section_x .= ' %{WebDevIconsGetFileTypeSymbol()} '
  if g:webdevicons_enable_airline_statusline_fileformat_symbols
    let w:airline_section_y = ' %{&fenc . " " . WebDevIconsGetFileFormatSymbol()} '
  endif
endfunction

if g:webdevicons_enable == 1 && exists("g:loaded_airline") && g:loaded_airline == 1 && g:webdevicons_enable_airline_statusline
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
  let prePadding = ''
  let hasGitFlags = (len(path.flagSet._flagsForScope("git")) > 0)
  let hasGitNerdTreePlugin = (exists('g:loaded_nerdtree_git_status') == 1)

  if g:WebDevIconsUnicodeGlyphDoubleWidth == 0
    let padding = ''
  endif

  if hasGitFlags && g:WebDevIconsUnicodeGlyphDoubleWidth == 1
    let prePadding = ' '
  endif

  " align vertically at the same level: non git-flag nodes with git-flag nodes
  if g:WebDevIconsNerdTreeGitPluginForceVAlign && !hasGitFlags && hasGitNerdTreePlugin
    let prePadding .= '  '
  endif

  if !path.isDirectory
    let flag = prePadding . WebDevIconsGetFileTypeSymbol(path.str()) . padding
  elseif path.isDirectory && g:WebDevIconsUnicodeDecorateFolderNodes == 1
    if g:WebDevIconsUnicodeDecorateFolderNodesExactMatches == 1
      let flag = prePadding . WebDevIconsGetFileTypeSymbol(path.str(), path.isDirectory) . padding
    else
      let flag = prePadding . g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol
    endif
  else
    let flag = ''
  endif

  call path.flagSet.clearFlags("webdevicons")

  if flag != ''
    call path.flagSet.addFlag("webdevicons", flag)
  endif

endfunction

" for vim-flagship plugin {{{3
"========================================================================

" scope: local
function! s:initializeFlagship()
  if exists("g:loaded_flagship") && g:webdevicons_enable_flagship_statusline
    autocmd User Flags call Hoist("buffer", "WebDevIconsGetFileTypeSymbol")
  endif

  if exists("g:loaded_flagship") && g:webdevicons_enable_flagship_statusline_fileformat_symbols
    autocmd User Flags call Hoist("buffer", "WebDevIconsGetFileFormatSymbol")
  endif

endfunction

" for unite plugin {{{3
"========================================================================

" scope: local
function! s:initializeUnite()
  if exists("g:loaded_unite") && g:webdevicons_enable_unite
    let s:filters = {
          \   "name" : "devicons_converter",
          \}

    function! s:filters.filter(candidates, context)
      for candidate in a:candidates
        "echom "candidate"
        "for [next_key, next_val] in items(candidate)
        "  "let result = process(next_val)
        "  echo "Result for " next_key " is " next_val
        "endfor

        if has_key(candidate, "action__buffer_nr")
          let bufname = bufname(candidate.action__buffer_nr)
          let filename = fnamemodify(bufname, ':p:t')
          let path = fnamemodify(bufname, ':p:h')
        elseif has_key(candidate, "word") && has_key(candidate, "action__path")
          let path = candidate.action__path
          let filename = candidate.word
        endif

        let icon = WebDevIconsGetFileTypeSymbol(filename, isdirectory(filename))

        " Customize output format.
        let candidate.abbr = printf("%s %s", icon, path)
      endfor
      return a:candidates
    endfunction

    call unite#define_filter(s:filters)
    unlet s:filters

    call unite#custom#source('file,file_rec,buffer', 'converters', 'devicons_converter')
    "unite#filters#converter_default#use("devicons_converter")
  endif
endfunction

" for vimfiler plugin {{{3
"========================================================================

" scope: local
function! s:initializeVimfiler()
  if exists("g:loaded_vimfiler") && g:webdevicons_enable_vimfiler
    call vimfiler#custom#profile('default', 'context', {
      \ 'columns' : 'type:devicons:size:time'
      \ })
  endif
endfunction


" initialization {{{1
"========================================================================

call s:initialize()

" standard fix/safety: line continuation (avoiding side effects) {{{1
"========================================================================
let &cpo = s:save_cpo
unlet s:save_cpo

" modeline syntax:
" vim: fdm=marker tabstop=2 softtabstop=2 shiftwidth=2 expandtab:
