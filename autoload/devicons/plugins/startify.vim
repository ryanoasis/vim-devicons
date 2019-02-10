
function! devicons#plugins#startify#init() abort
  exec ":function! StartifyEntryFormat() abort \n return 'WebDevIconsGetFileTypeSymbol(absolute_path) .\" \". entry_path' \n endfunction"
endfunction

" vim: tabstop=2 softtabstop=2 shiftwidth=2 expandtab:
