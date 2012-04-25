"## Essential (cannot live without)

" It's 2012 -- we don't need to be compatible with vi.
set nocompatible

" Prevent some [security exploits](http://j.mp/Jmfwyy) having to do with
" modelines in files.
set modelines=0

" I like tabs to expand to two spaces. [Learn more](http://j.mp/IC6nQL).
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Make everything better.
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

" Change Vim's line number column to display how far away each line is from the 
" current one, instead of showing the absolute lie number. Use it with motion
" commands like `d<NUMBER>d`.
set relativenumber

" Create `<FILENAME>.un~` files whenever you edit a file. These files contain
" undo information so you can undo previous actions even after you close and
" reopen a file.
set undofile

" Change the `<leader>` key. For me `,` is easier to type than `\`. 
let mapleader = ","

"### Searching/moving

" Automatically insert a `\v` before any string you search for. This makes searches
" use normal regexes instead of Vim's crazy default regex characters. I already know
" Perl/Python compatible regex formatting, why learn another scheme?
nnoremap / /\v
vnoremap / /\v

" Make Vim deal with case-sensitive search intelligently. If you search for an
" all-lowercase string your search will be case-insensitive, but if one or more
" characters is uppercase the search will be case-sensitive. Most of the time
" this does what you want.
set ignorecase
set smartcase

" Apply substitutions globally on lines. For example, instead of
" `:%s/foo/bar/g` you just type `:%s/foo/bar/`. This is almost always what you
" want (when was the last time you wanted to only replace the first occurrence
" of a word on a line?) and if you need the previous behavior you just tack on
" the `g` again.
set gdefault

" Work together to highlight search results (as you type). It's really quite
" handy, as long as you have the next line as well.
set incsearch
set showmatch
set hlsearch

" Make it easy to clear out a search by typing `,<space>`. This gets rid of the
" distracting highlighting once I’ve found what I’m looking for.
nnoremap <leader><space> :noh<cr>

" Make the tab key match bracket pairs. I use this to move around all the time
" and `<tab>` is much easier to type than `%`.
nnoremap <tab> % vnoremap <tab> %

" The next section makes Vim handle long lines correctly. These lines manage
" my line wrapping settings and also show a colored column at 85 characters
" (so I can see when I write a too-long line of code).
"
" See [`:help fo-table`][fo-table] and the Vimcasts on [soft wrapping][] and
" [hard wrapping][] for more information.
"
"   [fo-table]: http://vimdoc.sourceforge.net/htmldoc/change.html#fo-table
"   [soft wrapping]: http://vimcasts.org/episodes/soft-wrapping-text/
"   [hard wrapping]: http://vimcasts.org/episodes/hard-wrapping-text/

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

" New Vim users will want the following lines to teach them to do things
" right.
" 
" This will disable the arrow keys while you're in normal mode to help you
" learn to use `hjkl`. Trust me, you want to learn to use `hjkl`. Playing a lot of
" Nethack also helps.
"
" It also disables the arrow keys in insert mode to force you to get back into
" normal mode the instant you're done inserting text, which is the "right way"
" to do things.
"
" It also makes `j` and `k` work the way you expect instead of working in some
" archaic "movement by file line instead of screen line" fashion.

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" I also like to make `;` do the same thing as `:` -- it's one less key to hit
" every time I want to save a file: I don't remap `:` back to `;` because it seems
" to break a bunch of plugins.

nnoremap ; :

" Finally, I really like TextMate's "save on losing focus" feature. I can't
" remember a time when I didn't want to save a file after tabbing away from my
" editor (especially with version control and Vim's persistent undo).

au FocusLost * :wa

"## Using the Leader

" Vim dedicates an entire keyboard key for user-specific customizations. This
" is called the "leader" and by default it's mapped to `\`. As I mentioned in
" the previous section I prefer to use `,` instead.
" 
" Each person will find little things they type or execute often and want to
" create shortcuts for those things. The leader is a kind of "namespace" to
" keep those customizations separate and prevent them from shadowing default
" commands.
" 
" Here are a few of the things I use leader commands for. You'll certainly
" have different ideas than I do, but this might give you an idea of what you
" can do.
 
" I use `,W` to mean "strip all trailing whitespace in the current file" so I
" can clean things up quickly.
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" This next mapping imitates TextMate's `Ctrl+Q` function to re-hardwrap
" paragraphs of text:
nnoremap <leader>q gqip

" This last mapping lets me quickly open up my `~/.vimrc` file in a vertically
" split window so I can add new things to it on the fly.
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

"## Prettyness

" One of the most important things for a text editor is that it look pretty. Let's
" make Vim beautiful. By the way, if you are looking for the color scheme, it's
" included below as a bundle.

" Remove gVim's distracting and unnecessary toolbar.
:set guioptions-=T

" Disable the visual bell because it's distracting.
set novisualbell

"## Bundles

" Vundle is a Vim plugin manager that can download bundles from GitHub.
" It's awesome!

" Install Vundle from GitHub automatically if not found. http://j.mp/I8bCry
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
endif

" Enable Vundle. 
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Configure bundles managed by Vundle from GitHub (user/repo), vim-scripts
" (name), or non github repos (git://...).
Bundle 'gmarik/vundle', {'v': 'v'}
Bundle 'Markdown'
Bundle 'kien/ctrlp.vim'
Bundle 'chords'

Bundle 'scratch.vim'
nnoremap <leader><tab> :Scratch<cr>

Bundle 'ariofrio/molokai-sjl'
:colorscheme molokai

" Required by Vundle.
filetype plugin indent on

" Don't forget to run `:BundleInstall` when you make changes to this section!

"## <i>Et cetera</i>

" Enable syntax folding for all files (specially Java, which does not enable it
" by default). It's not like we need manual folding anyway, not right now.
" <http://vim.wikia.com/wiki/Java/C/C%2B%2B_folding>
" set foldmethod=syntax

" Do not visibly wrap long lines.
set wrap!

" Enable mouse selection and navigation for XTerm-compatible terminals.
" <http://vim.wikia.com/wiki/Using_the_mouse_for_Vim_in_an_xterm>
set mouse=a

" Quick command for writing the current file as root (no more `sudo vim`)
" <http://stackoverflow.com/questions/1005/getting-root-permissions-on-a-file-inside-of-vi/37042#37042>
cmap w!! w !sudo tee >/dev/null %

