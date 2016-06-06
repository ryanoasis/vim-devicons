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
  call airline#extensions#append_to_section('x',
        \ s:spc.'%{WebDevIconsGetFileTypeSymbol()}'.s:spc)

  " Fileformat symbol.  2 means to only replace the default ffenc part.
  if g:webdevicons_enable_airline_statusline_fileformat_symbols == 2
    let match_orig_ffenc = '\m(airline#parts#ffenc(),'
    let airline_section_y = get(w:, 'airline_section_y', get(g:, 'airline_section_y'))
    if airline_section_y =~# match_orig_ffenc
      let w:airline_section_y = substitute(airline_section_y, match_orig_ffenc,
            \ s:spc.'(WebDevIconsGetFileFormatSymbol(),', '')
    endif
    return
  elseif g:webdevicons_enable_airline_statusline_fileformat_symbols
    call airline#extensions#append_to_section('y',
            \ s:spc . '%{WebDevIconsGetFileFormatSymbol()}')
  endif
endfunction
