scriptencoding utf-8

" Please use nerd-font if you watch icon-font

let s:suite = themis#suite('WebDevIconsGetFileTypeSymbol')
let s:assert = themis#helper('assert')

function! s:Assert(filename, icon)
  call s:assert.equals(WebDevIconsGetFileTypeSymbol(a:filename), a:icon)
endfunction

function! s:suite.NoArgument_GetDefaultIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol(), '')
endfunction

function! s:suite.__OneArgument_VimIcon__()
  let targetfilenames = ['.vimrc', 'vimrc', '.gvimrc', '_gvimrc', 'test.vim']
  let expecticon = ''
  let child = themis#suite('OneArgument_VimIcon')

  for targetfilename in targetfilenames
    let child[targetfilename] = funcref('s:Assert', [targetfilename, expecticon])
  endfor
endfunction

function! s:suite.__OneArgument_RubyIcon__()
  let targetfilenames = ['test.rb', 'rakefile', 'RAKEFILE', 'Gemfile', 'config.ru']
  let expecticon = ''
  let child = themis#suite('OneArgument_RubyIcon')

  for targetfilename in targetfilenames
    let child[targetfilename] = funcref('s:Assert', [targetfilename, expecticon])
  endfor
endfunction

function! s:suite.__OneArgument_MarkDownIcon__()
  let targetfilenames = ['test.md', 'test.markdown', 'test.mdx', 'test.rmd']
  let expecticon = ''
  let child = themis#suite('OneArgument_MarkDownIcon')

  for targetfilename in targetfilenames
    let child[targetfilename] = funcref('s:Assert', [targetfilename, expecticon])
  endfor
endfunction

function! s:suite.__OneArgument_PythonIcon__()
  let targetfilenames = ['test.py', 'test.pyc', 'test.pyo', 'test.pyd']
  let expecticon = ''
  let child = themis#suite('OneArgument_PythonIcon')

  for targetfilename in targetfilenames
    let child[targetfilename] = funcref('s:Assert', [targetfilename, expecticon])
  endfor
endfunction

function! s:suite.__OneArgument_ShellIcon__()
  let targetfilenames = ['test.sh', 'test.fish', 'test.bash', 'test.ksh', 'test.csh', 'test.awk', 'test.ps1']
  let expecticon = ''
  let child = themis#suite('OneArgument_ShellIcon')

  for targetfilename in targetfilenames
    let child[targetfilename] = funcref('s:Assert', [targetfilename, expecticon])
  endfor
endfunction

function! s:suite.__OneArgument_DBIcon__()
  let targetfilenames = ['test.db', 'test.sql', 'test.dump']
  let expecticon = ''
  let child = themis#suite('OneArgument_DBIcon')

  for targetfilename in targetfilenames
    let child[targetfilename] = funcref('s:Assert', [targetfilename, expecticon])
  endfor
endfunction

function! s:suite.__OneArgument_RustIcon__()
  let targetfilenames = ['test.rs', 'test.rlib']
  let expecticon = ''
  let child = themis#suite('OneArgument_RustIcon')

  for targetfilename in targetfilenames
    let child[targetfilename] = funcref('s:Assert', [targetfilename, expecticon])
  endfor
endfunction

function! s:suite.__OneArgument_DockerIcon__()
  let targetfilenames = ['Dockerfile', 'docker-compose.yml']
  let expecticon = ''
  let child = themis#suite('OneArgument_DockerIcon')

  for targetfilename in targetfilenames
    let child[targetfilename] = funcref('s:Assert', [targetfilename, expecticon])
  endfor
endfunction

function! s:suite.__OneArgument_JavaScriptIcon__()
  let targetfilenames = ['test.js', 'test.mjs']
  let expecticon = ''
  let child = themis#suite('OneArgument_JavaScriptIcon')

  for targetfilename in targetfilenames
    let child[targetfilename] = funcref('s:Assert', [targetfilename, expecticon])
  endfor
endfunction

function! s:suite.__OneArgument_ReactIcon__()
  let targetfilenames = ['test.jsx', 'test.tsx', 'react.jsx']
  let expecticon = ''
  let child = themis#suite('OneArgument_ReactIcon')

  for targetfilename in targetfilenames
    let child[targetfilename] = funcref('s:Assert', [targetfilename, expecticon])
  endfor
endfunction

function! s:suite.__OneArgument_JsonIcon__()
  let targetfilenames = ['test.json', 'test.webmanifest']
  let expecticon = ''
  let child = themis#suite('OneArgument_JsonIcon')

  for targetfilename in targetfilenames
    let child[targetfilename] = funcref('s:Assert', [targetfilename, expecticon])
  endfor
endfunction

function! s:suite.__OneArgument_GearIcon__()
  let targetfilenames = ['.DS_Store', 'Makefile', 'test.mk', '.bashrc', '.zshrc', '.gitignore', '.gitattributes',  'cmakelists.txt', 'test.yaml', 'test.yml', 'test.toml', 'test.bat']
  let expecticon = ''
  let child = themis#suite('OneArgument_GearIcon')

  for targetfilename in targetfilenames
    let child[targetfilename] = funcref('s:Assert', [targetfilename, expecticon])
  endfor
endfunction

function! s:suite.__OneArgument_ErlangIcon__()
  let targetfilenames = ['test.erl', 'test.hrl']
  let expecticon = ''
  let child = themis#suite('OneArgument_ErlangIcon')

  for targetfilename in targetfilenames
    let child[targetfilename] = funcref('s:Assert', [targetfilename, expecticon])
  endfor
endfunction

function! s:suite.__OneArgument_SwiftIcon__()
  let targetfilenames = ['test.swift', 'test.xcplayground']
  let expecticon = ''
  let child = themis#suite('OneArgument_SwiftIcon')

  for targetfilename in targetfilenames
    let child[targetfilename] = funcref('s:Assert', [targetfilename, expecticon])
  endfor
endfunction

function! s:suite.__OneArgument_HaskellIcon__()
  let targetfilenames = ['test.hs', 'test.lhs']
  let expecticon = ''
  let child = themis#suite('OneArgument_HaskellIcon')

  for targetfilename in targetfilenames
    let child[targetfilename] = funcref('s:Assert', [targetfilename, expecticon])
  endfor
endfunction

function! s:suite.__OneArgument_CppIcon__()
  let targetfilenames = ['test.cpp', 'test.c++', 'test.cp', 'test.cxx', 'test.cc']
  let expecticon = ''
  let child = themis#suite('OneArgument_C++Icon')

  for targetfilename in targetfilenames
    let child[targetfilename] = funcref('s:Assert', [targetfilename, expecticon])
  endfor
endfunction

function! s:suite.__OneArgument_ElixirIcon__()
  let targetfilenames = ['test.ex', 'test.exs', 'test.eex', 'test.leex', 'test.heex']
  let expecticon = ''
  let child = themis#suite('OneArgument_ElixirIcon')

  for targetfilename in targetfilenames
    let child[targetfilename] = funcref('s:Assert', [targetfilename, expecticon])
  endfor
endfunction

function! s:suite.__OneArgument_PerlIcon__()
  let targetfilenames = ['test.pl', 'test.pm', 'test.t']
  let expecticon = ''
  let child = themis#suite('OneArgument_PerlIcon')

  for targetfilename in targetfilenames
    let child[targetfilename] = funcref('s:Assert', [targetfilename, expecticon])
  endfor
endfunction

function! s:suite.__OneArgument_FSharpIcon__()
  let targetfilenames = ['test.fs', 'test.fsx', 'test.fsi', 'test.fsscript']
  let expecticon = ''
  let child = themis#suite('OneArgument_FSharpIcon')

  for targetfilename in targetfilenames
    let child[targetfilename] = funcref('s:Assert', [targetfilename, expecticon])
  endfor
endfunction

function! s:suite.OneArgument_GetTypeScriptIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.ts'), '')
endfunction

function! s:suite.OneArgument_GetVueIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.vue'), '﵂')
endfunction

function! s:suite.OneArgument_GetNodeModuleIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('node_modules'), '')
endfunction

function! s:suite.OneArgument_GetDropboxIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('Dropbox'), '')
endfunction

function! s:suite.OneArgument_GetRIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.r'), 'ﳒ')
endfunction

function! s:suite.OneArgument_GetLuaIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.lua'), '')
endfunction

function! s:suite.OneArgument_GetJavaIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.java'), '')
endfunction

function! s:suite.OneArgument_GetCIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.c'), '')
endfunction

function! s:suite.OneArgument_GetCSSIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.cs'), '')
endfunction

function! s:suite.OneArgument_GetCSharpIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.cs'), '')
endfunction

function! s:suite.OneArgument_GetElmIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.elm'), '')
endfunction

function! s:suite.OneArgument_GetRssIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.rss'), '')
endfunction

function! s:suite.OneArgument_GetDartIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.dart'), '')
endfunction

function! s:suite.OneArgument_GetSolidityIcon()
  call s:assert.equals(WebDevIconsGetFileTypeSymbol('test.sol'), 'ﲹ')
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

function! s:suite.OneArgument_GetRobotIcon()
  call s:assert.equals( WebDevIconsGetFileTypeSymbol('robots.txt'), 'ﮧ')
endfunction

function! s:suite.OneArgument_PemIcon()
  call s:assert.equals( WebDevIconsGetFileTypeSymbol('test.pem'), '')
endfunction

function! s:suite.TwoArgument_zero_GetFileIcon()
  call s:assert.equals( WebDevIconsGetFileTypeSymbol('test.vim', 0), '')
endfunction

function! s:suite.TwoArgument_one_GetFolderIcon()
  call s:assert.equals( WebDevIconsGetFileTypeSymbol('test.vim', 1), '')
endfunction

function! s:suite.TwoArgument_two_GetDefaultIcon()
  call s:assert.equals( WebDevIconsGetFileTypeSymbol('test.vim', 2), '')
endfunction

function! s:suite.TwoArgument_string_GetFileTypeIcon()
  call s:assert.equals( WebDevIconsGetFileTypeSymbol('test.php', 'test.vim'), '')
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
