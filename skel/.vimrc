" Enable 256 Colors
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal" || $TERM == "screen"
  set t_Co=256
endif

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

" And so is Artificial Intelligence!
set smartcase

" Set spellcheck language to English but turn it off
if version >= 700
   set spl=en spell
   set nospell
endif

" The status line at the bottom of the screen
set laststatus=2
set statusline=
set statusline +=\ %n\ %*            "buffer number
set statusline +=%{&ff}%*            "file format
set statusline +=%y%*                "file type
set statusline +=\ %<%F%*            "full path
set statusline +=%m%*                "modified flag
set statusline +=%=%5l%*             "current line                           
set statusline +=/%L%*               "total lines
set statusline +=%4v\ %*             "virtual column number 
set statusline +=0x%04B\ %*          "character under cursor

" The old statusline I used to use
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
" function! HasPaste()
"     if &paste
"         return 'PASTE MODE  '
"     en
"     return ''
" endfunction

" Set chlorscheme to elflord in gvim
if has('gui_running')
  set guioptions-=T  " no toolbar
  colorscheme elflord
endif

" Folding options
" set foldmethod=indent
" set foldlevel=2
" au BufWinLeave * silent! mkview
" au BufWinEnter * silent! loadview

" map \l to toggle line numbers
nmap \l :setlocal number!<CR>

" Run Pathogen
call pathogen#infect()
call pathogen#helptags()
