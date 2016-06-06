if !get(g:, 'loaded_webdevicons', 0)
  finish
endif

if !get(g:, 'webdevicons_enable', 0) || !get(g:, 'webdevicons_enable_airline_statusline')
  finish
endif

let s:spc = g:airline_symbols.space

function! airline#extensions#webdevicons#init(ext)
  if !get(g:, 'airline#extensions#webdevicons#enabled', 0)
    return
  endif
  call a:ext.add_statusline_func('airline#extensions#webdevicons#apply')
endfunction

function! airline#extensions#webdevicons#apply(...)
  call airline#extensions#append_to_section('x',
        \ s:spc . '%{WebDevIconsGetFileTypeSymbol()}')

  if g:webdevicons_enable_airline_statusline_fileformat_symbols
    call airline#extensions#append_to_section('y',
          \ s:spc . '%{WebDevIconsGetFileFormatSymbol()}')
  endif
endfunction
