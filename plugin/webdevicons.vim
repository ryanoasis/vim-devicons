" Version: 0.10.0
" Webpage: https://github.com/ryanoasis/vim-devicons
" Maintainer: Ryan McIntyre <ryanoasis@gmail.com>
" License: see LICENSE

let s:version = '0.10.0'
let s:plugin_home = expand('<sfile>:p:h:h')

" set scriptencoding after 'encoding' and when using multibyte chars
scriptencoding utf-8

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

if !exists('g:webdevicons_enable_denite')
  let g:webdevicons_enable_denite = 1
endif

if !exists('g:webdevicons_enable_vimfiler')
  let g:webdevicons_enable_vimfiler = 1
endif

if !exists('g:webdevicons_enable_ctrlp')
  let g:webdevicons_enable_ctrlp = 1
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

if !exists('g:DevIconsEnableFoldersOpenClose')
  let g:DevIconsEnableFoldersOpenClose = 0
endif

if !exists('g:DevIconsEnableFolderPatternMatching')
  let g:DevIconsEnableFolderPatternMatching = 1
endif

if !exists('g:DevIconsEnableFolderExtensionPatternMatching')
  let g:DevIconsEnableFolderExtensionPatternMatching = 0
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

" fix for refreshing NERDTree flags upon creating new files
if !exists('g:NERDTreeUpdateOnCursorHold')
  let g:NERDTreeUpdateOnCursorHold = 1
endif

" config defaults {{{1
"========================================================================

if !exists('g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol')
  let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = ''
endif

if !exists('g:WebDevIconsUnicodeByteOrderMarkerDefaultSymbol')
  let g:WebDevIconsUnicodeByteOrderMarkerDefaultSymbol = ''
endif

if !exists('g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol')
  if g:DevIconsEnableFoldersOpenClose
    " use new glyph
    let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
  else
    " use older glyph
    let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
  endif
endif

if !exists('g:WebDevIconsUnicodeDecorateFolderNodesSymlinkSymbol')
  let g:WebDevIconsUnicodeDecorateFolderNodesSymlinkSymbol =  ''
endif

if !exists('g:DevIconsDefaultFolderOpenSymbol')
    let g:DevIconsDefaultFolderOpenSymbol = ''
endif

" functions {{{1
"========================================================================

" local functions {{{2
"========================================================================

" scope: local
function s:isDarwin()
  if exists('s:is_darwin')
    return s:is_darwin
  endif

  if exists('g:WebDevIconsOS')
    let s:is_darwin = g:WebDevIconsOS ==? 'Darwin'
    return s:is_darwin
  endif

  if has('macunix')
    let s:is_darwin = 1
    return s:is_darwin
  endif

  if ! has('unix')
    let s:is_darwin = 0
    return s:is_darwin
  endif

  if system('uname -s') ==# "Darwin\n"
    let s:is_darwin = 1
  else
    let s:is_darwin = 0
  endif

  return s:is_darwin
endfunction

" scope: local
function! s:strip(input)
  return substitute(a:input, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction

" scope: local
function! s:setDictionaries()

  let s:file_node_extensions = {
        \ 'styl'     : '',
        \ 'sass'     : '',
        \ 'scss'     : '',
        \ 'htm'      : '',
        \ 'html'     : '',
        \ 'slim'     : '',
        \ 'ejs'      : '',
        \ 'css'      : '',
        \ 'less'     : '',
        \ 'md'       : '',
        \ 'markdown' : '',
        \ 'rmd'      : '',
        \ 'json'     : '',
        \ 'js'       : '',
        \ 'jsx'      : '',
        \ 'rb'       : '',
        \ 'php'      : '',
        \ 'py'       : '',
        \ 'pyc'      : '',
        \ 'pyo'      : '',
        \ 'pyd'      : '',
        \ 'coffee'   : '',
        \ 'mustache' : '',
        \ 'hbs'      : '',
        \ 'conf'     : '',
        \ 'ini'      : '',
        \ 'yml'      : '',
        \ 'yaml'     : '',
        \ 'bat'      : '',
        \ 'jpg'      : '',
        \ 'jpeg'     : '',
        \ 'bmp'      : '',
        \ 'png'      : '',
        \ 'gif'      : '',
        \ 'ico'      : '',
        \ 'twig'     : '',
        \ 'cpp'      : '',
        \ 'c++'      : '',
        \ 'cxx'      : '',
        \ 'cc'       : '',
        \ 'cp'       : '',
        \ 'c'        : '',
        \ 'h'        : '',
        \ 'hpp'      : '',
        \ 'hxx'      : '',
        \ 'hs'       : '',
        \ 'lhs'      : '',
        \ 'lua'      : '',
        \ 'java'     : '',
        \ 'sh'       : '',
        \ 'fish'     : '',
        \ 'bash'     : '',
        \ 'zsh'      : '',
        \ 'ksh'      : '',
        \ 'csh'      : '',
        \ 'awk'      : '',
        \ 'ps1'      : '',
        \ 'ml'       : 'λ',
        \ 'mli'      : 'λ',
        \ 'diff'     : '',
        \ 'db'       : '',
        \ 'sql'      : '',
        \ 'dump'     : '',
        \ 'clj'      : '',
        \ 'cljc'     : '',
        \ 'cljs'     : '',
        \ 'edn'      : '',
        \ 'scala'    : '',
        \ 'go'       : '',
        \ 'dart'     : '',
        \ 'xul'      : '',
        \ 'sln'      : '',
        \ 'suo'      : '',
        \ 'pl'       : '',
        \ 'pm'       : '',
        \ 't'        : '',
        \ 'rss'      : '',
        \ 'f#'       : '',
        \ 'fsscript' : '',
        \ 'fsx'      : '',
        \ 'fs'       : '',
        \ 'fsi'      : '',
        \ 'rs'       : '',
        \ 'rlib'     : '',
        \ 'd'        : '',
        \ 'erl'      : '',
        \ 'hrl'      : '',
        \ 'vim'      : '',
        \ 'ai'       : '',
        \ 'psd'      : '',
        \ 'psb'      : '',
        \ 'ts'       : '',
        \ 'tsx'      : '',
        \ 'jl'       : '',
        \ 'pp'       : ''
        \}

  let s:file_node_exact_matches = {
        \ 'exact-match-case-sensitive-1.txt' : 'X1',
        \ 'exact-match-case-sensitive-2'     : 'X2',
        \ 'gruntfile.coffee'                 : '',
        \ 'gruntfile.js'                     : '',
        \ 'gruntfile.ls'                     : '',
        \ 'gulpfile.coffee'                  : '',
        \ 'gulpfile.js'                      : '',
        \ 'gulpfile.ls'                      : '',
        \ 'dropbox'                          : '',
        \ '.ds_store'                        : '',
        \ '.gitconfig'                       : '',
        \ '.gitignore'                       : '',
        \ '.bashrc'                          : '',
        \ '.zshrc'                           : '',
        \ '.vimrc'                           : '',
        \ '.bashprofile'                     : '',
        \ 'favicon.ico'                      : '',
        \ 'license'                          : '',
        \ 'node_modules'                     : '',
        \ 'react.jsx'                        : '',
        \ 'procfile'                         : '',
        \}

  let s:file_node_pattern_matches = {
        \ '.*jquery.*\.js$'       : '',
        \ '.*angular.*\.js$'      : '',
        \ '.*backbone.*\.js$'     : '',
        \ '.*require.*\.js$'      : '',
        \ '.*materialize.*\.js$'  : '',
        \ '.*materialize.*\.css$' : '',
        \ '.*mootools.*\.js$'     : '',
        \ 'Vagrantfile$'          : ''
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
      autocmd FileType nerdtree setlocal conceallevel=3
      autocmd FileType nerdtree setlocal concealcursor=nvic
    augroup END
  endif
endfunction

" scope: local
" stole solution/idea from nerdtree-git-plugin :)
function! s:setCursorHold()
  if g:webdevicons_enable_nerdtree
    augroup webdevicons_cursor_hold
      autocmd CursorHold * silent! call s:CursorHoldUpdate()
    augroup END
  endif
endfunction

" scope: local
" stole solution/idea from nerdtree-git-plugin :)
function! s:CursorHoldUpdate()
  if g:NERDTreeUpdateOnCursorHold != 1
    return
  endif

  if !exists('g:NERDTree') || !g:NERDTree.IsOpen()
    return
  endif

  " Do not update when a special buffer is selected
  if !empty(&l:buftype)
    return
  endif

  " winnr need to make focus go to opened file
  " CursorToTreeWin needed to avoid error on opening file
  let l:winnr = winnr()
  let l:altwinnr = winnr('#')

  call g:NERDTree.CursorToTreeWin()
  call b:NERDTree.root.refreshFlags()
  call NERDTreeRender()

  exec l.altwinnr . 'wincmd w'
  exec l:winnr . 'wincmd w'
endfunction

" scope: local
function! s:hardRefreshNerdTree()
  if g:webdevicons_enable_nerdtree == 1 && g:webdevicons_conceal_nerdtree_brackets == 1 && g:NERDTree.IsOpen()
    NERDTreeClose
    NERDTree
  endif
endfunction

" scope: local
function! s:softRefreshNerdTree()
  if g:webdevicons_enable_nerdtree == 1 && g:NERDTree.IsOpen()
    NERDTreeToggle
    NERDTreeToggle
  endif
endfunction

" for vim-flagship plugin {{{3
"========================================================================

" scope: local
function! s:initializeFlagship()
  if exists('g:loaded_flagship')
    if g:webdevicons_enable_flagship_statusline
      augroup webdevicons_flagship_filetype
        autocmd User Flags call Hoist('buffer', 'WebDevIconsGetFileTypeSymbol')
      augroup END
    endif

    if g:webdevicons_enable_flagship_statusline_fileformat_symbols
      augroup webdevicons_flagship_filesymbol
        autocmd User Flags call Hoist('buffer', 'WebDevIconsGetFileFormatSymbol')
      augroup END
    endif
  endif
endfunction

" for unite plugin {{{3
"========================================================================

" scope: local
function! s:initializeUnite()
  if exists('g:loaded_unite') && g:webdevicons_enable_unite
    let s:filters = {
          \   'name' : 'devicons_unite_converter',
          \}

    function! s:filters.filter(candidates, context)
      for candidate in a:candidates

        if has_key(candidate, 'action__buffer_nr')
          let bufname = bufname(candidate.action__buffer_nr)
          let filename = fnamemodify(bufname, ':p:t')
          let path = fnamemodify(bufname, ':p:h')
        elseif has_key(candidate, 'word') && has_key(candidate, 'action__path')
          let path = candidate.action__path
          let filename = candidate.word
        endif

        let icon = WebDevIconsGetFileTypeSymbol(filename, isdirectory(filename))

        " prevent filenames of buffers getting 'lost'
        if filename != path
          let path = printf('%s', filename)
        endif

        " Customize output format.
        let candidate.abbr = printf('%s %s', icon, path)
      endfor
      return a:candidates
    endfunction

    call unite#define_filter(s:filters)
    unlet s:filters

    call unite#custom#source('file,file_rec,buffer,file_rec/async,file_rec/neovim,file_rec/neovim2,file_rec/git', 'converters', 'devicons_unite_converter')
  endif
endfunction

" for denite plugin {{{3
"========================================================================

" scope: local
function! s:initializeDenite()
  if exists('g:loaded_denite') && g:webdevicons_enable_denite
    call denite#custom#source('file_rec,file_old,buffer,directory_rec', 'converters', ['devicons_denite_converter'])
  endif
endfunction

" for vimfiler plugin {{{3
"========================================================================

" scope: local
function! s:initializeVimfiler()
  if exists('g:loaded_vimfiler') && g:webdevicons_enable_vimfiler
    call vimfiler#custom#profile('default', 'context', {
      \ 'columns' : 'devicons:size:time',
      \ 'explorer_columns': 'devicons'
      \ })
  endif
endfunction

" for ctrlp plugin {{{3
"========================================================================

" scope: local
" Initialize for up to date ctrlp fork: ctrlpvim/ctrlp.vim
" Support for kien/ctrlp.vim deprecated since v0.7.0
" @TODO implementation for CtrlP buffer and find file mode
function! s:initializeCtrlP()
  let l:ctrlp_warning_message = 'vim-devicons: https://github.com/kien/ctrlp.vim is deprecated since v0.7.0, please use https://github.com/ctrlpvim/ctrlp.vim'
  let l:ctrlp_warned_file = s:plugin_home . '/status_warned_ctrlp'

  if exists('g:loaded_ctrlp') && g:webdevicons_enable_ctrlp
    let l:forkedCtrlp = exists('g:ctrlp_mruf_map_string')

    if l:forkedCtrlp
      if !exists('g:ctrlp_formatline_func')
        " logic for ctrlpvim/ctrlp.vim:
        let g:ctrlp_formatline_func = 's:formatline(s:curtype() == "buf" ? v:val : WebDevIconsGetFileTypeSymbol(v:val) . " " . v:val) '
      endif
    elseif empty(glob(l:ctrlp_warned_file))
      " logic for kien/ctrlp.vim:
      echohl WarningMsg |
        \ echomsg l:ctrlp_warning_message
      " only warn first time, do not warn again:
      try
        execute writefile(['File automatically generated after warning about CtrlP once', l:ctrlp_warning_message], l:ctrlp_warned_file)
      catch
      endtry
    endif
  endif
endfunction

" local initialization {{{2
"========================================================================

" scope: local
function! s:initialize()
  call s:setDictionaries()
  call s:setSyntax()
  call s:setCursorHold()
  call s:initializeFlagship()
  call s:initializeUnite()
  call s:initializeDenite()
  call s:initializeVimfiler()
  call s:initializeCtrlP()
endfunction

" had some issues with VimEnter, for now using:
call s:initialize()

" public functions {{{2
"========================================================================

" scope: public
function! webdevicons#version()
  return s:version
endfunction

" scope: public
" allow the first version of refresh to now call softRefresh
function! webdevicons#refresh()
  call webdevicons#softRefresh()
endfunction

" scope: public
function! webdevicons#hardRefresh()
  call s:setSyntax()
  call s:hardRefreshNerdTree()
endfunction

" scope: public
function! webdevicons#softRefresh()
  call s:setSyntax()
  call s:softRefreshNerdTree()
endfunction

" a:1 (bufferName), a:2 (isDirectory), a:3 (appendArtifactFix)
" scope: public
function! WebDevIconsGetFileTypeSymbol(...)
  let appendArtifactFix = 1
  if a:0 == 0
    let fileNodeExtension = expand('%:e')
    let fileNode = expand('%:t')
    let isDirectory = 0
  else
    let fileNodeExtension = fnamemodify(a:1, ':e')
    let fileNode = fnamemodify(a:1, ':t')
    if a:0 > 1
      let isDirectory = a:2
    else
      let isDirectory = 0
    endif

    if a:0 == 3
      let appendArtifactFix = a:3
    endif
  endif

  if isDirectory == 0 || g:DevIconsEnableFolderPatternMatching

    let symbol = g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol
    let fileNodeExtension = tolower(fileNodeExtension)
    let fileNode = tolower(fileNode)

    for [pattern, glyph] in items(g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols)
      if match(fileNode, pattern) != -1
        let symbol = glyph
        break
      endif
    endfor

    if symbol == g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol
      if has_key(g:WebDevIconsUnicodeDecorateFileNodesExactSymbols, fileNode)
        let symbol = g:WebDevIconsUnicodeDecorateFileNodesExactSymbols[fileNode]
      elseif ((isDirectory == 1 && g:DevIconsEnableFolderExtensionPatternMatching) || isDirectory == 0) && has_key(g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols, fileNodeExtension)
        let symbol = g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols[fileNodeExtension]
      elseif isDirectory == 1
        let symbol = g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol
      endif
    endif

  else
    let symbol = g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol
  endif

  " Temporary (hopefully) fix for glyph issues in gvim (proper fix is with the
  " actual font patcher)
  if appendArtifactFix == 1
    let artifactFix = "\u00A0"
  else
    let artifactFix = ""
  endif

  return symbol . artifactFix

endfunction

" scope: public
function! WebDevIconsGetFileFormatSymbol(...)
  let fileformat = ''
  let bomb = ''

  if (&bomb && g:WebDevIconsUnicodeByteOrderMarkerDefaultSymbol !=? '')
    let bomb = g:WebDevIconsUnicodeByteOrderMarkerDefaultSymbol . ' '
  endif

  if &fileformat ==? 'dos'
    let fileformat = ''
  elseif &fileformat ==? 'unix'
    if s:isDarwin()
      let fileformat = ''
    else
      let fileformat = ''
    endif
  elseif &fileformat ==? 'mac'
    let fileformat = ''
  endif

  " Temporary (hopefully) fix for glyph issues in gvim (proper fix is with the
  " actual font patcher)
  let artifactFix = "\u00A0"

  return bomb . fileformat . artifactFix
endfunction

" for airline plugin {{{3
"========================================================================

" scope: public
function! AirlineWebDevIcons(...)
  let w:airline_section_x = get(w:, 'airline_section_x',
        \ get(g:, 'airline_section_x', ''))
  let w:airline_section_x .= ' %{WebDevIconsGetFileTypeSymbol()} '
  let hasFileFormatEncodingPart = airline#parts#ffenc() != ''
  if g:webdevicons_enable_airline_statusline_fileformat_symbols && hasFileFormatEncodingPart
    let w:airline_section_y = ' %{&fenc . " " . WebDevIconsGetFileFormatSymbol()} '
  endif
endfunction

if g:webdevicons_enable == 1 && exists('g:loaded_airline') && g:loaded_airline == 1 && g:webdevicons_enable_airline_statusline
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
  let hasGitFlags = (len(path.flagSet._flagsForScope('git')) > 0)
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
    " Hey we got a regular file, lets get it's proper icon
    let flag = prePadding . WebDevIconsGetFileTypeSymbol(path.str()) . padding

  elseif path.isDirectory && g:WebDevIconsUnicodeDecorateFolderNodes == 1
    " Ok we got a directory, some more tests and checks
    let directoryOpened = 0

    if g:DevIconsEnableFoldersOpenClose && len(path.flagSet._flagsForScope('webdevicons')) > 0
      " did the user set different icons for open and close?

      " isOpen is not available on the path listener directly
      " but we added one via overriding particular keymappings for NERDTree
      if has_key(path, 'isOpen') && path.isOpen == 1
        let directoryOpened = 1
      endif
    endif

    if g:WebDevIconsUnicodeDecorateFolderNodesExactMatches == 1
      " Did the user enable exact matching of folder type/names
      " think node_modules
      if g:DevIconsEnableFoldersOpenClose && directoryOpened
        " the folder is open
        let flag = prePadding . g:DevIconsDefaultFolderOpenSymbol . padding
      else
        " the folder is not open
        if path.isSymLink
          " We have a symlink
          let flag = prePadding . g:WebDevIconsUnicodeDecorateFolderNodesSymlinkSymbol . padding
        else
          " We have a regular folder
          let flag = prePadding . WebDevIconsGetFileTypeSymbol(path.str(), path.isDirectory, 0) . padding
        endif
      endif

    else
      " the user did not enable exact matching
      if g:DevIconsEnableFoldersOpenClose && directoryOpened
        " the folder is open
        let flag = prePadding . g:DevIconsDefaultFolderOpenSymbol . padding
      else
        " the folder is not open
        if path.isSymLink
          " We have a symlink
          let flag = prePadding . g:WebDevIconsUnicodeDecorateFolderNodesSymlinkSymbol . padding
        else
          " We have a regular folder
          let flag = prePadding . g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol . padding
        endif
      endif

    endif

  else
    let flag = ''
  endif

  call path.flagSet.clearFlags('webdevicons')

  if flag !=? ''
    call path.flagSet.addFlag('webdevicons', flag)
  endif

endfunction

" standard fix/safety: line continuation (avoiding side effects) {{{1
"========================================================================
let &cpo = s:save_cpo
unlet s:save_cpo

" modeline syntax:
" vim: fdm=marker tabstop=2 softtabstop=2 shiftwidth=2 expandtab:
