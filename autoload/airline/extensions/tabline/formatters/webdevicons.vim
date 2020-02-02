" Version: 0.11.0
" Webpage: https://github.com/ryanoasis/vim-devicons
" Maintainer: Ryan McIntyre <ryanoasis@gmail.com>
" License: see LICENSE

function! airline#extensions#tabline#formatters#webdevicons#format(bufnr, buffers) abort
  " Call original formatter.
  let originalFormatter = airline#extensions#tabline#formatters#{g:_webdevicons_airline_orig_formatter}#format(a:bufnr, a:buffers)
  return originalFormatter . g:WebDevIconsTabAirLineBeforeGlyphPadding .
         \ WebDevIconsGetFileTypeSymbol(bufname(a:bufnr)) . g:WebDevIconsTabAirLineAfterGlyphPadding
endfunction

" modeline syntax:
" vim: fdm=marker tabstop=2 softtabstop=2 shiftwidth=2 expandtab:
