vim-webdevicons v0.4.1 [![GitHub version](https://badge.fury.io/gh/ryanoasis%2Fvim-webdevicons.svg)](http://badge.fury.io/gh/ryanoasis%2Fvim-webdevicons)
=======================
Adds filetype glyphs (icons) to other vim plugins such as [nerdtree](https://github.com/scrooloose/nerdtree) and
[vim-airline](https://github.com/bling/vim-airline), and [lightline.vim](https://github.com/itchyny/lightline.vim)
![image](https://github.com/ryanoasis/vim-webdevicons/wiki/screenshots/v0.4.1/overall-screenshot.png)

- [vim-webdevicons v0.4.1](#)
	- [Usage](#usage)
	- [Quick Setup (TL;DR)](#quick-setup)
	- [Font Configuration](#font-configuration)
	- [Font Installation](#font-installation)
	- [Screenshots](#screenshots)
	- [Features](#features)
	- [Extra Configuration](#extra-configuration)
		- [character mappings](#character-mappings)
	- [Installation](#installation)
	- [Lightline](#lightline)
	- [Todo](#todo)
	- [FAQ / Troubleshooting](#faq--troubleshooting)
	- [Contributing](#contributing)
	- [Rationale](#rationale)
	- [Inspiration and special thanks](#inspiration-and-special-thanks)
	- [License](#license)

## Usage

After installing the patched font and setting the vim font just open nerdtree
or look at vim-airline (statusline or tabline).

* _NOTE:_ if you don't have a vim font set and are not running gvim you will
  need to set the terminal font.

* _NOTE:_ for NERDTree support, you must configure vim to load NERDTree _before_ vim-webdevicons loads.


## <a name="quick-setup"></a>Quick Setup (TL;DR)

1. Install the plugin per your usual method _[More details](#installation)_
2. Download and install a patched font (or patch your own) from: [ryanoasis/nerd-filetype-glyphs-fonts-patcher]( https://github.com/ryanoasis/nerd-filetype-glyphs-fonts-patcher) _[More details](#font-installation)_
3. Set terminal font (if using `vim`) or set `guifont` in `vimrc` (if using `gvim`) _[More details](#font-configuration)_

## Font Configuration

* The _ONLY_ configuration needed should be setting the font vim uses to a
  patched font.

Already patched fonts and the font patcher script are provided at:
[nerd-filetype-glyphs-fonts-patcher](https://github.com/ryanoasis/nerd-filetype-glyphs-fonts-patcher)

It works without configuration *ONLY* when used with a patched font provided in
the separate repository above. Install the font and add it to your `vimrc` or
`gvimrc`:

 ```vim
 set guifont=<FONT_NAME> <FONT_SIZE>
 ```

e.g.

```vim
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11
```

## Font Installation

You basically have to put any font you would like to use into the `~/.fonts` folder. For example:


```sh
cd ~/.fonts && curl -fLo DroidSansMonoForPowerlinePlusNerdFileTypes.otf https://raw.githubusercontent.com/ryanoasis/nerd-filetype-glyphs-fonts-patcher/master/patched-fonts/Droid%20Sans%20Mono%20for%20Powerline%20Plus%20Nerd%20File%20Types.otf
```


You can find more fonts under my repository [nerd-filetype-glyphs-fonts-patcher](https://github.com/ryanoasis/nerd-filetype-glyphs-fonts-patcher/tree/master/patched-fonts).


## Screenshots

![image](https://raw.githubusercontent.com/wiki/ryanoasis/vim-webdevicons/screenshots/v0.4.1/vim.png)

* NERDTree:

![image](https://raw.githubusercontent.com/wiki/ryanoasis/vim-webdevicons/screenshots/v0.4.1/nerdtree.png)

* vim-airline
 * statusline
   ![image](https://raw.githubusercontent.com/wiki/ryanoasis/vim-webdevicons/screenshots/v0.4.1/airline-statusline.png)
 * tabline
  ![image](https://raw.githubusercontent.com/wiki/ryanoasis/vim-webdevicons/screenshots/v0.4.1/airline-tabline.png)

* Different patched fonts example:

![image](https://raw.githubusercontent.com/wiki/ryanoasis/vim-webdevicons/screenshots/v0.4.1/different-fonts-sample.png)

* Glyph set test file

![image](https://github.com/ryanoasis/vim-webdevicons/wiki/screenshots/v0.4.1/glyph-set-test.png)

* Lightline:

![image](https://github.com/ryanoasis/vim-webdevicons/wiki/screenshots/v0.4.1/lightline.png)

### Various Terminal Emulators

* gnome terminal

![image](https://github.com/ryanoasis/vim-webdevicons/wiki/screenshots/v0.4.1/terminal-gnome-sample.png)

* Urxvt terminal

![image](https://github.com/ryanoasis/vim-webdevicons/wiki/screenshots/v0.4.1/terminal-urxvt-sample.png)


## Features
* show developer file type glyphs from a font in various vim plugins, currently supports:
  * [NERDTree](https://github.com/scrooloose/nerdtree)
  * [vim-airline](https://github.com/bling/vim-airline) (statusline and tabline)
  * [lightline.vim](https://github.com/itchyny/lightline.vim) (statusline)
    * see: [Lightline](#lightline) for setup
* Adds a global config map of characters to file extensions (or entire filenames)
* customizable and extendable filetype detections
  * ability to override predefined dictionary variable
  * if you are unhappy with the default glyph used you can choose your own
* supports a range of file type extensions by default:
  * ```styl, scss, htm, html, css, less, md, json, js, rb, php, py, pyc, pyd, pyo, coffee, mustache, hbs, conf, ini, yml, jpg, jpeg, bmp, png, gif, ai, twig, cpp, c++, cc, cp, cxx, cpp, c, hs, lhs, lua, sh, diff, clj, dart, db, go, scala, sln, suo, xul```
* supports full filename matches, by default:
  * ```gruntfile.coffee, gruntfile.js, gruntfile.ls, gulpfile.coffee, gulpfile.js, gulpfile.ls, dropbox```
* font patcher ([nerd-filetype-glyphs-fonts-patcher](https://github.com/ryanoasis/nerd-filetype-glyphs-fonts-patcher))
  * requires: python2, python-fontforge package
  * example usage
	> ./font-patcher unpatched-sample-fonts/Droid\ Sans\ Mono\ for\ Powerline.otf

## Extra Configuration

* by default you should not *NEED* to configure anything to get the basics working
  * _NOTE:_ You *NEED* to use one of the patched font provided or patch your own ([nerd-filetype-glyphs-fonts-patcher](https://github.com/ryanoasis/nerd-filetype-glyphs-fonts-patcher)) _unless_ you want to configure the filetype to glyph mappings yourself for your current font
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

To add the appropriate icon to [lightline](https://github.com/itchyny/lightline.vim), call the function `WebDevIconsGetFileTypeSymbol()` in your `.vimrc`. For example, you might set your filetype section to:

```vim
let g:lightline = {
      \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \ }
      \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction
```

## Todo

* [ ] more filetypes to support
* [ ] make sure it works properly and does not conflict with [nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin)
* [ ] customize filetype icon colors
* [ ] more customization options in general

## FAQ / Troubleshooting

* I don't want to use any of the fonts provided, I want to use font ABC
 * try the font patcher: [nerd-filetype-glyphs-fonts-patcher](https://github.com/ryanoasis/nerd-filetype-glyphs-fonts-patcher)
 * see font configuration above for more details

* It isn't working
  * Are you using the patched font provided in the separate repo ([nerd-filetype-glyphs-fonts-patcher](https://github.com/ryanoasis/nerd-filetype-glyphs-fonts-patcher)) or are you patching your own?
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
  * my current settings added on orignally from: https://github.com/scrooloose/nerdtree/issues/201#issuecomment-9954740

	```vim
	" NERDTress File highlighting
	function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
	 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
	 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
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

* @todo: more specific FAQ and Troubleshooting help

## Contributing

Contributions and pull requests are welcome.

No real formal process has been setup - just stick to general good conventions
for now.

## Rationale

After seeing the awesome theme for Atom (seti-ui) and the awesome plugins work done for NERDTree and vim-airline and wanting something like this for Vim I decided to create my first plugin.

## Inspiration and special thanks

* [vim-airline](https://github.com/bling/vim-airline)
* [nerdtree](https://github.com/scrooloose/nerdtree)
* [nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin)
* [seti-ui](https://atom.io/themes/seti-ui)
* [devicons by Theodore Vorillas](http://vorillaz.github.io/devicons)
* [benatespina development.svg.icons](https://github.com/benatespina/development.svg.icons)
* [Steve Losh](http://learnvimscriptthehardway.stevelosh.com/)

## License

see [LICENSE](LICENSE)
