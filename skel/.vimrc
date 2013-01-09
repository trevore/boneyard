" Big history
set history=700

" Keep those annoying backup and tmp files in .vim
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" Highlight the line the cursor is on
set cul

" Automatically re-read a file when it is changes outside vim
set autoread

" Display the wildmenu
set wildmenu
"set wildmode=list:longest,full

" Enable mouse in vim command line, stops middle button paste from working
"set mouse=a

" If I am going to code python I might as well setup tab correctly
" Tabs should be 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4

" If loading a python file, setup smart indent
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead *.py set textwidth=79

" Show (partial) command in the last line of the screen.
set showcmd

" Remap jj to escape in insert mode.
inoremap jj <Esc>
nnoremap JJJJ <Nop>

" Incremental searching is sexy
set incsearch

" Highlight things that we find with the search
set hlsearch

" Syntax highlighting
filetype on
filetype plugin on
syntax enable

" Enable autoindent
" set autoindent

" Line Numbers PWN!
" set number

" Ignoring case is a fun trick
set ignorecase

" And so is Artificial Intellegence!
set smartcase

" Set spellcheck language to english but turn it off
if version >= 700
   set spl=en spell
   set nospell
endif

" The status line at the bottom of the screen
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Set chlorscheme to elflord in gvim
if has('gui_running')
  set guioptions-=T  " no toolbar
  colorscheme elflord
endif
