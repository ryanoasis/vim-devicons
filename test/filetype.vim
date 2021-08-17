scriptencoding utf-8

" Please use nerd-font if you watch icon-font

let s:suite = themis#suite('WebDevIconsGetFileTypeSymbol')
let s:assert = themis#helper('assert')

function! s:suite.NoArgument_GetDefaultIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol(), '')
endfunction

function! s:suite.OneArgument_GetVimIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('.vimrc'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('vimrc'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('_vimrc'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('.gvimrc'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('gvimrc'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('_gvimrc'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.vim'), '')
endfunction

function! s:suite.OneArgumet_GetRubyIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.rb'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('Rakefile'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('RAKEFILE'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('rakefile'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('Gemfile'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('gemfile'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('config.ru'), '')
endfunction

function! s:suite.OneArgument_GetGoIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.go'), '')
endfunction

function! s:suite.OneArgument_GetPhpIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.php'),'')
endfunction

function! s:suite.OneArgument_GetScalaIcon()
  call s:assert.equals( WebDevIconsGetFileTypeSymbol('test.scala'), '')
endfunction

function! s:suite.OneArgument_GetTexIcon()
  call s:assert.equals( WebDevIconsGetFileTypeSymbol('test.tex'), 'ﭨ')
endfunction

function! s:suite.OneArgument_GetLicenseIcon()
  call s:assert.equals( WebDevIconsGetFileTypeSymbol('LICENSE'), '')
endfunction

function! s:suite.OneArgument_GetMarkdownIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.md'),'')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.markdown'),'')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.mdx'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.rmd'), '')
endfunction

function! s:suite.OneArgument_GetPythonIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.py'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.pyc'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.pyo'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.pyd'), '')
endfunction

function! s:suite.OneArgument_GetShellIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.sh'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.fish'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.bash'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.ksh'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.csh'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.awk'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.ps1'), '')
endfunction

function! s:suite.OneArgument_GetElmIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.elm'), '')
endfunction

function! s:suite.OneArgument_GetRssIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.rss'), '')
endfunction

function! s:suite.OneArgument_GetDBIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.db'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.sql'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.dump'), '')
endfunction

function! s:suite.OneArgument_GetVueIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.vue'), '﵂')
endfunction

function! s:suite.OneArgument_GetRustIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.rs'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.rlib'), '')
endfunction

function! s:suite.OneArgument_GetDockerIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('Dockerfile'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('docker-compose.yml'), '')
endfunction

function! s:suite.OneArgument_GetJavaIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.java'), '')
endfunction

function! s:suite.OneArgument_GetJavaScriptIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.js'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.mjs'), '')
endfunction

function! s:suite.OneArgument_GetTypeScriptIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.ts'), '')
endfunction

function! s:suite.OneArgument_GetReactIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.jsx'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.tsx'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('react.jsx'), '')
endfunction

function! s:suite.OneArgument_GetJsonIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.json'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.webmanifest'), '')
endfunction

function! s:suite.OneArgument_GetNodeModuleIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('node_modules'), '')
endfunction

function! s:suite.OneArgument_GetGearIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('.DS_Store'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('Makefile'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.mk'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('.bashrc'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('.zshrc'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('.gitignore'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('.gitattributes'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('cmakelists.txt'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.yaml'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.yml'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.toml'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.bat'), '')
endfunction

function! s:suite.OneArgument_GetDropboxIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('Dropbox'), '')
endfunction

function! s:suite.OneArgument_GetErlangIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.erl'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.hrl'), '')
endfunction

function! s:suite.OneArgument_GetSwiftIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.swift'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.xcplayground'), '')
endfunction

function! s:suite.OneArgument_GetRIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.r'), 'ﳒ')
endfunction

function! s:suite.OneArgument_GetHaskellIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.hs'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.lhs'), '')
endfunction

function! s:suite.OneArgument_GetLuaIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.lua'), '')
endfunction

function! s:suite.OneArgument_GetCppIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.cpp'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.c++'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.cp'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.cxx'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.cc'), '')
endfunction

function! s:suite.OneArgument_GetCIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.c'), '')
endfunction

function! s:suite.OneArgument_GetCSSIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.cs'), '')
endfunction

function! s:suite.OneArgument_GetElixirIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.ex'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.exs'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.eex'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.leex'), '')
endfunction

function! s:suite.OneArgument_GetPerlIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.pl'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.pm'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.t'), '')
endfunction

function! s:suite.OneArgument_GetCSharpIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.cs'), '')
endfunction


function! s:suite.OneArgument_GetFSharpIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.fs'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.fsx'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.fsi'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.fsscript'), '')
endfunction

function! s:suite.OneArgument_GetDartIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.dart'), '')
endfunction

function! s:suite.OneArgument_GetSolidityIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.sol'), 'ﲹ')
endfunction

function! s:suite.NoArgument_OverWriteFileType_GetVimIcon()
  set ft=vim
  call s:assert.equals(WebDevIconsGetFileTypeSymbol(), '')
endfunction

function! s:suite.NoArgument_EditVimFile_GetVimIcon()
  edit! test.vim
  call s:assert.equals(WebDevIconsGetFileTypeSymbol(), '')
endfunction

function! s:suite.NoArgument_Editvimrc_GetVimIcon()
  edit! vimrc
  call s:assert.equals(WebDevIconsGetFileTypeSymbol(), '')
endfunction

function! s:suite.NoArgument_EditPythonFile_GetPythonIcon()
  edit! test.py
  call s:assert.equals(WebDevIconsGetFileTypeSymbol(), '')
endfunction

function! s:suite.NoArgument_EditjavaScriptFile_GetjavaScriptIcon()
  edit! test.js
  call s:assert.equals(WebDevIconsGetFileTypeSymbol(), '')
endfunction

function! s:suite.NoArgument_EditRustFile_GetRustIcon()
  edit! test.rs
  call s:assert.equals(WebDevIconsGetFileTypeSymbol(), '')
endfunction

function! s:suite.NoArgument_EditMKFile_GetGearIcon()
  edit! test.mk
  call s:assert.equals(WebDevIconsGetFileTypeSymbol(), '')
endfunction

function! s:suite.OneArgument_EditPythonFile_GetRubyIcon()
  edit! test.py
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.rb'), '')
endfunction
