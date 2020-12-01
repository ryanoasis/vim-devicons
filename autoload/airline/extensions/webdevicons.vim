scriptencoding utf-8

if !get(g:, 'loaded_webdevicons', 0)
  finish
endif

if !get(g:, 'webdevicons_enable', 0) || !get(g:, 'webdevicons_enable_airline_statusline')
  finish
endif

let s:spc = g:airline_symbols.space

function! airline#extensions#webdevicons#init(ext) abort
  call a:ext.add_statusline_func('airline#extensions#webdevicons#apply')
endfunction

function! airline#extensions#webdevicons#apply(...) abort
  let w:airline_section_x = get(w:, 'airline_section_x',
        \ get(g:, 'airline_section_x', ''))
  let w:airline_section_x .= ' %{WebDevIconsGetFileTypeSymbol()} '
  let hasFileFormatEncodingPart = airline#parts#ffenc() !=? ''
  if g:webdevicons_enable_airline_statusline_fileformat_symbols && hasFileFormatEncodingPart
    let w:airline_section_y = ' %{&fenc . " " . WebDevIconsGetFileFormatSymbol()} '
  endif
endfunction
