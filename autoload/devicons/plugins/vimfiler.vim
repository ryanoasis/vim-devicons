function! devicons#plugins#vimfiler#init() abort
  call vimfiler#custom#profile('default', 'context', {
    \ 'columns': 'devicons:size:time',
    \ 'explorer_columns': 'devicons'
  \ })
endfunction

" vim: tabstop=2 softtabstop=2 shiftwidth=2 expandtab:
