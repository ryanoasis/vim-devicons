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
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = { 'styl': '', 'scss': '', 'htm': '', 'html': '', 'css': '', 'less': '', 'md': '', 'json': '', 'js': '', 'rb': '', 'php': '', 'py': '', 'coffee': '','mustache': '', 'hbs': '', 'conf': '', 'ini': '', 'yml': '', 'jpg': '', 'jpeg': '', 'bmp': '', 'png': '', 'gif': '', 'ai': '' }
" do not remove: exact-match-case-sensitive-*
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = { 'exact-match-case-sensitive-1.txt': 'X1', 'exact-match-case-sensitive-2': 'X2', 'gruntfile.coffee': '', 'gruntfile.js': '', 'gruntfile.ls': '', 'gulpfile.coffee': '', 'gulpfile.js': '', 'gulpfile.ls': '' }


" a:1 (bufferName)
function! WebDevIconsGetFileTypeSymbol(...)

  if a:0 == 0
    let fileNodeExtension = expand("%:e")
    let fileNode = expand("%:t")
  else
    let fileNodeExtension = fnamemodify(a:1, ':e')
    let fileNode = fnamemodify(a:1, ':t')
  end

  let fileNodeExtension = tolower(fileNodeExtension)
  let fileNode = tolower(fileNode)

  let symbol = g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol

  if has_key(g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols, fileNodeExtension)
    let symbol = g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols[fileNodeExtension]
  endif

  if has_key(g:WebDevIconsUnicodeDecorateFileNodesExactSymbols, fileNode)
    let symbol = g:WebDevIconsUnicodeDecorateFileNodesExactSymbols[fileNode]
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
  let g:airline#extensions#tabline#formatter = 'webdevicons'
endif

" nerdtree:

function! NERDTreeWebDevIconsRefreshListener(event)
  let path = a:event.subject
  let flag = WebDevIconsGetFileTypeSymbol(path.str()) . ' '
  call path.flagSet.clearFlags("webdevicons")

  if flag != '' && !path.isDirectory
    call path.flagSet.addFlag("webdevicons", flag)
  endif
endfunction

