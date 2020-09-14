function! devicons#plugins#leaderf#init() abort
  let g:Lf_DevIconsExactSymbols = extend(g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols, get(g:, 'Lf_DevIconsExactSymbols', {}))
  let g:Lf_DevIconsExtensionSymbols = extend(g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols, get(g:, 'Lf_DevIconsExtensionSymbols', {}))
endfunction

" vim: tabstop=2 softtabstop=2 shiftwidth=2 expandtab:
