
" @todo fix duplicate global variable initialize here:
if !exists('g:webdevicons_enable')
  let g:webdevicons_enable = 1
endif

if !exists('g:webdevicons_enable_nerdtree')
  let g:webdevicons_enable_nerdtree = 1
endif

" Temporary (hopefully) fix for glyph issues in gvim (proper fix is with the
" actual font patcher)
if !exists('g:webdevicons_gui_glyph_fix')
  let g:webdevicons_gui_glyph_fix = 1
endif

if g:webdevicons_enable_nerdtree == 1
  if !exists('g:loaded_nerd_tree')
     echohl WarningMsg |
       \ echomsg "vim-webdevicons requires NERDTree to be loaded before vim-webdevicons."
  endif

  if exists('g:loaded_nerd_tree') && g:loaded_nerd_tree == 1 && !exists('g:NERDTreePathNotifier')
     let g:webdevicons_enable_nerdtree = 0
     echohl WarningMsg |
        \ echomsg "vim-webdevicons requires a newer version of NERDTree to show glyphs in NERDTree - consider updating NERDTree."
  endif

  " @todo I don't even want this to execute UNLESS the user has the
  " 'nerdtree-git-plugin' INSTALLED (not LOADED)
  " As it currently functions this warning will display even if the user does
  " not have nerdtree-git-plugin not just if it isn't loaded yet 
  " (not what we want)
  "if !exists('g:loaded_nerdtree_git_status')
  "   echohl WarningMsg |
  "     \ echomsg "vim-webdevicons works better when 'nerdtree-git-plugin' is loaded before vim-webdevicons (small refresh issues otherwise)."
  "endif
endif

if !exists('g:webdevicons_enable_airline_tabline')
  let g:webdevicons_enable_airline_tabline = 1
endif

if !exists('g:webdevicons_enable_airline_statusline')
  let g:webdevicons_enable_airline_statusline = 1
endif

function! s:SetupListeners()
  call g:NERDTreePathNotifier.AddListener("init", "NERDTreeWebDevIconsRefreshListener")
  call g:NERDTreePathNotifier.AddListener("refresh", "NERDTreeWebDevIconsRefreshListener")
  call g:NERDTreePathNotifier.AddListener("refreshFlags", "NERDTreeWebDevIconsRefreshListener")
endfunction

" Temporary (hopefully) fix for glyph issues in gvim (proper fix is with the
" actual font patcher)

" NERDTree-C
" scope: global
function! WebDevIconsNERDTreeChangeRootHandler(node)
  call a:node.makeRoot()
  call NERDTreeRender()
  call a:node.putCursorHere(0, 0)
  redraw!
endfunction

" NERDTree-u
" scope: global
function! WebDevIconsNERDTreeUpDirCurrentRootClosedHandler()
  call nerdtree#ui_glue#upDir(0)
  redraw!
endfunction

if g:webdevicons_enable == 1 && g:webdevicons_enable_nerdtree == 1
  call s:SetupListeners()

  " Temporary (hopefully) fix for glyph issues in gvim (proper fix is with the
  " actual font patcher)
  if g:webdevicons_gui_glyph_fix == 1 && has("gui_running")
    call NERDTreeAddKeyMap({
      \ 'key': g:NERDTreeMapChangeRoot,
      \ 'callback': 'WebDevIconsNERDTreeChangeRootHandler',
      \ 'override': 1,
      \ 'quickhelpText': "change tree root to the\n\"    selected dir\n\"    plus webdevicons redraw\n\"    hack fix",
      \ 'scope': 'Node' })

    call NERDTreeAddKeyMap({
      \ 'key': g:NERDTreeMapUpdir,
      \ 'callback': 'WebDevIconsNERDTreeUpDirCurrentRootClosedHandler',
      \ 'override': 1,
      \ 'quickhelpText': "move tree root up a dir\n\"    plus webdevicons redraw\n\"    hack fix",
      \ 'scope': 'all' })
  endif
endif


