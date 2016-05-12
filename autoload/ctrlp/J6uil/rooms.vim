" J6uil_rooms extension for CtrlP
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

if exists('g:loaded_ctrlp_J6uil_rooms') && g:loaded_ctrlp_J6uil_rooms
  finish
endif
let g:loaded_ctrlp_J6uil_rooms = 1

call add(g:ctrlp_ext_vars, {
\ 'init'      : 'ctrlp#J6uil#rooms#init()',
\ 'accept'    : 'ctrlp#J6uil#rooms#accept',
\ 'lname'     : 'J6uil_rooms',
\ 'sname'     : 'J6r',
\ 'type'      : 'line'})

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

function! ctrlp#J6uil#rooms#init(...)
  return J6uil#get_rooms()
endfunction

function! ctrlp#J6uil#rooms#accept(mode, str)
  let room = a:str
  call ctrlp#exit()
  call J6uil#subscribe(room)
endfunction

function! ctrlp#J6uil#rooms#id()
  return s:id
endfunction
