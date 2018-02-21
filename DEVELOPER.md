### API

```vim
" returns the font character that represents the icon
" parameters: a:1 (filename), a:2 (isDirectory)
" both parameters optional
" by default without parameters uses buffer name
WebDevIconsGetFileTypeSymbol(...)

" returns the font character that represents
" the file format as an icon (windows, linux, mac)
WebDevIconsGetFileFormatSymbol()
```

#### Public Methods

```vim
" Returns the current version of the plugin
webdevicons#version()
```

```vim
" Calls webdevicons#softRefresh()
" basically a backwards compatibility convenience
webdevicons#refresh()
```

```vim
" Does a 'hard' refresh of NERDTree
" resets vim-devicons syntax and closes and reopens NERDTree
webdevicons#hardRefresh()
```

```vim
" Does a 'soft' refresh of NERDTree
" resets vim-devicons syntax and toggles NERDTree to the same state
webdevicons#softRefresh()
```

#### API Examples

##### Status line

> Custom vim status line (not relying on vim-airline or lightline):

```vim
set statusline=%f\ %{WebDevIconsGetFileTypeSymbol()}\ %h%w%m%r\ %=%(%l,%c%V\ %Y\ %=\ %P%)
```

##### Simple function call

```vim
echo WebDevIconsGetFileFormatSymbol()
```

#### Integration with other plugins

##### vim-startify

```vim
let entry_format = "'   ['. index .']'. repeat(' ', (3 - strlen(index)))"

if exists('*WebDevIconsGetFileTypeSymbol')  " support for vim-devicons
  let entry_format .= ". WebDevIconsGetFileTypeSymbol(entry_path) .' '.  entry_path"
else
  let entry_format .= '. entry_path'
endif
```
