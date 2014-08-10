"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimscript file
"
" Check whether or not the @jsx pragma is correctly included in '%'.
" Set the result in b:jsx_pragma_found.
"
" Language: JSX (JavaScript)
" Maintainer: Max Wang <mxawng@gmail.com>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Only check once.
if exists('b:jsx_pragma_found')
  finish
endif

" Save the current cursor, then reset to top.
let s:curpos = getpos('.')
call cursor(1, 1)

" Look for the @jsx pragma.  It must be included in a docblock comment before
" anything else in the file (except whitespace).
silent! \
  /\%^\_s*\/\*\*\%(\_.\%(\*\/\)\@!\)*\zs@jsx\_.\{-}\*\//

" If the cursor moved, we found the pragma.
let b:jsx_pragma_found = (line('.') != 1 || col('.') != 1)

" Reset the cursor.
call setpos('.', s:curpos)