" ─── General ──────────────────────────────────────────────────────────
set nocompatible
set encoding=utf-8
set hidden
set updatetime=300
set timeoutlen=500

" ─── Display ─────────────────────────────────────────────────────────
syntax enable
set number
set scrolloff=8
set sidescrolloff=8
set signcolumn=yes
set colorcolumn=100
set showmatch
set laststatus=2

" ─── Search ──────────────────────────────────────────────────────────
set incsearch
set hlsearch
set ignorecase
set smartcase
" Clear search highlight with Escape
nnoremap <Esc> :nohlsearch<CR>

" ─── Indentation ─────────────────────────────────────────────────────
set autoindent
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" ─── Files ───────────────────────────────────────────────────────────
set backupdir=$HOME/.vim/backup
set dir=$HOME/.vim/swap
set undofile
set undodir=~/.vim/undodir

" ─── Splits ──────────────────────────────────────────────────────────
set splitbelow
set splitright
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ─── Misc ────────────────────────────────────────────────────────────
set wildmenu
set wildmode=list:longest
set backspace=indent,eol,start
set clipboard=unnamed

" Create undo dir if it doesn't exist
if !isdirectory($HOME . "/.vim/undodir")
  call mkdir($HOME . "/.vim/undodir", "p")
endif

" Create swap dir if it doesn't exist
if !isdirectory($HOME . "/.vim/swap")
  call mkdir($HOME . "/.vim/swap", "p")
endif

" Create backup dir if it doesn't exist
if !isdirectory($HOME . "/.vim/backup")
  call mkdir($HOME . "/.vim/backup", "p")
endif
