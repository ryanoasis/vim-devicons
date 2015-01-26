function! airline#extensions#tabline#webdevicons#format(bufnr, buffers)
  " Call original formatter.
  let s = airline#extensions#tabline#{g:_webdevicons_airline_orig_formatter}#format(a:bufnr, a:buffers)
  return s . ' ' . WebDevIconsGetFileTypeSymbol(bufname(a:bufnr)) . ' '
endfunction
