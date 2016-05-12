scriptencoding utf-8
" J6uil_members extension for CtrlP
"
" Maintainer:   DeaR <nayuri@kuonn.mydns.jp>
" Last Change:  12-May-2016.
" License:      MIT License {{{
"     Copyright (c) 2016 DeaR <nayuri@kuonn.mydns.jp>
"
"     Permission is hereby granted, free of charge, to any person obtaining a
"     copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to permit
"     persons to whom the Software is furnished to do so, subject to the
"     following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT
"     OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR
"     THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}

if exists('g:loaded_ctrlp_J6uil_members') && g:loaded_ctrlp_J6uil_members
  finish
endif
let g:loaded_ctrlp_J6uil_members = 1

call add(g:ctrlp_ext_vars, {
\ 'init'      : 'ctrlp#J6uil#members#init()',
\ 'accept'    : 'ctrlp#J6uil#members#accept',
\ 'lname'     : 'J6uil_members',
\ 'sname'     : 'J6m',
\ 'exit'      : 'ctrlp#J6uil#members#exit()',
\ 'type'      : 'line'})

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

function! ctrlp#J6uil#members#init()
  return map(s:mem,
  \ '(v:val.is_online ? "+ " : "  ") .' .
  \ '(v:val.is_owner ? "★ " : "") . ' .
  \ 'v:val.name')
endfunction

function! ctrlp#J6uil#members#accept(mode, str)
  call ctrlp#exit()
endfunction

function! ctrlp#J6uil#members#id()
  let s:mem = copy(b:J6uil_roster.members)
  return s:id
endfunction

function! ctrlp#J6uil#members#exit()
  unlet! s:mem
endfunction
