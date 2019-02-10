function! devicons#plugins#flagship#init() abort
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
endfunction

" vim: tabstop=2 softtabstop=2 shiftwidth=2 expandtab:
