
" @todo fix duplicate global variable initialize here:
if !exists('g:webdevicons_enable')
  let g:webdevicons_enable = 1
endif

if !exists('g:webdevicons_enable_nerdtree')
  let g:webdevicons_enable_nerdtree = 1
endif

if g:webdevicons_enable_nerdtree == 1
   if !exists('g:NERDTreePathNotifier')
      let g:webdevicons_enable_nerdtree = 0
      echohl WarningMsg |
      \ echomsg "vim-webdevicons requires a newer version of NERDTree to show glyphs in NERDTree - consider updating NERDTree"
   endif
endif

if !exists('g:webdevicons_enable_airline_tabline')
  let g:webdevicons_enable_airline_tabline = 1
endif

if !exists('g:webdevicons_enable_airline_statusline')
  let g:webdevicons_enable_airline_statusline = 1
endif

function! SetupListeners()
  call g:NERDTreePathNotifier.AddListener("init", "NERDTreeWebDevIconsRefreshListener")
  call g:NERDTreePathNotifier.AddListener("refresh", "NERDTreeWebDevIconsRefreshListener")
  call g:NERDTreePathNotifier.AddListener("refreshFlags", "NERDTreeWebDevIconsRefreshListener")
endfunction

if g:webdevicons_enable == 1 && g:webdevicons_enable_nerdtree == 1
  call SetupListeners()
endif
