function! devicons#plugins#denite#init() abort
  let s:denite_ver = (exists('*denite#get_status_mode') ? 2 : 3)
  if s:s:denite_ver == 3
    call denite#custom#source('file/rec,file_mru,file/old,buffer,directory/rec,directory_mru', 'converters', ['devicons_denite_converter'])
  else
    call denite#custom#source('file_rec,file_mru,file_old,buffer,directory_rec,directory_mru', 'converters', ['devicons_denite_converter'])
  endif
endfunction

" vim: tabstop=2 softtabstop=2 shiftwidth=2 expandtab:
