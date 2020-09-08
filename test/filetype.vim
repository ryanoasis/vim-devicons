scriptencoding utf-8

" Please use nerd-font if you watch icon-font

let s:suite = themis#suite('WebDevIconsGetFileTypeSymbol')
let s:assert = themis#helper('assert')

function! s:suite.FileNodesDefaultSymbol()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol(), '')
endfunction

function! s:suite.VimSymbol()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('.vimrc'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('vimrc'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('_vimrc'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('.gvimrc'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('gvimrc'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('_gvimrc'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.vim'), '')
endfunction

function! s:suite.RubySymbol()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.rb'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('Rakefile'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('Gemfile'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('config.ru'), '')
endfunction

function! s:suite.GoSymbol()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.go'), '')
endfunction

function! s:suite.PhpSymbol()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.php'),'')
endfunction

function! s:suite.ScalaSymbol()
  call s:assert.equals( WebDevIconsGetFileTypeSymbol('test.scala'), '')
endfunction

function! s:suite.TexSymbol()
  call s:assert.equals( WebDevIconsGetFileTypeSymbol('test.tex'), 'ﭨ')
endfunction

function! s:suite.LicenseSymbol()
  call s:assert.equals( WebDevIconsGetFileTypeSymbol('LICENSE'), '')
endfunction

function! s:suite.MarkdownSymbol()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.md'),'')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.markdown'),'')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.mdx'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.rmd'), '')
endfunction

function! s:suite.PythonSymbol()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.py'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.pyc'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.pyo'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.pyd'), '')
endfunction

function! s:suite.ShellSymbol()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.sh'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.fish'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.bash'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.ksh'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.csh'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.awk'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.ps1'), '')
endfunction

function! s:suite.ElmSymbol()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.elm'), '')
endfunction

function! s:suite.RssSymbol()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.rss'), '')
endfunction

function! s:suite.DBSymbol()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.db'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.sql'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.dump'), '')
endfunction

function! s:suite.VueSymbol()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.vue'), '﵂')
endfunction

function! s:suite.RustSymbol()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.rs'), '')
endfunction

function! s:suite.DockerSymbol()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('Dockerfile'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('docker-compose.yml'), '')
endfunction

function! s:suite.JavaSymbol()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.java'), '')
endfunction

function! s:suite.JavaScriptSymbol()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.js'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.mjs'), '')
endfunction

function! s:suite.TypeScript()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.ts'), '')
endfunction

function! s:suite.ReactSymbol()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.jsx'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.tsx'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('react.jsx'), '')
endfunction

function! s:suite.JsonSymbol()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.json'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.webmanifest'), '')
endfunction

function! s:suite.NodeModuleSymbol()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('node_modules'), '')
endfunction

function! s:suite.GearSymbol()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('.DS_Store'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('Makefile'), '')
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

function! s:suite.DropboxSymbol()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('Dropbox'), '')
endfunction

function! s:suite.ErlangSymbol()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.erl'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.hrl'), '')
endfunction

function! s:suite.SwiftSymbol()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.swift'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.xcplayground'), '')
endfunction

function! s:suite.RSymbol()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.r'), 'ﳒ')
endfunction

function! s:suite.HaskellSymbol()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.hs'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.lhs'), '')
endfunction

function! s:suite.LuaSymbol()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.lua'), '')
endfunction

function! s:suite.CppSymbol()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.cpp'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.c++'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.cp'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.cxx'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.cc'), '')
endfunction

function! s:suite.CSymbol()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.c'), '')
endfunction

function! s:suite.CSSymbol()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.cs'), '')
endfunction

function! s:suite.ElixirSymbol()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.ex'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.exs'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.eex'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.leex'), '')
endfunction

function! s:suitePerlSymbol()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.pl'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.pm'), '')
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.t'), '')
endfunction
