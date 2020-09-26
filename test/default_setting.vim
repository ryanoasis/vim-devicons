scriptencoding utf-8

let s:suite = themis#suite('Webdevicons-default-value')
let s:assert = themis#helper('assert')

function! s:suite.ExtensionConfig()
  call s:assert.equals(g:webdevicons_enable, 1)
  call s:assert.equals(g:webdevicons_enable_nerdtree, 1)
  call s:assert.equals(g:webdevicons_enable_unite, 1)
  call s:assert.equals(g:webdevicons_enable_denite, 1)
  call s:assert.equals(g:webdevicons_enable_vimfiler, 1)
  call s:assert.equals(g:webdevicons_enable_ctrlp, 1)
  call s:assert.equals(g:webdevicons_enable_airline_tabline, 1)
  call s:assert.equals(g:webdevicons_enable_airline_statusline, 1)
  call s:assert.equals(g:webdevicons_enable_airline_statusline_fileformat_symbols, 1)
  call s:assert.equals(g:webdevicons_enable_flagship_statusline, 1)
  call s:assert.equals(g:webdevicons_enable_flagship_statusline_fileformat_symbols, 1)
  call s:assert.equals(g:webdevicons_enable_startify, 1)
  call s:assert.equals(g:webdevicons_conceal_nerdtree_brackets, 1)
endfunction

function! s:suite.ConfigOptions()
  call s:assert.equals(g:DevIconsAppendArtifactFix, 0)
  call s:assert.equals(g:DevIconsArtifactFixChar, ' ')
  call s:assert.equals(g:WebDevIconsUnicodeDecorateFileNodes, 1)
  call s:assert.equals(g:WebDevIconsUnicodeDecorateFolderNodes, 1)
  call s:assert.equals(g:DevIconsEnableFoldersOpenClose, 0)
  call s:assert.equals(g:DevIconsEnableFolderPatternMatching, 1)
  call s:assert.equals(g:DevIconsEnableFolderExtensionPatternMatching, 0)
  call s:assert.equals(1, g:WebDevIconsUnicodeDecorateFolderNodesExactMatches, 1)
  call s:assert.equals(1, g:WebDevIconsUnicodeGlyphDoubleWidth, 1)
  call s:assert.equals(g:WebDevIconsNerdTreeBeforeGlyphPadding, ' ')
  call s:assert.equals(g:WebDevIconsNerdTreeAfterGlyphPadding, ' ')
  call s:assert.equals(g:WebDevIconsNerdTreeGitPluginForceVAlign, 1)
  call s:assert.equals(g:NERDTreeUpdateOnCursorHold, 1) " Obsolete: for backward compatibility
  call s:assert.equals(g:NERDTreeGitStatusUpdateOnCursorHold, 1)
  call s:assert.equals(g:WebDevIconsTabAirLineBeforeGlyphPadding, ' ')
  call s:assert.equals(g:WebDevIconsTabAirLineAfterGlyphPadding, '')
endfunction
