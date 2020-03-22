" Version: 0.11.0
" Webpage: https://github.com/ryanoasis/vim-devicons
" Maintainer: Ryan McIntyre <ryanoasis@gmail.com>
" License: see LICENSE

" @todo fix duplicate global variable initialize here:
if !exists('g:webdevicons_enable')
  let g:webdevicons_enable = 1
endif

if !exists('g:webdevicons_enable_nerdtree')
  let g:webdevicons_enable_nerdtree = 1
endif

if !exists('g:DevIconsEnableFoldersOpenClose')
  let g:DevIconsEnableFoldersOpenClose = 0
endif

if !exists('g:DevIconsEnableFolderPatternMatching')
  let g:DevIconsEnableFolderPatternMatching = 1
endif

if !exists('g:DevIconsEnableFolderExtensionPatternMatching')
  let g:DevIconsEnableFolderExtensionPatternMatching = 0
endif

" end @todo duplicate global variables

" Temporary (hopefully) fix for glyph issues in gvim (proper fix is with the
" actual font patcher)
if !exists('g:webdevicons_gui_glyph_fix')
  if has('gui_running')
    let g:webdevicons_gui_glyph_fix = 1
  else
    let g:webdevicons_gui_glyph_fix = 0
  endif
endif

if !exists('g:DevIconsEnableNERDTreeRedraw')
  if has('gui_running')
    let g:DevIconsEnableNERDTreeRedraw = 1
  else
    let g:DevIconsEnableNERDTreeRedraw = 0
  endif
endif

if g:webdevicons_enable_nerdtree == 1
  if !exists('g:loaded_nerd_tree')
     echohl WarningMsg |
       \ echomsg 'vim-webdevicons requires NERDTree to be loaded before vim-webdevicons.'
  endif

  if exists('g:loaded_nerd_tree') && g:loaded_nerd_tree == 1 && !exists('g:NERDTreePathNotifier')
     let g:webdevicons_enable_nerdtree = 0
     echohl WarningMsg |
        \ echomsg 'vim-webdevicons requires a newer version of NERDTree to show glyphs in NERDTree - consider updating NERDTree.'
  endif

  " @todo I don't even want this to execute UNLESS the user has the
  " 'nerdtree-git-plugin' INSTALLED (not LOADED)
  " As it currently functions this warning will display even if the user does
  " not have nerdtree-git-plugin not just if it isn't loaded yet 
  " (not what we want)
  "if !exists('g:loaded_nerdtree_git_status')
  "   echohl WarningMsg |
  "     \ echomsg 'vim-webdevicons works better when 'nerdtree-git-plugin' is loaded before vim-webdevicons (small refresh issues otherwise).'
  "endif
endif

if !exists('g:webdevicons_enable_airline_tabline')
  let g:webdevicons_enable_airline_tabline = 1
endif

if !exists('g:webdevicons_enable_airline_statusline')
  let g:webdevicons_enable_airline_statusline = 1
endif

function! s:SetupListeners()
  call g:NERDTreePathNotifier.AddListener('init', 'NERDTreeWebDevIconsRefreshListener')
  call g:NERDTreePathNotifier.AddListener('refresh', 'NERDTreeWebDevIconsRefreshListener')
  call g:NERDTreePathNotifier.AddListener('refreshFlags', 'NERDTreeWebDevIconsRefreshListener')
endfunction

" util like helpers
" scope: local
function! s:Refresh()
  call b:NERDTree.root.refreshFlags()
  call NERDTreeRender()
endfunction

" Temporary (hopefully) fix for glyph issues in gvim (proper fix is with the
" actual font patcher)

" NERDTree-C
" scope: global
function! WebDevIconsNERDTreeChangeRootHandler(node)
  call b:NERDTree.changeRoot(a:node)
  call NERDTreeRender()
  call a:node.putCursorHere(0, 0)
  if g:DevIconsEnableNERDTreeRedraw ==# 1
    redraw!
  endif
endfunction

" NERDTree-u
" scope: global
function! WebDevIconsNERDTreeUpDirCurrentRootClosedHandler()
  call nerdtree#ui_glue#upDir(0)
  if g:DevIconsEnableNERDTreeRedraw ==# 1
    redraw!
  endif
endfunction

function! WebDevIconsNERDTreeDirUpdateFlags(node, glyph)
  let path = a:node.path
  let isOpen = a:node.isOpen
  let postPadding = g:WebDevIconsNerdTreeAfterGlyphPadding
  let prePadding = g:WebDevIconsNerdTreeBeforeGlyphPadding
  let hasGitFlags = (len(path.flagSet._flagsForScope('git')) > 0)
  let hasGitNerdTreePlugin = (exists('g:loaded_nerdtree_git_status') == 1)
  let collapsesToSameLine = (exists('g:NERDTreeCascadeSingleChildDir') == 1)
  let dirHasOnlyOneChildDir = 0

  if collapsesToSameLine
    " need to call to determin children:
    call a:node._initChildren(1)
    let dirHasOnlyOneChildDir = (a:node.getChildCount() ==# 1 && a:node.children[0].path.isDirectory)
  endif

  " properly set collapsed/combined directory display to opened glyph
  if collapsesToSameLine && dirHasOnlyOneChildDir
    call WebDevIconsNERDTreeDirOpen(a:node.children[0])
  endif

  " align vertically at the same level: non git-flag nodes with git-flag nodes
  if g:WebDevIconsNerdTreeGitPluginForceVAlign && !hasGitFlags && hasGitNerdTreePlugin
    let prePadding .= '  '
  endif

  let flag = prePadding . a:glyph . postPadding

  call a:node.path.flagSet.clearFlags('webdevicons')

  if flag !=? ''
    call a:node.path.flagSet.addFlag('webdevicons', flag)
    "echom "added flag of " . flag
    call a:node.path.refreshFlags(b:NERDTree)
    "echom "flagset is now " . string(a:node.path.flagSet)
  endif
endfunction

function! WebDevIconsNERDTreeDirClose(node)
  let a:node.path.isOpen = 0
  let glyph = g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol
  call WebDevIconsNERDTreeDirUpdateFlags(a:node, glyph)
endfunction

function! WebDevIconsNERDTreeDirOpen(node)
  let a:node.path.isOpen = 1
  let glyph = g:DevIconsDefaultFolderOpenSymbol
  call WebDevIconsNERDTreeDirUpdateFlags(a:node, glyph)
endfunction

function! WebDevIconsNERDTreeDirOpenRecursively(node)
  call WebDevIconsNERDTreeDirOpen(a:node)
  for i in a:node.children
    if i.path.isDirectory ==# 1
      call WebDevIconsNERDTreeDirOpenRecursively(i)
    endif
  endfor
endfunction

function! WebDevIconsNERDTreeDirCloseRecursively(node)
  call WebDevIconsNERDTreeDirClose(a:node)
  for i in a:node.children
    if i.path.isDirectory ==# 1
      call WebDevIconsNERDTreeDirCloseRecursively(i)
    endif
  endfor
endfunction

function! WebDevIconsNERDTreeDirCloseChildren(node)
  for i in a:node.children
    if i.path.isDirectory ==# 1
      call WebDevIconsNERDTreeDirClose(i)
    endif
  endfor
endfunction

" NERDTreeMapActivateNode and <2-LeftMouse>
" handle the user activating a tree node
" scope: global
function! WebDevIconsNERDTreeMapActivateNode(node)
  let isOpen = a:node.isOpen
  if isOpen
    let glyph = g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol
  else
    let glyph = g:DevIconsDefaultFolderOpenSymbol
  endif
  let a:node.path.isOpen = !isOpen
  call WebDevIconsNERDTreeDirUpdateFlags(a:node, glyph)
  " continue with normal activate logic
  call a:node.activate()
  " glyph change possible artifact clean-up
  if g:DevIconsEnableNERDTreeRedraw ==# 1
    redraw!
  endif
endfunction

" NERDTreeMapActivateNodeSingleMode 
" handle the user activating a tree node if NERDTreeMouseMode is setted to 3
" scope: global
function! WebDevIconsNERDTreeMapActivateNodeSingleMode(node)
  if g:NERDTreeMouseMode == 3
    let isOpen = a:node.isOpen
    if isOpen
      let glyph = g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol
    else
      let glyph = g:DevIconsDefaultFolderOpenSymbol
    endif
    let a:node.path.isOpen = !isOpen
    call WebDevIconsNERDTreeDirUpdateFlags(a:node, glyph)
    " continue with normal activate logic
    call a:node.activate()
    " glyph change possible artifact clean-up
    if g:DevIconsEnableNERDTreeRedraw ==# 1
      redraw!
    endif
  endif
endfunction

function! WebDevIconsNERDTreeMapOpenRecursively(node)
  " normal original logic:
  call nerdtree#echo('Recursively opening node. Please wait...')
  call WebDevIconsNERDTreeDirOpenRecursively(a:node)
  call a:node.openRecursively()
  " continue with normal original logic:
  call b:NERDTree.render()
  " glyph change possible artifact clean-up
  if g:DevIconsEnableNERDTreeRedraw ==# 1
    redraw!
  endif
  call nerdtree#echo('Recursively opening node. Please wait... DONE')
endfunction

function! WebDevIconsNERDTreeMapCloseChildren(node)
  " close children but not current node:
  call WebDevIconsNERDTreeDirCloseChildren(a:node)
  " continue with normal original logic:
  call a:node.closeChildren()
  call b:NERDTree.render()
  call a:node.putCursorHere(0, 0)
  " glyph change possible artifact clean-up
  if g:DevIconsEnableNERDTreeRedraw ==# 1
    redraw!
  endif
endfunction

function! WebDevIconsNERDTreeMapCloseDir(node)
  " continue with normal original logic:
  let parent = a:node.parent
  while g:NERDTreeCascadeOpenSingleChildDir && !parent.isRoot()
    let childNodes = parent.getVisibleChildren()
    if len(childNodes) == 1 && childNodes[0].path.isDirectory
      let parent = parent.parent
    else
      break
    endif
  endwhile
  if parent ==# {} || parent.isRoot()
    call nerdtree#echo('cannot close tree root')
  else
    call parent.close()
    " update the glyph
    call WebDevIconsNERDTreeDirClose(parent)
    call b:NERDTree.render()
    call parent.putCursorHere(0, 0)
    " glyph change possible artifact clean-up
    if g:DevIconsEnableNERDTreeRedraw ==# 1
      redraw!
    endif
  endif
endfunction

function! WebDevIconsNERDTreeMapUpdirKeepOpen()
  call WebDevIconsNERDTreeDirOpen(b:NERDTree.root)
  " continue with normal logic:
  call nerdtree#ui_glue#upDir(1)
  call s:Refresh()
  " glyph change possible artifact clean-up
  if g:DevIconsEnableNERDTreeRedraw ==# 1
    redraw!
  endif
endfunction

if g:webdevicons_enable == 1 && g:webdevicons_enable_nerdtree == 1
  call s:SetupListeners()

  if g:DevIconsEnableFoldersOpenClose

    " These overrides are needed because we cannot
    " simply use AddListener for reliably updating
    " the folder open/close glyphs because the event
    " path has no access to the 'isOpen' property
    " some of these are a little more brittle/fragile
    " than others
    " TODO FIXME better way to reliably update
    " open/close glyphs in NERDTreeWebDevIconsRefreshListener

    " NERDTreeMapActivateNode
    call NERDTreeAddKeyMap({
      \ 'key': g:NERDTreeMapActivateNode,
      \ 'callback': 'WebDevIconsNERDTreeMapActivateNode',
      \ 'override': 1,
      \ 'scope': 'DirNode' })

    " NERDTreeMapCustomOpen
    call NERDTreeAddKeyMap({
      \ 'key': g:NERDTreeMapCustomOpen,
      \ 'callback': 'WebDevIconsNERDTreeMapActivateNode',
      \ 'override': 1,
      \ 'scope': 'DirNode' })

    " NERDTreeMapOpenRecursively
    call NERDTreeAddKeyMap({
      \ 'key': g:NERDTreeMapOpenRecursively,
      \ 'callback': 'WebDevIconsNERDTreeMapOpenRecursively',
      \ 'override': 1,
      \ 'scope': 'DirNode' })

    " NERDTreeMapCloseChildren
    call NERDTreeAddKeyMap({
      \ 'key': g:NERDTreeMapCloseChildren,
      \ 'callback': 'WebDevIconsNERDTreeMapCloseChildren',
      \ 'override': 1,
      \ 'scope': 'DirNode' })

    " NERDTreeMapCloseChildren
    call NERDTreeAddKeyMap({
      \ 'key': g:NERDTreeMapCloseDir,
      \ 'callback': 'WebDevIconsNERDTreeMapCloseDir',
      \ 'override': 1,
      \ 'scope': 'Node' })

    " <2-LeftMouse>
    call NERDTreeAddKeyMap({
      \ 'key': '<2-LeftMouse>',
      \ 'callback': 'WebDevIconsNERDTreeMapActivateNode',
      \ 'override': 1,
      \ 'scope': 'DirNode' })

    " <LeftRelease>
    call NERDTreeAddKeyMap({
      \ 'key': '<LeftRelease>',
      \ 'callback': 'WebDevIconsNERDTreeMapActivateNodeSingleMode',
      \ 'override': 1,
      \ 'scope': 'DirNode' })

    " NERDTreeMapUpdirKeepOpen
    call NERDTreeAddKeyMap({
      \ 'key': g:NERDTreeMapUpdirKeepOpen,
      \ 'callback': 'WebDevIconsNERDTreeMapUpdirKeepOpen',
      \ 'override': 1,
      \ 'scope': 'all' })

  endif

  " Temporary (hopefully) fix for glyph issues in gvim (proper fix is with the
  " actual font patcher)
  if g:webdevicons_gui_glyph_fix ==# 1
    call NERDTreeAddKeyMap({
      \ 'key': g:NERDTreeMapChangeRoot,
      \ 'callback': 'WebDevIconsNERDTreeChangeRootHandler',
      \ 'override': 1,
      \ 'quickhelpText': "change tree root to the\n\"    selected dir\n\"    plus devicons redraw\n\"    hack fix",
      \ 'scope': 'Node' })

    call NERDTreeAddKeyMap({
      \ 'key': g:NERDTreeMapUpdir,
      \ 'callback': 'WebDevIconsNERDTreeUpDirCurrentRootClosedHandler',
      \ 'override': 1,
      \ 'quickhelpText': "move tree root up a dir\n\"    plus devicons redraw\n\"    hack fix",
      \ 'scope': 'all' })
  endif

endif

" modeline syntax:
" vim: fdm=marker tabstop=2 softtabstop=2 shiftwidth=2 expandtab:
