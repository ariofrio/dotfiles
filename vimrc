""" Editing

" Set default indentation to 2 spaces.
" Enable file type detection (and thus type-specific indentation).
" <http://vim.wikia.com/wiki/Indenting_source_code>
set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent 
if has("autocmd")
  filetype plugin indent on
endif

" Command to add indentation without moving cursor.
" TODO: Use shiftwidth/softtabstop (minus 1) to tell how many h's to type.
nnoremap <Tab> i<Tab><Esc>h

" Enable syntax folding for all files (specially Java, which does not enable it
" by default). It's not like we need manual folding anyway, not right now.
" <http://vim.wikia.com/wiki/Java/C/C%2B%2B_folding>
set foldmethod=syntax

""" Display

" Do not visibly wrap long lines.
set wrap!

""" Navigation

" Make cursor keys wrap (but not h and l) around the end of lines.
" <http://stackoverflow.com/questions/2574027/automatically-go-to-next-line-in-vim>
set whichwrap+=<,>,[,] 

" Enable mouse selection and navigation for XTerm-compatible terminals.
" <http://vim.wikia.com/wiki/Using_the_mouse_for_Vim_in_an_xterm>
set mouse=a

" Make vim remember cursor position across sessions (for the last few files).
" <http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session>
" Tell vim to remember certain things when we exit:
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo
" Add the main function that restores the cursor position and its autocmd so
" that it gets triggered:
if has("autocmd")
  function! ResCur()
    if line("'\"") <= line("$")
      normal! g`"
      return 1
    endif
  endfunction

  augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
  augroup END
endif

""" Miscelaneous

" Enable modelines (per-file settings)
set modeline

" Required for full functionality of vim-latexsuite (see
" /usr/share/doc/vim-latexsuite/README.Debian).
filetype plugin on
set grepprg=grep\ -nH\ $*
filetype indent on
let g:tex_flavor='latex'

" Provide alternative keybindings for latex-suite bindings that conflict with
" byobu.
nmap f7 <F7>

" Quick command for writing the current file as root (no more `sudo vim`)
" <http://stackoverflow.com/questions/1005/getting-root-permissions-on-a-file-inside-of-vi/37042#37042>
cmap w!! w !sudo tee >/dev/null %

" Optional autosave. Must enable manually. =D
" <http://vim.wikia.com/wiki/Auto-save_current_buffer_periodically>
function! UpdateFile()
  if ((localtime() - b:start_time) >= 10)
    update
    let b:start_time=localtime()
"  else
"    echo "Only " . (localtime() - b:start_time) . " seconds have elapsed so far."
  endif
endfunction
function! Autosave()
  let b:start_time=localtime()
  au BufRead,BufNewFile * let b:start_time=localtime()
  au CursorHold * call UpdateFile()
endfunction
:command Autosave call Autosave()
