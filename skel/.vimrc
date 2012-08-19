set history=700

set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

set cul
set autoread

set wildmenu
"set wildmode=list:longest,full

"set mouse=a

set showcmd

" This is totally awesome - remap jj to escape in insert mode.  You'll never
" type jj anyway, so it's great!
inoremap jj <Esc>
nnoremap JJJJ <Nop>

" Incremental searching is sexy
set incsearch

" Highlight things that we find with the search
set hlsearch

filetype on
filetype plugin on
syntax enable
set autoindent

" Line Numbers PWN!
" set number

" Ignoring case is a fun trick
set ignorecase

" And so is Artificial Intellegence!
set smartcase

if version >= 700
   set spl=en spell
   set nospell
endif

set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

if has('gui_running')
  set guioptions-=T  " no toolbar
  colorscheme elflord
endif
