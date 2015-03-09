vim-webdevicons v0.3.4
=======================
[![GitHub version](https://badge.fury.io/gh/ryanoasis%2Fvim-webdevicons.svg)](http://badge.fury.io/gh/ryanoasis%2Fvim-webdevicons)
=======================

Adds filetype glyphs (icons) to other vim plugins such as nerdtree and
vim-airline.

![image](https://github.com/ryanoasis/vim-webdevicons/wiki/screenshots/v0.3.4/overall-screenshot.png)

- [vim-webdevicons v0.3.4](#)
	- [Usage](#usage)
	- [Font Configuration](#font-configuration)
	- [Font Installation](#font-installation)
	- [Screenshots](#screenshots)
	- [Features](#features)
	- [Extra Configuration](#extra-configuration)
		- [character mappings](#character-mappings)
	- [Installation](#installation)
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

## Font Configuration

* The _ONLY_ configuration needed should be setting the font vim uses to a
  patched font.

Already patched fonts and the font patcher script are provided at:
[nerd-filetype-glyphs-fonts-patcher](https://github.com/ryanoasis/nerd-filetype-glyphs-fonts-patcher)

It works without configuration *ONLY* when used with a patched font provided in
the separate repository above. Install the font and add it to your vimrc or
gvimrc:

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

![image](https://raw.githubusercontent.com/wiki/ryanoasis/vim-webdevicons/screenshots/v0.3.4/vim.png)

* NERDTree:

![image](https://raw.githubusercontent.com/wiki/ryanoasis/vim-webdevicons/screenshots/v0.3.4/nerdtree.png)

* vim-airline
 * statusline
   ![image](https://raw.githubusercontent.com/wiki/ryanoasis/vim-webdevicons/screenshots/v0.3.4/airline-statusline.png)
 * tabline
  ![image](https://raw.githubusercontent.com/wiki/ryanoasis/vim-webdevicons/screenshots/v0.3.4/airline-tabline.png)

* Different patched fonts example:

![image](https://raw.githubusercontent.com/wiki/ryanoasis/vim-webdevicons/screenshots/v0.3.4/different-fonts-sample.png)

* Glyph set test file

![image](https://github.com/ryanoasis/vim-webdevicons/wiki/screenshots/v0.3.4/glyph-set-test.png)

### Various Terminal Emulators

* gnome terminal

![image](https://github.com/ryanoasis/vim-webdevicons/wiki/screenshots/v0.3.4/terminal-gnome-sample.png)

* Urxvt terminal

![image](https://github.com/ryanoasis/vim-webdevicons/wiki/screenshots/v0.3.4/terminal-urxvt-sample.png)


## Features
* show developer file type glyphs from a font in various vim plugins, currently supports:
  * [NERDTree](https://github.com/scrooloose/nerdtree)
  * [vim-airline](https://github.com/bling/vim-airline) (statusline and tabline)
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
* these options can be defined in your vimrc or gvimrc
* the following options are provided however for overriding

* enable/disable loading the plugin (default 1)

 >	let g:webdevicons_enable = 1

* enable/disable adding the flags to NERDTree (default 1)

 >	let g:webdevicons_enable_nerdtree = 1

* enable/disable adding to vim-airline's tabline (default 1)

 >	let g:webdevicons_enable_airline_tabline = 1

* enable/disable adding to vim-airline's statusline (default 1)

 >	let g:webdevicons_enable_airline_statusline = 1

* turn on/off file node glyph decorations (not particularly useful)

 >	let g:WebDevIconsUnicodeDecorateFileNodes = 1

* whether or not font is using double-width glyphs (default 1, set to 0 for single character width glyphs)

 >	let g:WebDevIconsUnicodeGlyphDoubleWidth = 1

### character mappings

* change the default character when no match found

 >	let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = 'x'

* enable folder/directory glyph flag (disabled by default with 0)

 >	let g:WebDevIconsUnicodeDecorateFolderNodes = 1

* enable custom folder/directory glyph exact matching (enabled by default when g:WebDevIconsUnicodeDecorateFolderNodes is set to 1)

 >	let WebDevIconsUnicodeDecorateFolderNodesExactMatches = 1

* change the default folder/directory glyph/icon

 >	let g:WebDevIconsUnicodeDecorateFolderNodeDefaultSymbol = 'mycoolFolderGlyph'

* change the default dictionary mappings for file extension matches

 >	let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = 'mycoolJSfontglyph'

* change the default dictionary mappings for exact file node matches

 >	let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['MyReallyCoolFile.okay'] = 'myreallycoolglyph'

* add or override individual additional filetypes

 >	let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['myext'] = 'mysymbol'

## Installation

This plugin follows the standard runtime path structure, and as such it can be installed with a variety of plugin managers:

*  [Pathogen](https://github.com/tpope/vim-pathogen)
  *  `git clone https://github.com/ryanoasis/vim-webdevicons ~/.vim/bundle/vim-webdevicons`
*  [NeoBundle](https://github.com/Shougo/neobundle.vim)
  *  `NeoBundle 'ryanoasis/vim-webdevicons'`
*  [Vundle](https://github.com/gmarik/vundle)
  *  `Plugin 'ryanoasis/vim-webdevicons'`
*  manual
  *  copy all of the files into your `~/.vim` directory

## Todo

* more filetypes to support
* make sure it works properly and does not conflict with [nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin)
* customize filetype icon colors
* more customization options in general

## FAQ / Troubleshooting

* I don't want to use any of the fonts provided, I want to use font ABC
 * try the font patcher: [nerd-filetype-glyphs-fonts-patcher](https://github.com/ryanoasis/nerd-filetype-glyphs-fonts-patcher)
 * see font configuration above for more details

* It isn't working
  * Are you using the patched font provided in the separate repo ([nerd-filetype-glyphs-fonts-patcher](https://github.com/ryanoasis/nerd-filetype-glyphs-fonts-patcher)) or are you patching your own?
  * _NOTE:_ if running vim and no font set it will default to the terminal font that is set
  * check what the vim/gvim font is set to, from ex mode:

    >	:set guifont?

  * check if the plugin is loaded (should give '1'), from ex mode:

    >	:echo loaded_webdevicons

  * check if the plugin is enabled (should give '1'), from ex mode:

    >	:echo g:webdevicons_enable

  * check if the plugin is enabled for NERDTree (should give '1'), from ex mode:
    * this should *NOT* need to be set under normal circumstances

    >	:echo g:webdevicons_enable_nerdtree

  * check if you are able to see the characters, from ex mode:

    >	:echo g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol

  * if all this looks correct you may try this to see if any files show flags
    * last resort, see if you can even set the default symbol and have it display anywhere (NERDTree, vim-airline's statusline, vim-airlines's tabline), from ex mode:

    >	:let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol='x'

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
