" Andres Riofrio's .vimrc

" VimGolf's .vimrc
" http://vimdoc.sourceforge.net/htmldoc/starting.html#vimrc

set nocompatible        " use vim defaults
set scrolloff=3         " keep 3 lines when scrolling
set ai                  " set auto-indenting on for programming

set showcmd             " display incomplete commands
set nobackup            " do not keep a backup file
set number              " show line numbers
set ruler               " show the current row and column

set hlsearch            " highlight searches
set incsearch           " do incremental searching
set showmatch           " jump to matches when entering regexp
set ignorecase          " ignore case when searching
set smartcase           " no ignorecase if Uppercase char present

set visualbell t_vb=    " turn off error beep/flash
set novisualbell        " turn off visual bell

set backspace=indent,eol,start  " make that backspace key work the way it should

syntax on               " turn syntax highlighting on by default
filetype on             " detect type of file
filetype indent on      " load indent file for specific file type

set t_RV=               " http://bugs.debian.org/608242, http://groups.google.com/group/vim_dev/browse_thread/thread/9770ea844cec3282

" Custom Settings

set encoding=utf-8
set modelines=0         " prevent security exploits http://j.mp/Jmfwyy
set cursorline          " highlight current line
let mapleader = ","     " change the <Leader> key
set gdefault            " substitute all matches in a line instead of one
set guioptions-=m       " hide menu bar
set guioptions-=T       " hide toolbar
filetype plugin on
set nofoldenable        " disable folding: make all folds open
set mouse=a             " enable mouse for all modes in terminal

if has("win32")
  set guifont=Consolas:h11
else
  set guifont=Monospace\ 11
endif

set directory-=.                        " write swap files elsewhere
if has("win32")
  set directory^=$HOME/vimfiles/swap//  " (directory must exist to be used)
  set directory+=$TEMP//                " write swap files to temp directory
else
  set directory^=$HOME/.vim/swap//      " (directory must exist to be used)
endif

set undofile
set undodir-=.                          " write undo files elsewhere
if has("win32")
  set undodir^=$HOME/vimfiles/undo//    " (directory must exist to be used)
else
  set undodir^=$HOME/.vim/undo//        " (directory must exist to be used)
endif

set tabstop=2           " # of spaces a <Tab> counts for
set shiftwidth=2        " # of spaces for each step of (auto)indent
set softtabstop=2       " # of spaces inserted when <Tab> is pressed in insert mode
set expandtab           " use spaces instead of tabs

set textwidth=79        " auto-break lines at 79 characters
"set formatoptions=qrn1
set colorcolumn=80      " show a visual text width indicator

set wildmenu            " tab completion in command mode
set wildmode=list:longest " ... that works like Bash

" Custom Mappings

nnoremap / /\v
vnoremap / /\v

" <Tab> is <C-i>, and <C-i> is the opposite of <C-o>, and
" both are useful
"nnoremap <tab> %
"vnoremap <tab> %

nnoremap j gj
nnoremap k gk
nnoremap ; :
inoremap jj <Esc>
nnoremap <leader>q gqip
nnoremap <leader><space> :nohlsearch<cr>
cmap w!! w !sudo tee >/dev/null %

" noob settings
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

au FocusLost * silent :wa " autosave on Alt-Tab
 
" strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>ef :e ~/.vim/ftplugin/<C-R>=&filetype<CR>.vim<CR>
nnoremap <leader>rv :w<CR>:so $MYVIMRC<CR>
nnoremap <leader>rb :BundleInstall<CR>
nnoremap <leader>rf :w<CR>:set filetype=<C-R>=&filetype<CR><CR>

" Bundles

" install Vundle on new machines
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
endif

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'Markdown'
Bundle 'kien/ctrlp.vim'
Bundle 'chords'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'kchmck/vim-coffee-script'
Bundle 'digitaltoad/vim-jade'
Bundle 'vim-json-bundle'
Bundle 'jeroenbourgois/vim-actionscript'
Bundle 'vim-pandoc/vim-pandoc'
Bundle 'groenewege/vim-less'
Bundle 'godlygeek/tabular'
Bundle 'camelcasemotion'
"Bundle 'suan/vim-instant-markdown'
Bundle 'codepad'
Bundle 'Rename'
Bundle 'ariofrio/vim-iosession'
Bundle 'taglist.vim'
Bundle 'butane.vim'
Bundle 'scrooloose/syntastic'

"Bundle 'rosenfeld/conque-term'
"let g:ConqueTerm_ReadUnfocused = 1

Bundle "tpope/vim-fugitive"
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gdc :Git diff --cached %<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Git push<CR>

Bundle 'scratch.vim'
nnoremap <leader><tab> :Scratch<cr>

"Bundle 'altercation/vim-colors-solarized'
Bundle 'flazz/vim-colorschemes'
colorscheme molokai
highlight ColorColumn guibg=gray8
set fillchars+=vert:\ 
highlight VertSplit guibg=gray50

filetype plugin indent on

