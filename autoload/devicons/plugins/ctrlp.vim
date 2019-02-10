" Initialize for up to date ctrlp fork: ctrlpvim/ctrlp.vim
" Support for kien/ctrlp.vim deprecated since v0.7.0
" @TODO implementation for CtrlP buffer and find file mode

function! devicons#plugins#ctrlp#init() abort
  let l:ctrlp_warning_message = 'vim-devicons: https://github.com/kien/ctrlp.vim is deprecated since v0.7.0, please use https://github.com/ctrlpvim/ctrlp.vim'
  let l:ctrlp_warned_file = webdevicons#pluginHome() . '/status_warned_ctrlp'

  if exists('g:loaded_ctrlp') && g:webdevicons_enable_ctrlp
    let l:forkedCtrlp = exists('g:ctrlp_mruf_map_string')

    if l:forkedCtrlp
      if !exists('g:ctrlp_formatline_func')
        " logic for ctrlpvim/ctrlp.vim:
        let g:ctrlp_formatline_func = 's:formatline(s:curtype() == "buf" ? v:val : WebDevIconsGetFileTypeSymbol(v:val) . " " . v:val) '
      endif
    elseif empty(glob(l:ctrlp_warned_file))
      " logic for kien/ctrlp.vim:
      echohl WarningMsg |
            \ echomsg l:ctrlp_warning_message
      " only warn first time, do not warn again:
      try
        execute writefile(['File automatically generated after warning about CtrlP once', l:ctrlp_warning_message], l:ctrlp_warned_file)
      catch
      endtry
    endif
  endif
endfunction

" vim: tabstop=2 softtabstop=2 shiftwidth=2 expandtab:
