function! devicons#plugins#denite#init() abort
  call denite#custom#source('file_rec,file_mru,file_old,buffer,directory_rec,directory_mru', 'converters', ['devicons_denite_converter'])
endfunction

" vim: tabstop=2 softtabstop=2 shiftwidth=2 expandtab:
