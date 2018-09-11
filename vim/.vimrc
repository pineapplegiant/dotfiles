""""""Required for Vim Plug
set nocompatible              " be iMproved, required

" Set U as (Ctrl R) which means Redo
nnoremap U <C-R>

" Tell Vim to quit it's shit 
nnoremap Q :

" Turn off search highlight bullshit to Comma and then Space
nnoremap ,<space> :nohlsearch<CR>

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

" Move to beginning
nnoremap B ^
nnoremap vB v^
nnoremap dB d^
nnoremap cB c^
" Move to end of line
nnoremap E $
nnoremap vE v$
nnoremap dE d$
nnoremap cE c$

"""""Basic Preference Things
syntax on		              " Turn on Syntax highlighting
set nu                        " Turn on Line Number
set mouse=a		              " Allow Mouse to work (I know, I suck)
set autoindent			      " Makes it so that things are  indented when needed (i think)
set smarttab		          " Turn on smart tabs
set expandtab		          " Tabs are spaces 
set tabstop=4			      " TAB becomes 4 spaces 
set softtabstop=4	          " TAB becomes 4 spaces in Vim operations
set shiftwidth=4		      " Number of spaces for indentation 
set hlsearch			      " Highlight search results
set incsearch			      " Turn on incremental searching
set showcmd                   " Turn on Cmd as typed
set wildmenu                  " Visual autocomplete for command menu
set backspace=indent,eol,start " Allow backspace in insert mode
set scrolloff=3               " When scrolling, keep cursor 3 lines away from screen border
set wrap                      " Wrap lines when they are too long
set title                     " Update the title of the window or the terminal  

