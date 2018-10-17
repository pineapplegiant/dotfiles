""""""No Compatible and plugin on by default thx neovim

" Optional colorsheme
" colorscheme spacedirt


" Find stuff in vanilla vim? Wow
set path+=**

"""""Map leader to '<space>' All things Leader
let mapleader=' '

" Turn off search highlight bullshit to Comma and then Space
nnoremap ,<leader> :nohlsearch<CR>

" Quicksave in vim! 
noremap <Leader>s :update<CR>

" Quick quit in vim
noremap <leader>q :q!<cr>

" Paste into vim in normal mode
noremap <leader>p  "+p

" Copy into Clipboard from vim
noremap <leader>y  "+y

" Make leader+w = ctrl + w to move between windows
noremap <leader>w <C-w>

" Make Leader j = captil J--> not good but screw it
noremap <leader>j J
""""""""


" Remap Capital J/K to move up and down blocks
noremap J }
nnoremap K {

" Set U as Ctrl R which means Redo
nnoremap U <C-R>

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
syntax enable		          " Turn on Syntax highlighting
set number                    " Turn on Line Number
"set relativenumber           " Relative Numbering  
set mouse=a		              " Allow Mouse to work (I know, I suck)
set autoindent			      " Makes it so that things are  indented when needed (i think)
set cursorline                " Cursorline in vim 
" hi cursorline cterm=none term=none
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
let python_hightlight_all = 1 " Who knows if this really works


" Press F5 in normal/insert mode to paste timestamp
nnoremap <F5> "=strftime("#### %H:%M:%S")<CR>P 
inoremap <F5> "=strftime("#### %H:%M:%S")<CR>P

" List all buffers and jump to them using 'gb'
nnoremap gb :ls<CR>:b<Space>

" List all recently opened files and open a new buffer
nnoremap gs :browse oldfiles<CR>


"""""Snippets!o

" Basic HTML Snippet!
nnoremap ,html :1-read $HOME/.config/nvim/snippets/skeleton.html<CR>4j3wa



