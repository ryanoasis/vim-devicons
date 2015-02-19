function! airline#extensions#tabline#formatters#webdevicons#format(bufnr, buffers)
  return fnamemodify(bufname(a:bufnr), ':t') . ' ' . WebDevIconsGetFileTypeSymbol(bufname(a:bufnr)) . ' '
endfunction
