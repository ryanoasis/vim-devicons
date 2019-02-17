" Version: 0.11.0
" Webpage: https://github.com/ryanoasis/vim-devicons
" Maintainer: Ryan McIntyre <ryanoasis@gmail.com>
" License: see LICENSE

let s:version = '0.11.0'
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

""
" Set the variable to the default value, only if variable is not defined.
"
" @param {string} var Variable name with its scope.
" @param {*} default Default value for variable.
""
function! s:set(var, default) abort
  if !exists(a:var)
    if type(a:default)
      execute 'let' a:var '=' string(a:default)
    else
      execute 'let' a:var '=' a:default
    endif
  endif
endfunction

call s:set('g:webdevicons_enable', 1)
call s:set('g:webdevicons_enable_nerdtree', 1)
call s:set('g:webdevicons_enable_unite ', 1)
call s:set('g:webdevicons_enable_denite', 1)
call s:set('g:webdevicons_enable_vimfiler', 1)
call s:set('g:webdevicons_enable_ctrlp', 1)
call s:set('g:webdevicons_enable_airline_tabline', 1)
call s:set('g:webdevicons_enable_airline_statusline', 1)
call s:set('g:webdevicons_enable_airline_statusline_fileformat_symbols', 1)
call s:set('g:webdevicons_enable_flagship_statusline', 1)
call s:set('g:webdevicons_enable_flagship_statusline_fileformat_symbols', 1)
call s:set('g:webdevicons_enable_startify', 1)
call s:set('g:webdevicons_conceal_nerdtree_brackets', 1)
call s:set('g:DevIconsAppendArtifactFix', has('gui_running') ? 1 : 0)
call s:set('g:DevIconsArtifactFixChar', " ")

" config options {{{1
"========================================================================

call s:set('g:WebDevIconsUnicodeDecorateFileNodes', 1)
call s:set('g:WebDevIconsUnicodeDecorateFolderNodes', 0)
call s:set('g:DevIconsEnableFoldersOpenClose', 0)
call s:set('g:DevIconsEnableFolderPatternMatching', 1)
call s:set('g:DevIconsEnableFolderExtensionPatternMatching', 0)
call s:set('g:WebDevIconsUnicodeDecorateFolderNodesExactMatches', 1)
call s:set('g:WebDevIconsUnicodeGlyphDoubleWidth', 1)
call s:set('g:WebDevIconsNerdTreeBeforeGlyphPadding', ' ')
call s:set('g:WebDevIconsNerdTreeAfterGlyphPadding', ' ')
call s:set('g:WebDevIconsNerdTreeGitPluginForceVAlign', 1)
call s:set('g:NERDTreeUpdateOnCursorHold', 1)

" config defaults {{{1
"========================================================================

call s:set('g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol', '')
call s:set('g:WebDevIconsUnicodeByteOrderMarkerDefaultSymbol', '')
call s:set('g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol', g:DevIconsEnableFoldersOpenClose ? '' : '')
call s:set('g:WebDevIconsUnicodeDecorateFolderNodesSymlinkSymbol',  '')
call s:set('g:DevIconsDefaultFolderOpenSymbol', '')

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
        \ 'ex'       : '',
        \ 'exs'      : '',
        \ 'eex'      : '',
        \ 'vim'      : '',
        \ 'ai'       : '',
        \ 'psd'      : '',
        \ 'psb'      : '',
        \ 'ts'       : '',
        \ 'tsx'      : '',
        \ 'jl'       : '',
        \ 'pp'       : '',
        \ 'vue'      : '﵂',
        \ 'swift'    : '',
        \ 'xcplayground' : ''
        \}

  let s:file_node_exact_matches = {
        \ 'exact-match-case-sensitive-1.txt' : '1',
        \ 'exact-match-case-sensitive-2'     : '2',
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
        \ '.vimrc'                           : '',
        \ '.gvimrc'                          : '',
        \ '_vimrc'                           : '',
        \ '_gvimrc'                          : '',
        \ '.bashprofile'                     : '',
        \ 'favicon.ico'                      : '',
        \ 'license'                          : '',
        \ 'node_modules'                     : '',
        \ 'react.jsx'                        : '',
        \ 'procfile'                         : '',
        \ 'dockerfile'                       : '',
        \ 'docker-compose.yml'               : '',
        \}

  let s:file_node_pattern_matches = {
        \ '.*jquery.*\.js$'       : '',
        \ '.*angular.*\.js$'      : '',
        \ '.*backbone.*\.js$'     : '',
        \ '.*require.*\.js$'      : '',
        \ '.*materialize.*\.js$'  : '',
        \ '.*materialize.*\.css$' : '',
        \ '.*mootools.*\.js$'     : '',
        \ '.*vimrc.*'             : '',
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

  exec l:altwinnr . 'wincmd w'
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

" local initialization {{{2
"========================================================================

" scope: local
function! s:initialize()
  call s:setDictionaries()
  call s:setSyntax()
  call s:setCursorHold()

  if exists('g:loaded_flagship') | call devicons#plugins#flagship#init() | endif
  if exists('g:loaded_unite') && g:webdevicons_enable_unite | call devicons#plugins#unite#init() | endif
  if exists('g:loaded_denite') && g:webdevicons_enable_denite | call devicons#plugins#denite#init() | endif
  if exists('g:loaded_vimfiler') && g:webdevicons_enable_vimfiler | call devicons#plugins#vimfiler#init() | endif
  if exists('g:loaded_ctrlp') && g:webdevicons_enable_ctrlp | call devicons#plugins#ctrlp#init() | endif
  if exists('g:loaded_startify') && g:webdevicons_enable_startify | call devicons#plugins#startify#init() | endif
endfunction


" public functions {{{2
"========================================================================

" scope: public
function! webdevicons#version()
  return s:version
endfunction

" scope: public
function! webdevicons#pluginHome()
  return s:plugin_home
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

" a:1 (bufferName), a:2 (isDirectory)
" scope: public
function! WebDevIconsGetFileTypeSymbol(...)
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

  let artifactFix = s:DevIconsGetArtifactFix()

  return symbol . artifactFix

endfunction

" scope: local
" Temporary (hopefully) fix for glyph issues in gvim (proper fix is with the
" actual font patcher)
function! s:DevIconsGetArtifactFix()
  if g:DevIconsAppendArtifactFix == 1
    let artifactFix = g:DevIconsArtifactFixChar
  else
    let artifactFix = ''
  endif

  return artifactFix
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

  let artifactFix = s:DevIconsGetArtifactFix()

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
  let postPadding = g:WebDevIconsNerdTreeAfterGlyphPadding
  let prePadding = g:WebDevIconsNerdTreeBeforeGlyphPadding
  let hasGitFlags = (len(path.flagSet._flagsForScope('git')) > 0)
  let hasGitNerdTreePlugin = (exists('g:loaded_nerdtree_git_status') == 1)
  let artifactFix = s:DevIconsGetArtifactFix()

  if hasGitFlags && g:WebDevIconsUnicodeGlyphDoubleWidth == 1
    let prePadding .= ' '
  endif

  " align vertically at the same level: non git-flag nodes with git-flag nodes
  if g:WebDevIconsNerdTreeGitPluginForceVAlign && !hasGitFlags && hasGitNerdTreePlugin
    let prePadding .= '  '
  endif

  if !path.isDirectory
    " Hey we got a regular file, lets get it's proper icon
    let flag = prePadding . WebDevIconsGetFileTypeSymbol(path.str()) . postPadding

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
        let flag = prePadding . g:DevIconsDefaultFolderOpenSymbol . artifactFix . postPadding
      else
        " the folder is not open
        if path.isSymLink
          " We have a symlink
          let flag = prePadding . g:WebDevIconsUnicodeDecorateFolderNodesSymlinkSymbol . artifactFix . postPadding
        else
          " We have a regular folder
          let flag = prePadding . WebDevIconsGetFileTypeSymbol(path.str(), path.isDirectory) . postPadding
        endif
      endif

    else
      " the user did not enable exact matching
      if g:DevIconsEnableFoldersOpenClose && directoryOpened
        " the folder is open
        let flag = prePadding . g:DevIconsDefaultFolderOpenSymbol . artifactFix . postPadding
      else
        " the folder is not open
        if path.isSymLink
          " We have a symlink
          let flag = prePadding . g:WebDevIconsUnicodeDecorateFolderNodesSymlinkSymbol . artifactFix . postPadding
        else
          " We have a regular folder
          let flag = prePadding . g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol . artifactFix . postPadding
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

" call setup after processing all the functions (to avoid errors) {{{1
"========================================================================
" had some issues with VimEnter, for now using:
call s:initialize()

" standard fix/safety: line continuation (avoiding side effects) {{{1
"========================================================================
let &cpo = s:save_cpo
unlet s:save_cpo

" modeline syntax:
" vim: fdm=marker tabstop=2 softtabstop=2 shiftwidth=2 expandtab:
