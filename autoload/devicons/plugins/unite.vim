function! devicons#plugins#unite#init() abort
  let s:filters = {
    \ 'name': 'devicons_unite_converter'
  \ }

  function! s:filters.filter(candidates, context)
    for candidate in a:candidates

      if has_key(candidate, 'action__buffer_nr')
        let bufname = bufname(candidate.action__buffer_nr)
        let filename = fnamemodify(bufname, ':p:t')
        let path = fnamemodify(bufname, ':p:h')
      elseif has_key(candidate, 'word') && has_key(candidate, 'action__path')
        let path = candidate.action__path
        let filename = candidate.word
      endif

      let icon = WebDevIconsGetFileTypeSymbol(filename, isdirectory(filename))

      " prevent filenames of buffers getting 'lost'
      if filename != path
        let path = printf('%s', filename)
      endif

      " Customize output format.
      let candidate.abbr = printf('%s %s', icon, path)
    endfor
    return a:candidates
  endfunction

  call unite#define_filter(s:filters)
  unlet s:filters

  call unite#custom#source('file,file_rec,buffer,file_rec/async,file_rec/neovim,file_rec/neovim2,file_rec/git', 'converters', 'devicons_unite_converter')
endfunction

" vim: tabstop=2 softtabstop=2 shiftwidth=2 expandtab:
