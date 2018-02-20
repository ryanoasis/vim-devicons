# VimDevIcons - Add Icons to Your Plugins

<h1 align="center">
  <img src="https://github.com/ryanoasis/vim-devicons/wiki/screenshots/v0.10.x/branding-logo.png" alt="vim-devicons">
</h1>

[![GitHub version][img-version-badge]][badge-version]
[![Join the chat at https://gitter.im/ryanoasis/vim-devicons][img-gitter-badge]][gitter]
[![Issue Count][img-code-climate-issues-badge]][code-climate-issues]
[![Code of Conduct][img-coc-badge]][coc]
[![PRs Welcome][img-prs-badge]][prs]

**VimDevIcons** adds filetype glyphs (icons) to other plugins such as [NERDTree], [vim-airline], [CtrlP][ctrlpvim-CtrlP], [powerline], [Denite], [unite], [lightline.vim], [vim-startify], [vimfiler], and [flagship].

<h3 align="center">
  <img src="https://github.com/ryanoasis/vim-devicons/wiki/screenshots/v0.10.x/overall-screenshot.png" alt="vim-devicons overall screenshot" />
</h3>

Features
--------

**VimDevIcons integrates with these plugins and more:**

[NERDTree] | [vim-airline] | [CtrlP][ctrlpvim-CtrlP] | [powerline] | [Denite] | [unite] | [lightline.vim] | [vim-startify] | [vimfiler] | [flagship] | [vim-workspace]

* Customizable and extendable glyphs (icons) settings
  * ability to override defaults and use your own characters or glyphs
* Supports a wide range of file type extensions _[(» More details... «)](#detailed-features)_
* Supports full filename matches _[(» More details... «)](#detailed-features)_
* Supports library pattern matches _[(» More details... «)](#detailed-features)_
* Works with patched fonts, especially [Nerd Fonts]

Quick Links
-----------

| **[Screenshots](#screenshots)**| **[API](#api)** | **[Fonts ➶][patched-fonts]** | **[Patcher ➶][Nerd Fonts]** |
|--------------------------------|-----------------|------------------------------|-----------------------------|
| [![screenshots][img-visual-toc-screenshots]](#screenshots) | [![api][img-visual-toc-api]](#api) | [![patcher-logo-small][img-visual-toc-patched-fonts]][patched-fonts] | [![patcher-logo-small][img-visual-toc-fonts-patcher]][Nerd Fonts] |

Table of Contents
-----------------

[**TL;DR Installation**](#quick-installation)

[**Installation**](#installation)

[**Usage**](#usage)
* [**Lightline Setup**](#lightline-setup)
* [**Powerline Setup**](#powerline-setup)
* [**Extra Configuration**](#extra-configuration)
* [**Character Mappings**](#character-mappings)

[**Features**](#detailed-features)

[**Screenshots**](#screenshots)

[**Methods**](#public-methods)

[**Developer**](#developer)
* [**API**](#api)
* [**Contributing**](#contributing)
* [**Inspiration and special thanks**](#inspiration-and-special-thanks)
* [**Todo**](#todo)
* [**License**](#license)

[**FAQ / Troubleshooting**](#faq--troubleshooting)

[**Rationale**](#rationale)

<br />

<a name="quick-installation"></a>
Quick Installation (TL;DR)
--------------------------

1. Download and install a patched **[Nerd Font]** (or patch your own) _[(» More details... «)][Nerd Fonts]_

2. Install the plugin per your usual method _[(» More details... «)](#installation)_

3. Configure Vim  _[(» More details... «)](#install-step3)_
  * a. **vim**: Set your terminal emulator font
  * b. **gvim**: Set `guifont` in your `vimrc`

Installation
------------

<a name="install-step1"></a>
### Step 1 `Nerd Font`

Get a [**Nerd Font!**][font-installation] or [patch your own.][nerd-fonts-patcher]
Without this, things break

<a name="install-step2"></a>
### Step 2 `VimDevIcons Plugin`

Choose your favorite plugin manager

#### [Pathogen](https://github.com/tpope/vim-pathogen)
  *  `git clone https://github.com/ryanoasis/vim-devicons ~/.vim/bundle/vim-devicons`

#### [NeoBundle](https://github.com/Shougo/neobundle.vim)
  * Add to vimrc:

      ```vim
      NeoBundle 'ryanoasis/vim-devicons'
      ```
  * And install it:

      ```vim
      :so ~/.vimrc
      :NeoBundleInstall
      ```

#### [Vundle](https://github.com/gmarik/vundle)
  * Add to vimrc:

       ```vim
       Plugin 'ryanoasis/vim-devicons'
       ```
  * And install it:

       ```vim
       :so ~/.vimrc
       :PluginInstall
       ```

#### Manual
  *  copy all of the files into your `~/.vim` directory

<a name="install-step3"></a>
### Step 3 `Configure Vim`

Add the following in your `.vimrc` or `.gvimrc`:

##### Set VimDevIcons to load _after_ these plugins!

[NERDTree] | [vim-airline] | [CtrlP][ctrlpvim-CtrlP] | [powerline] | [Denite] | [unite] | [lightline.vim] | [vim-startify] | [vimfiler] | [flagship]

##### Set encoding to UTF-8 to show glyphs

  ```vim
  set encoding=utf8
  ```

##### Set Vim font to a Nerd Font

Linux
 ```vim
 set guifont=<FONT_NAME> <FONT_SIZE>
 ```

```vim
set guifont=DroidSansMono\ Nerd\ Font\ 11
```

macOS (OS X) and Windows
```vim
set guifont=<FONT_NAME>:h<FONT_SIZE>
```

```vim
set guifont=DroidSansMono\ Nerd\ Font:h11
" or:
set guifont=DroidSansMono_Nerd_Font:h11
```

**Note:** if you don't set `guifont` then you'll have to set your terminal's
font, else things break!

##### If you use vim-airline you need this
  ```vim
  let g:airline_powerline_fonts = 1
  ```

##### vimrc examples
* [Sample Windows vimrc configuration 1](https://github.com/ryanoasis/vim-devicons/wiki/samples/v0.10.x/.vimrc-windows-1)
* [Sample Linux vimrc configuration 1](https://github.com/ryanoasis/vim-devicons/wiki/samples/v0.10.x/.vimrc-linux-1)

<br />

### That's it! You're done. ✅

<br />

## Usage

If you installed and setup things correctly you should now see icons in the [supported plugins](#features)!

**Notes on include order:**
* for support of these plugins: [NERDTree], [vim-airline], [CtrlP][ctrlpvim-CtrlP], [powerline], [Denite], [unite], [vimfiler], [flagship] you **must** configure vim to load those plugins **_before_** vim-devicons loads.
* for better [nerdtree-git-plugin] support, you _should_ configure vim to load nerdtree-git-plugin **_before_** VimDevIcons loads.

[Lightline Setup](#lightline-setup) and [Powerline Setup](#powerline-setup) require some extra setup as shown below:


### Lightline Setup

To add the appropriate icon to [lightline](https://github.com/itchyny/lightline.vim), call the function `WebDevIconsGetFileTypeSymbol()` and/or `WebDevIconsGetFileFormatSymbol()` in your `.vimrc`. For example, you could set your sections to:

```vim
let g:lightline = {
      \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \ }
      \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
```

### Powerline Setup

* _Note this is for the current [Powerline][powerline] not the [deprecated vim-powerline](https://github.com/Lokaltog/vim-powerline)_

To enable for [Powerline][powerline] some `vimrc` and powerline configuration changes are needed:

`vimrc` changes (only required if you don't already have powerline setup for vim):

```vim
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
```

powerline configuration changes:

file type segment
```json
{
	"function": "vim_devicons.powerline.segments.webdevicons",
	"priority": 10,
	"draw_soft_divider": false,
	"after": "  "
}
```

file format segment
```json
{
	"function": "vim_devicons.powerline.segments.webdevicons_file_format",
	"draw_soft_divider": false,
	"exclude_modes": ["nc"],
	"priority": 90
 }
```

for full example see [sample file](https://github.com/ryanoasis/vim-devicons/wiki/samples/v0.10.x/powerline/themes/vim/default.json)

Detailed Features
-----------------

* Adds filetype glyphs (icons) to various vim plugins, currently supports:
  * [NERDTree][]
      * Using the version hosted on [vimscripts](http://www.vim.org/scripts/script.php?script_id=1658) in favor of GitHub will lead to a outdated message, and icons will fail to show.
  * [vim-airline][] (statusline and tabline)
  * [CtrlP][ctrlpvim-CtrlP] (All modes now supported)
      * Using the version hosted on [vimscripts](http://www.vim.org/scripts/script.php?script_id=3736) in favor of GitHub will lead to a outdated message, and icons will fail to show.
  * [powerline][] (statusline)
    * see: [powerline setup](#powerline-setup)
  * [Denite]
    * Currently supports `file_rec`, `file_old`, `buffer`, and `directory_rec`
  * [unite]
    * Currently supports `file`, `file_rec`, `buffer`, `file_rec/async`, and `file_rec/neovim`
  * [lightline.vim][] (statusline)
    * see: [lightline setup](#lightline-setup)
  * [vim-startify]
  * [vimfiler]
  * [flagship]
    * Support is **experimental** because the [API may be changing](https://github.com/tpope/vim-flagship/issues/6#issuecomment-116121220)
* Supports byte order marker (BOM)
* Customizable and extendable glyphs (icons) settings
  * ability to override defaults and use your own characters or glyphs
* Supports a wide range of file type extensions by default:
  * ```styl, sass, scss, htm, html, slim, ejs, css, less, md, rmd, json, js, jsx, rb, php, py, pyc, pyd, pyo, coffee, mustache, hbs, conf, ini, yml, yaml, bat, jpg, jpeg, bmp, png, gif, twig, cpp, c++, cxx, cc, cp, c, h, hpp, hxx, hs, lhs, lua, java, sh, bash, zsh, ksh, csh, awk, ps1, fish, diff, db, clj, cljs, edn, scala, go, dart, xul, sln, suo, pl, pm, t, rss, f#, fsscript, fsx, fs, fsi, rs, rlib, d, erl, hrl, vim, ai, psd, psb, ts, jl, pp```
* Supports a few full filename matches, by default:
  * ```gruntfile.coffee, gruntfile.js, gruntfile.ls, gulpfile.coffee, gulpfile.js, gulpfile.ls, dropbox, .ds_store, .gitconfig, .gitignore, .bashrc, .zshrc, .vimrc, .bashprofile, favicon.ico, license, node_modules, react.jsx, procfile```
* Supports a few library pattern matches, by default:
  * ```jquery, angular, backbone, requirejs, materialize, mootools, Vagrantfile```
* Works with patched fonts, especially [Nerd Fonts]


Extra Configuration
-------------------

* These options can be defined in your `vimrc` or `gvimrc`
* Most options are enabled **`1`** by default but can be disabled with **`0`**
* You *should* **not** need to configure anything, however, the following options are provided for customizing or changing the defaults:

```vim
" loading the plugin
let g:webdevicons_enable = 1
```

```vim
" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree = 1
```

```vim
" adding the custom source to unite
let g:webdevicons_enable_unite = 1
```

```vim
" adding the column to vimfiler
let g:webdevicons_enable_vimfiler = 1
```

```vim
" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1
```

```vim
" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1
```

```vim
" ctrlp glyphs
let g:webdevicons_enable_ctrlp = 1
```

```vim
" adding to flagship's statusline
let g:webdevicons_enable_flagship_statusline = 1
```

```vim
" turn on/off file node glyph decorations (not particularly useful)
let g:WebDevIconsUnicodeDecorateFileNodes = 1
```

```vim
" use double-width(1) or single-width(0) glyphs
" only manipulates padding, has no effect on terminal or set(guifont) font
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
```

```vim
" whether or not to show the nerdtree brackets around flags
let g:webdevicons_conceal_nerdtree_brackets = 1
```

```vim
" the amount of space to use after the glyph character (default ' ')
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
```

```vim
" Force extra padding in NERDTree so that the filetype icons line up vertically
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
```

```vim
" Adding the custom source to denite
let g:webdevicons_enable_denite = 1
```

### Character Mappings

* `ƛ` is used as an example below, substitute for the glyph you **actually** want to use

```vim
" change the default character when no match found
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = 'ƛ'
```

```vim
" set a byte character marker (BOM) utf-8 symbol when retrieving file encoding
" disabled by default with no value
let g:WebDevIconsUnicodeByteOrderMarkerDefaultSymbol = ''
```

```vim
" enable folder/directory glyph flag (disabled by default with 0)
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
```

```vim
" enable open and close folder/directory glyph flags (disabled by default with 0)
let g:DevIconsEnableFoldersOpenClose = 1
```

```vim
" enable pattern matching glyphs on folder/directory (enabled by default with 1)
let g:DevIconsEnableFolderPatternMatching = 1
```

```vim
" enable file extension pattern matching glyphs on folder/directory (disabled by default with 0)
let g:DevIconsEnableFolderExtensionPatternMatching = 0
```

```vim
" enable custom folder/directory glyph exact matching
" (enabled by default when g:WebDevIconsUnicodeDecorateFolderNodes is set to 1)
let WebDevIconsUnicodeDecorateFolderNodesExactMatches = 1
```

```vim
" change the default folder/directory glyph/icon
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = 'ƛ'
```

```vim
" change the default open folder/directory glyph/icon (default is '')
let g:DevIconsDefaultFolderOpenSymbol = 'ƛ'
```

```vim
" change the default dictionary mappings for file extension matches

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = 'ƛ'
```

```vim
" change the default dictionary mappings for exact file node matches

let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['MyReallyCoolFile.okay'] = 'ƛ'
```

```vim
" add or override individual additional filetypes

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['myext'] = 'ƛ'
```

```vim
" add or override pattern matches for filetypes
" these take precedence over the file extensions

let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*jquery.*\.js$'] = 'ƛ'
```

> specify OS to decide an icon for unix fileformat (_not_ defined by default)
  - this is useful for avoiding unnecessary `system()` call. see [#135](https://github.com/ryanoasis/vim-devicons/pull/135) for  further details.

```vim
let g:WebDevIconsOS = 'Darwin'
```


Public Methods
--------------

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


Developer
---------

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

#### API Examples

##### Simple function call

```vim
echo WebDevIconsGetFileFormatSymbol()
```

##### [vim-startify]

```vim
let entry_format = "'   ['. index .']'. repeat(' ', (3 - strlen(index)))"

if exists('*WebDevIconsGetFileTypeSymbol')  " support for vim-devicons
  let entry_format .= ". WebDevIconsGetFileTypeSymbol(entry_path) .' '.  entry_path"
else
  let entry_format .= '. entry_path'
endif
```

##### Custom status line

> Custom vim status line (not relying on vim-airline or lightline):

```vim
:set statusline=%f\ %{WebDevIconsGetFileTypeSymbol()}\ %h%w%m%r\ %=%(%l,%c%V\ %Y\ %=\ %P%)
```

Todo
----

* [ ] more filetypes to support
* [ ] [customize filetype icon colors](https://github.com/ryanoasis/vim-devicons/issues/158) (for a current solution see: [tiagofumo/vim-nerdtree-syntax-highlight](https://github.com/tiagofumo/vim-nerdtree-syntax-highlight))
* [ ] more customization options in general
* [ ] more specific FAQ and Troubleshooting help


FAQ / Troubleshooting
---------------------

See [FAQ][wiki-faq]

## Screenshots

See [Screenshots][wiki-screenshots]

Contributing
------------

Best ways to contribute
* Star it on GitHub - if you use it and like it please at least star it :)
* [Promote](#promotion)
* Open [issues/tickets](https://github.com/ryanoasis/vim-devicons/issues)
* Submit fixes and/or improvements with [Pull Requests](#source-code)

### Promotion

Like the project? Please support to ensure continued development going forward:
* Star this repo on [GitHub][vim-devicons-repo]
* Follow the repo on [GitHub][vim-devicons-repo]
* Vote for it on [vim.org](http://www.vim.org/scripts/script.php?script_id=5114)
* Follow me
  * [Twitter](http://twitter.com/ryanlmcintyre)
  * [GitHub](https://github.com/ryanoasis)

### Source code

Contributions and Pull Requests are welcome.

No real formal process has been setup - just stick to general good conventions for now.

Rationale
---------

After seeing the awesome theme for Atom (seti-ui) and the awesome plugins work done for NERDTree and vim-airline and wanting something like this for Vim I decided to create my first plugin.

Inspiration and special thanks
------------------------------

* [vim-airline]
* [nerdtree]
* [nerdtree-git-plugin]
* [seti-ui](https://atom.io/themes/seti-ui)
* [devicons by Theodore Vorillas](http://vorillaz.github.io/devicons)
* [benatespina development.svg.icons](https://github.com/benatespina/development.svg.icons)
* [Steve Losh](http://learnvimscriptthehardway.stevelosh.com/)
* Also thanks to the many [contributors](https://github.com/ryanoasis/vim-devicons/graphs/contributors)

License
-------

See [LICENSE](LICENSE)

<!---
Link References
-->

[Nerd Fonts]:https://github.com/ryanoasis/nerd-fonts
[Nerd Font]:https://github.com/ryanoasis/nerd-fonts
[font-installation]:https://github.com/ryanoasis/nerd-fonts#font-installation
[nerd-fonts-patcher]:https://github.com/ryanoasis/nerd-fonts#font-patcher
[patched-fonts]:https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts
[NERDTree]:https://github.com/scrooloose/nerdtree
[vim-airline]:https://github.com/vim-airline/vim-airline
[lightline.vim]:https://github.com/itchyny/lightline.vim
[lightline]:https://github.com/itchyny/lightline.vim
[nerdtree-git-plugin]:https://github.com/Xuyuanp/nerdtree-git-plugin
[Denite]:https://github.com/Shougo/denite.nvim
[unite]:https://github.com/Shougo/unite.vim
[unite.vim]:https://github.com/Shougo/unite.vim
[vimfiler]:https://github.com/Shougo/vimfiler.vim
[flagship]:https://github.com/tpope/vim-flagship
[CtrlP]:https://github.com/kien/ctrlp.vim
[ctrlpvim-CtrlP]:https://github.com/ctrlpvim/ctrlp.vim
[powerline]:https://github.com/powerline/powerline
[vim-startify]:https://github.com/mhinz/vim-startify
[vim-workspace]:https://github.com/bagrat/vim-workspace

[wiki-screenshots]:https://github.com/ryanoasis/vim-devicons/wiki/Screenshots
[wiki-faq]:https://github.com/ryanoasis/vim-devicons/wiki/FAQ-&-Troubleshooting

[vim-devicons-repo]:https://github.com/ryanoasis/vim-devicons
[vim-devicons-polls]:https://github.com/ryanoasis/vim-devicons/labels/poll
[badge-version]:http://badge.fury.io/gh/ryanoasis%2Fvim-devicons
[gitter]:https://gitter.im/ryanoasis/vim-devicons?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge "Join the chat at https://gitter.im/ryanoasis/vim-devicons (external link) ➶"

[coc]:https://github.com/ryanoasis/vim-devicons/blob/master/code_of_conduct.md "Contributor Covenant Code of Conduct"
[prs]:http://makeapullrequest.com "Make a Pull Request (external link) ➶"
[code-climate]:https://codeclimate.com/github/ryanoasis/vim-devicons "Code Climate VimDevIcons (external link) ➶"
[code-climate-issues]:https://codeclimate.com/github/ryanoasis/vim-devicons "Code Climate Issues for VimDevIcons (external link) ➶"

[img-version-badge]:https://img.shields.io/github/release/ryanoasis/vim-devicons.svg?style=for-the-badge
[img-gitter-badge]:https://img.shields.io/gitter/room/nwjs/nw.js.svg?style=for-the-badge
[img-code-climate-badge]:https://img.shields.io/codeclimate/github/ryanoasis/vim-devicons.svg?style=for-the-badge
[img-code-climate-issues-badge]:https://img.shields.io/codeclimate/issues/github/ryanoasis/vim-devicons.svg?style=for-the-badge
[img-coc-badge]: https://img.shields.io/badge/code%20of-conduct-ff69b4.svg?style=for-the-badge
[img-prs-badge]: https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=for-the-badge&logo=data%3Aimage%2Fpng%3Bbase64%2CiVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAACWFBMVEXXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWkrXWko2FeWCAAAAAXRSTlMAQObYZgAAAAFiS0dEAIgFHUgAAAAJcEhZcwAAI28AACNvATX8B%2FsAAAAHdElNRQfhBQMBMCLAfV85AAAAi0lEQVQ4y2NgIBYszkPmJc5ORZE9DgEJqNxmmPS%2B43AA4h5B5TIwbD5%2BHFnoKCoXYSBMBIW7CF0eAxChoPM4ARXHB4GCZEIKKA8H%2FCoWE1LAwIBfBVp6wQA1DPhVzMJMcyggCVuqxGI%2FLhWY6Z6QPKoK7HmHkDwDwxYC8gwMdSDprXiz6PHjpQxUBgCLDfI7GXNh5gAAAABJRU5ErkJggg%3D%3D
[img-visual-toc-screenshots]:https://github.com/ryanoasis/vim-devicons/wiki/screenshots/v1.0.0/branding-logo-screenshots-sm.png
[img-visual-toc-api]:https://github.com/ryanoasis/vim-devicons/wiki/screenshots/v1.0.0/branding-logo-api-sm.png
[img-visual-toc-patched-fonts]:https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/images/nerd-fonts-character-logo-md.png
[img-visual-toc-fonts-patcher]:https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/images/nerd-fonts-patcher-logo-md.png
