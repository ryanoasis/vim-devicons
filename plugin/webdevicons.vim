if exists('g:loaded_webdevicons')
  finish
endif

let g:loaded_webdevicons = 1

if !exists('g:webdevicons_enable')
  let g:webdevicons_enable = 1
endif

if !exists('g:webdevicons_enable_nerdtree')
  let g:webdevicons_enable_nerdtree = 1
endif

if !exists('g:webdevicons_enable_airline_tabline')
  let g:webdevicons_enable_airline_tabline = 1
endif

if !exists('g:webdevicons_enable_airline_statusline')
  let g:webdevicons_enable_airline_statusline = 1
endif

" config

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

if !exists('g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol')
  let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = ''
endif

if !exists('g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol')
  let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
endif

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = { 'styl': '', 'scss': '', 'htm': '', 'html': '', 'css': '', 'less': '', 'md': '', 'json': '', 'js': '', 'rb': '', 'php': '', 'py': '', 'pyc': '', 'pyo': '', 'pyd': '', 'coffee': '','mustache': '', 'hbs': '', 'conf': '', 'ini': '', 'yml': '', 'jpg': '', 'jpeg': '', 'bmp': '', 'png': '', 'gif': '', 'ai': '', 'twig': '', 'cpp': '', 'c++': '', 'cxx': '', 'cc': '', 'cp': '', 'c': '', 'hs': '', 'lhs': '', 'lua': '', 'java': '', 'sh': '', 'diff': '', 'db': '', 'clj': '', 'scala': '', 'go': '', 'dart': '', 'xul': '', 'sln': '', 'suo': '' }

" do not remove: exact-match-case-sensitive-*
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = { 'exact-match-case-sensitive-1.txt': 'X1', 'exact-match-case-sensitive-2': 'X2', 'gruntfile.coffee': '', 'gruntfile.js': '', 'gruntfile.ls': '', 'gulpfile.coffee': '', 'gulpfile.js': '', 'gulpfile.ls': '', 'dropbox': '' }


" a:1 (bufferName), a:2 (isDirectory)
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

" airline:

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

" nerdtree:

function! NERDTreeWebDevIconsRefreshListener(event)
  let path = a:event.subject
  let padding = ' '

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

