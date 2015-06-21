vim-webdevicons
=======================
[![GitHub version](https://badge.fury.io/gh/ryanoasis%2Fvim-webdevicons.svg)][badge-version] [![Join the chat at https://gitter.im/ryanoasis/vim-webdevicons](https://img.shields.io/badge/%E2%8A%AA%20GITTER%20-CHAT%20%E2%86%92-1dce73.svg?style=flat)][badge-gitter] [![Flattr this git repo](https://img.shields.io/badge/donate-flattr%20this!-8DB65B.svg?style=flat)][badge-flattr]

Adds filetype glyphs (icons) to other vim plugins such as [NERDTree], [vim-airline], and [lightline.vim].

[» Vote for upcoming features or suggest new ones](#vote)

![image](https://github.com/ryanoasis/vim-webdevicons/wiki/screenshots/v0.4.3/overall-screenshot.png)


<!---
Start temporary poll section
-->
<a name="vote"></a>

 _Current open polls: Vote for upcoming features or suggest new ones:_  | [vote](https://github.com/ryanoasis/vim-webdevicons/labels/poll)
------------------------------------------------------------------------- | :-----:
» [Rename project: vim-webdevicons to vim-devicons?](https://github.com/ryanoasis/vim-webdevicons/issues/64) | [☑](http://poll.gitrun.com/ryanoasis/vim-webdevicons/issues/64)
» [support ctrlp.vim?](https://github.com/ryanoasis/vim-webdevicons/issues/56) | [☑](http://poll.gitrun.com/ryanoasis/vim-webdevicons/issues/56)
» [support unite.vim?](https://github.com/ryanoasis/vim-webdevicons/issues/54) | [☑](http://poll.gitrun.com/ryanoasis/vim-webdevicons/issues/54)
» [Something else? (Open an issue)](https://github.com/ryanoasis/vim-webdevicons/labels/poll) | [☑](https://github.com/ryanoasis/vim-webdevicons/labels/poll)

<!---
End temporary poll section
-->

## Table of Contents

- [vim-webdevicons v0.4.3](#)
	- [Quick Setup (TL;DR)](#quick-setup)
	- [Usage](#usage)
	- [Font Configuration](#font-configuration)
	- [Font Installation](#font-installation)
	- [Screenshots](#screenshots)
	- [Features](#features)
	- [Extra Configuration](#extra-configuration)
		- [character mappings](#character-mappings)
	- [Installation](#installation)
	- [Lightline](#lightline.vim)
	- [Todo](#todo)
	- [FAQ / Troubleshooting](#faq--troubleshooting)
	- [Contributing](#contributing)
	- [Rationale](#rationale)
	- [Inspiration and special thanks](#inspiration-and-special-thanks)
	- [License](#license)


<a name="quick-setup"></a>
## Quick Setup (TL;DR)

1. Install the plugin per your usual method  _[(» More details... «)](#installation)_
2. Download and install a patched font (or patch your own):
  * [nerd-filetype-glyphs-fonts-patcher]  _[(» More details... «)](#font-installation)_
3. Set font  _[(» More details... «)](#font-configuration)_
  * a. If using **vim**: Set your terminal emulator font
  * b. If using **gvim**: Set `guifont` in your `vimrc`

## Usage

After installing the patched font and setting the vim font just open [NERDTree]
or look at [airline][vim-airline] (statusline or tabline).

* _NOTE:_ if you don't `guifont` set and are not running gvim you will need to set the terminal font.

* _NOTE:_ for [NERDTree] support, you **must** configure vim to load NERDTree **_before_** vim-webdevicons loads.

* _NOTE:_ for [vim-airline] support, you **must** configure vim to load vim-airline **_before_** vim-webdevicons loads.

* _NOTE:_ for better [nerdtree-git-plugin] support, you _should_ configure vim to load nerdtree-git-plugin **_before_** vim-webdevicons loads.

## Font Configuration

* Encoding **must** be set to UTF-8 for the glyphs to show
  ```vim
  set encoding=utf8
  ```

* The _ONLY_ other configuration needed should be setting the font vim uses to a
  patched font.

Already patched fonts and the font patcher script are provided at:
[nerd-filetype-glyphs-fonts-patcher]

It works without configuration *ONLY* when used with a patched font provided in
the separate repository above. Install the font and add it to your `vimrc` or
`gvimrc`:

Linux
 ```vim
 set guifont=<FONT_NAME> <FONT_SIZE>
 ```

OS X and Windows
 ```vim
 set guifont=<FONT_NAME>:h<FONT_SIZE>
 ```

e.g.

Linux
```vim
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11
```

OS X and Windows
```vim
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11
```

## Font Installation

You basically have to put any font you would like to use into the `~/.fonts` folder. For example:


```sh
cd ~/.fonts && curl -fLo DroidSansMonoForPowerlinePlusNerdFileTypes.otf https://raw.githubusercontent.com/ryanoasis/nerd-filetype-glyphs-fonts-patcher/master/patched-fonts/Droid%20Sans%20Mono%20for%20Powerline%20Plus%20Nerd%20File%20Types.otf
```


You can find more fonts under my [patched fonts repo][font-nerd-icons-patched-fonts].


## Screenshots

![image](https://raw.githubusercontent.com/wiki/ryanoasis/vim-webdevicons/screenshots/v0.4.3/vim.png)

### [NERDTree]

![image](https://raw.githubusercontent.com/wiki/ryanoasis/vim-webdevicons/screenshots/v0.4.3/nerdtree.png)

### [vim-airline]

section             | preview
------------------- | -------------
statusline          | ![image](https://raw.githubusercontent.com/wiki/ryanoasis/vim-webdevicons/screenshots/v0.4.3/airline-statusline.png)
tabline             | ![image](https://raw.githubusercontent.com/wiki/ryanoasis/vim-webdevicons/screenshots/v0.4.3/airline-tabline-1.png)
tabline             | ![image](https://raw.githubusercontent.com/wiki/ryanoasis/vim-webdevicons/screenshots/v0.4.3/airline-tabline-2.png)
fileformats symbols | ![image](https://raw.githubusercontent.com/wiki/ryanoasis/vim-webdevicons/screenshots/v0.4.3/fileformats-symbols-sample.png)

### Different patched fonts example

![image](https://raw.githubusercontent.com/wiki/ryanoasis/vim-webdevicons/screenshots/v0.4.3/different-fonts-sample.png)

### [lightline.vim][lightline.vim]

![image](https://github.com/ryanoasis/vim-webdevicons/wiki/screenshots/v0.4.3/lightline.png)

### [nerdtree-git-plugin]

![image](https://github.com/ryanoasis/vim-webdevicons/wiki/screenshots/v0.4.3/nerdtree-git-plugin-sample.png)

### Various Terminal Emulators

* gnome terminal

![image](https://github.com/ryanoasis/vim-webdevicons/wiki/screenshots/v0.4.3/terminal-gnome-sample.png)

* Urxvt terminal

![image](https://github.com/ryanoasis/vim-webdevicons/wiki/screenshots/v0.4.3/terminal-urxvt-sample.png)

### Windows

![image](https://github.com/ryanoasis/vim-webdevicons/wiki/screenshots/v0.4.3/windows-sample.png)

### Mac OS X

**Help wanted: https://github.com/ryanoasis/vim-webdevicons/issues/32**

### Glyph set test file

![image](https://github.com/ryanoasis/vim-webdevicons/wiki/screenshots/v0.4.3/glyph-set-test.png)

## Features
* show developer file type glyphs from a font in various vim plugins, currently supports:
  * [NERDTree]
  * [vim-airline][vim-airline] (statusline and tabline)
  * [lightline.vim][lightline.vim] (statusline)
    * see: [lightline](#lightline) for setup
* Adds a global config map of characters to file extensions (or entire filenames)
* customizable and extendable filetype detections
  * ability to override predefined dictionary variable
  * if you are unhappy with the default glyph used you can choose your own
* supports a range of file type extensions by default:
  * ```styl, scss, htm, html, css, less, md, json, js, rb, php, py, pyc, pyd, pyo, coffee, mustache, hbs, conf, ini, yml, jpg, jpeg, bmp, png, gif, ai, twig, cpp, c++, cc, cp, cxx, cpp, c, hs, lhs, lua, sh, diff, clj, dart, db, go, scala, sln, suo, xul```
* supports full filename matches, by default:
  * ```gruntfile.coffee, gruntfile.js, gruntfile.ls, gulpfile.coffee, gulpfile.js, gulpfile.ls, dropbox```
* font patcher ([nerd-filetype-glyphs-fonts-patcher])
  * requires: python2, python-fontforge package
  * example usage
	> ./font-patcher unpatched-sample-fonts/Droid\ Sans\ Mono\ for\ Powerline.otf

## Extra Configuration

* by default you should not *NEED* to configure anything to get the basics working
  * _NOTE:_ You *NEED* to use one of the patched font provided or patch your own ([nerd-filetype-glyphs-fonts-patcher]) _unless_ you want to configure the filetype to glyph mappings yourself for your current font
* these options can be defined in your `vimrc` or `gvimrc`
* the following options are provided however for overriding

* enable/disable loading the plugin (default 1)
 ```vim
let g:webdevicons_enable = 1
 ```

* enable/disable adding the flags to NERDTree (default 1)
 ```vim
 let g:webdevicons_enable_nerdtree = 1
  ```

* enable/disable adding to vim-airline's tabline (default 1)
 ```vim
let g:webdevicons_enable_airline_tabline = 1
  ```

* enable/disable adding to vim-airline's statusline (default 1)
 ```vim
let g:webdevicons_enable_airline_statusline = 1
  ```

* turn on/off file node glyph decorations (not particularly useful)
 ```vim
let g:WebDevIconsUnicodeDecorateFileNodes = 1
  ```

* whether or not font is using double-width glyphs (default 1, set to 0 for single character width glyphs)
	* _note:_ does not actually switch the font or try to use the correct font, just adds a space to account for a double width glyph, you have to set the correct double width glyph font in your terminal or `guifont`
 ```vim
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
  ```

* whether or not to show the nerdtree brackets around flags (default 1)
```vim
let g:webdevicons_conceal_nerdtree_brackets = 1
```

* the amount of space to use after the glyph character (default ' ')
```vim
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
```

### character mappings

* `ƛ` is used as an example below, substitute for the glyph you **actually** want to use

* change the default character when no match found
 ```vim
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = 'ƛ'
  ```

* enable folder/directory glyph flag (disabled by default with 0)
 ```vim
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
  ```

* enable custom folder/directory glyph exact matching (enabled by default when g:WebDevIconsUnicodeDecorateFolderNodes is set to 1)
 ```vim
let WebDevIconsUnicodeDecorateFolderNodesExactMatches = 1
  ```

* change the default folder/directory glyph/icon
 ```vim
let g:WebDevIconsUnicodeDecorateFolderNodeDefaultSymbol = 'ƛ'
  ```

* change the default dictionary mappings for file extension matches
 ```vim
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = 'ƛ'
  ```

* change the default dictionary mappings for exact file node matches
 ```vim
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['MyReallyCoolFile.okay'] = 'ƛ'
  ```

* add or override individual additional filetypes
 ```vim
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['myext'] = 'ƛ'
  ```

## Installation

* [Sample Windows vimrc configuration 1](https://github.com/ryanoasis/vim-webdevicons/wiki/samples/v0.4.3/.vimrc-windows-1)
* [Sample Linux vimrc configuration 1](https://github.com/ryanoasis/vim-webdevicons/wiki/samples/v0.4.3/.vimrc-linux-1)

This plugin follows the standard runtime path structure, and as such it can be installed with a variety of plugin managers:

*  [Pathogen](https://github.com/tpope/vim-pathogen)
  *  `git clone https://github.com/ryanoasis/vim-webdevicons ~/.vim/bundle/vim-webdevicons`
*  [NeoBundle](https://github.com/Shougo/neobundle.vim)
  * Add to vimrc:

      ```vim
      NeoBundle 'ryanoasis/vim-webdevicons'
      ```
  * And install it:

      ```vim
      :so ~/.vimrc
      :NeoBundleInstall
      ```

*  [Vundle](https://github.com/gmarik/vundle)
  * Add to vimrc:

       ```vim
       Plugin 'ryanoasis/vim-webdevicons'
       ```
  * And install it:

       ```vim
       :so ~/.vimrc
       :PluginInstall`
       ```

*  manual
  *  copy all of the files into your `~/.vim` directory

## Lightline

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

## Todo

* [ ] more filetypes to support
* [x] ~~make sure it works properly and does not conflict with [nerdtree-git-plugin]~~
* [ ] customize filetype icon colors
* [ ] more customization options in general
* [ ] more specific FAQ and Troubleshooting help

## FAQ / Troubleshooting

* I don't want to use any of the fonts provided, I want to use font ABC
 * try the font patcher: [nerd-filetype-glyphs-fonts-patcher]
 * see font configuration above for more details

* It isn't working
  * Are you using the patched font provided in the separate repo ([nerd-filetype-glyphs-fonts-patcher]) or are you patching your own?
  * _NOTE:_ if running vim and no font set it will default to the terminal font that is set
  * check what the vim/gvim font is set to, from ex mode:

    ```vim
    :set guifont?
    ```

  * check if the plugin is loaded (should give '1'), from ex mode:

    ```vim
    :echo loaded_webdevicons
    ```

  * check if the plugin is enabled (should give '1'), from ex mode:

    ```vim
    :echo g:webdevicons_enable
    ```

  * check if the plugin is enabled for NERDTree (should give '1'), from ex mode:
    * this should *NOT* need to be set under normal circumstances

    ```vim
    :echo g:webdevicons_enable_nerdtree
    ```

  * check if you are able to see the characters, from ex mode:

    ```vim
    :echo g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol
    ```

  * if all this looks correct you may try this to see if any files show flags
    * last resort, see if you can even set the default symbol and have it display anywhere (NERDTree, vim-airline's statusline, vim-airlines's tabline), from ex mode:

    ```vim
    :let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol='x'
    ```

* How did you get color matching based on file type in nerdtree?
  * my current settings are from: https://github.com/scrooloose/nerdtree/issues/201#issuecomment-9954740

	```vim
	" NERDTress File highlighting
	function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
	 exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
	 exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
	endfunction

	call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
	call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
	call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
	call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
	call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
	call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
	call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
	call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
	call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
	call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
	call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
	call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
	call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
	```
	Note: If the colors still are not highlighting, try invoking such as:
	```
	autocmd VimEnter * call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
	```
	per: https://github.com/ryanoasis/vim-webdevicons/issues/49#issuecomment-101753558

## Contributing

Best ways to contribute
* Star it on GitHub - if you use it and like it please at least star it :)
* [Promote](#promotion)
* Open [issues/tickets](https://github.com/ryanoasis/vim-webdevicons/issues)
* Submit fixes and/or improvements with [Pull Requests](#source-code)

### Promotion

Like the project? Please support to ensure continued development going forward:
* Star this repo on [GitHub][vim-webdevicons-repo]
* Follow the repo on [GitHub][vim-webdevicons-repo]
* Vote for it on [vim.org](http://www.vim.org/scripts/script.php?script_id=5114)
* Follow me
  * [Twitter](http://twitter.com/ryanlmcintyre)
  * [GitHub](https://github.com/ryanoasis)

### Source code

Contributions and pull requests are welcome.

No real formal process has been setup - just stick to general good conventions
for now.

## Rationale

After seeing the awesome theme for Atom (seti-ui) and the awesome plugins work done for NERDTree and vim-airline and wanting something like this for Vim I decided to create my first plugin.

## Inspiration and special thanks

* [vim-airline]
* [nerdtree]
* [nerdtree-git-plugin]
* [seti-ui](https://atom.io/themes/seti-ui)
* [devicons by Theodore Vorillas](http://vorillaz.github.io/devicons)
* [benatespina development.svg.icons](https://github.com/benatespina/development.svg.icons)
* [Steve Losh](http://learnvimscriptthehardway.stevelosh.com/)

### Also thanks to the many contributors:
* [contributors list](https://github.com/ryanoasis/vim-webdevicons/graphs/contributors)

## License

See [LICENSE](LICENSE)

<!---
Link References
-->

[nerd-filetype-glyphs-fonts-patcher]:https://github.com/ryanoasis/nerd-filetype-glyphs-fonts-patcher
[font-nerd-icons-patched-fonts]:https://github.com/ryanoasis/nerd-filetype-glyphs-fonts-patcher/tree/master/patched-fonts
[NERDTree]:https://github.com/scrooloose/nerdtree
[vim-airline]:https://github.com/bling/vim-airline
[lightline.vim]:https://github.com/itchyny/lightline.vim
[lightline]:https://github.com/itchyny/lightline.vim
[nerdtree-git-plugin]:https://github.com/Xuyuanp/nerdtree-git-plugin

[vim-webdevicons-repo]:https://github.com/ryanoasis/vim-webdevicons
[badge-version]:http://badge.fury.io/gh/ryanoasis%2Fvim-webdevicons
[badge-gitter]:https://gitter.im/ryanoasis/vim-webdevicons?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge
[badge-flattr]:https://flattr.com/submit/auto?user_id=ryanoasis&url=https://github.com/ryanoasis/vim-webdevicons&title=vim-webdevicons&language=viml&tags=github&category=software
