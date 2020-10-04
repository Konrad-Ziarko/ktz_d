set listchars=eol:¬,tab:>-,trail:~,extends:>,precedes:<
"set listchars+=space:␣
set list
" open new splits in natural positions "
set splitbelow
set splitright

" use 4 spaces instead of tabs
set number
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab autoindent

" Use actual tab chars in Makefiles.
if has("autocmd")
    filetype plugin indent on
    autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
endif

function! UseTabs()
   set tabstop=4     " Size of a hard tabstop (ts).
   set shiftwidth=4  " Size of an indentation (sw).
   set noexpandtab   " Always uses tabs instead of space characters (noet).
   set autoindent    " Copy indent from current line when starting a new line (ai).
endfunction

function! UseSpaces()
   set tabstop=4     " Size of a hard tabstop (ts).
   set shiftwidth=4  " Size of an indentation (sw).
   set expandtab     " Always uses spaces instead of tab characters (et).
   set softtabstop=0 " Number of spaces a <Tab> counts for. When 0, featuer is off (sts).
   set autoindent    " Copy indent from current line when starting a new line.
   set smarttab      " Inserts blanks on a <Tab> key (as per sw, ts and sts).
endfunction

" BINARY "
nnoremap <C-H> :Hexmode<CR>
inoremap <C-H> <Esc>:Hexmode<CR>
vnoremap <C-H> :<C-U>Hexmode<CR>

" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    silent :e " this will reload the file without trickeries 
              "(DOS line endings will be shown entirely )
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

" vim -b : edit binary using xxd-format!
augroup Binary
  au!
  au BufReadPre  *.bin let &bin=1
  au BufReadPost *.bin if &bin | %!xxd
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup END
