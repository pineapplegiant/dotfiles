""""""Gotta have it
set nocompatible              " be iMproved, required
filetype plugin indent on

"General Re-maps

"Remap Capital J/K to move up and down blocks
    noremap J }
    noremap K {

"Remap ctrl-L and ctrl-H to scroll left & right
    map <C-L> 20zl
    map <C-H> 20zh

"Set U as Ctrl R which means Redo
    nnoremap U <C-R>

"Use B to move to beginning of line in most modes
    map B 0

" Use E to move to end of line in most modes
    map E $

" Map ,, to % because i like cycling brackets a lot
    nnoremap ,, %

"Align blocks of text and keep them selected
    vmap < <gv
    vmap > >gv

"Lots of Time-Stamp Options here in normal/insert mode to paste timestamp and F4 To Date Stamp
    nnoremap <F4> "=strftime("%Y-%m-%d")<CR>p
    inoremap <F4> <C-R>=strftime("%Y-%m-%d")<CR>
    nnoremap <F5> "=strftime("%A %B %d, at %l:%M %Z")<CR>P
    inoremap <F5> <C-R>=strftime("%A %B %d, at %l:%M %Z")<CR>
    nnoremap <F6> "=strftime("%H:%M:%S")<CR>p
    inoremap <F6> <C-R>=strftime("%H:%M:%S")<CR>


"List all buffers and jump to them using 'gb'
    nnoremap gb :ls<CR>:b<Space>

"List all recently opened files and open a new buffer
    nnoremap gs :browse oldfiles<CR>

"Set F12 as Make in VIM!
    map <F12> :!make<CR>

"Set ctrlq as jump out of vim terminal mode
"    tnoremap hh <C-\><C-n>


"""""Basic Preference Things
    set guicursor=n-v-c:block-Cursor " Hopefully make cursor better in insert
    set hidden                     " Ignorecase when searching stuff
    set ignorecase                 " Ignorecase when searching stuff
    "set spelllang=en_us            " Turn on spell check?
    syntax enable                  " Turn on Syntax highlighting
    set number                     " Turn on Line Number
    set nospell                    " Turn off spellcheck
    set mouse=a                    " Allow Mouse to work (I know, I suck)
    set autoindent                 " Makes it so that things are  indented when needed (i think)
    set cursorline                 " Cursorline in vim
    set expandtab                  " Tabs are spaces
    set tabstop=4                  " TAB becomes 4 spaces
    set softtabstop=4              " TAB becomes 4 spaces in Vim operations
    set shiftwidth=4               " Number of spaces for indentation
    set hlsearch                   " Highlight search results
    set incsearch                  " Turn on incremental searching
    set showcmd                    " Turn on Cmd as typed on the bottom-bar
    set backspace=indent,eol,start " Allow backspace in insert mode
    set scrolloff=3                " When scrolling, keep cursor 3 lines away from screen border
    set nowrap                     " Wrap lines when they are too long
    set title                      " Update the title of the window or the terminal
    set wildmenu                   " Visual autocomplete for command menu
    set splitbelow                 " Splits open at the bottom, which is non-retarded, unlike vim defaults.
    set splitright                 " Splits open at the right, which is non-retarded, unlike vim defaults.
    set noswapfile                 " NO SWAP FILES
    "set list                       " Show indentations
    set wildcharm=<C-z>             "Juggling with buffers

" Leader Things
    let mapleader=' '

"Turn off search highlight bullshit to Comma and then Leader/space
    nnoremap ,<leader> :nohlsearch<CR>

" FZF to leader+f
    nnoremap <leader>f :FZF<CR>

" Goyo start Writing!
    nnoremap <leader>G :Goyo<CR>

"Go to to previous buffer
    nnoremap <leader>h :bp<CR>

"Jumplist stuff -> Backward and forward in vim jumps
    nnoremap <leader>i <C-i>
    nnoremap <leader>o <C-o>

" Fixing vim because I break it Later -> Move better lol
    noremap <leader>j J

"Go to to next buffer
    nnoremap <leader>l :bn<CR>

"Preview Marks!
    nnoremap  <leader>m :marks<CR>

"Copy & Paste into vim in normal mode
    noremap <leader>p  "+p
    noremap <leader>y  "+y

"leader r is open register
    nnoremap <leader>r :reg<CR>

"Quicksave and Quickquit in vim!
    nnoremap <leader>s :update<cr>
    nnoremap <leader>q :q!<CR>

"Split window
    nnoremap <leader>vs :split<Return><C-w>w
    nnoremap <leader>vv :vsplit<Return><C-w>w

"Make leader+w = ctrl + w to move between windows
    noremap <leader>w <C-w>

