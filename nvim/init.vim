"  ________    ___      ___  ___   _____ ______    ________   ________     
" |\   ___  \ |\  \    /  /||\  \ |\   _ \  _   \ |\   __  \ |\   ____\    
" \ \  \\ \  \\ \  \  /  / /\ \  \\ \  \\\__\ \  \\ \  \|\  \\ \  \___|    
"  \ \  \\ \  \\ \  \/  / /  \ \  \\ \  \\|__| \  \\ \   _  _\\ \  \       
"   \ \  \\ \  \\ \    / /    \ \  \\ \  \    \ \  \\ \  \\  \|\ \  \____  
"    \ \__\\ \__\\ \__/ /      \ \__\\ \__\    \ \__\\ \__\\ _\ \ \_______\
"     \|__| \|__| \|__|/        \|__| \|__|     \|__| \|__|\|__| \|_______|
"                                                                          

" Find stuff in vanilla vim? Wow
    set path+=**

""""" Map Leader to '<space>' All things Leader ->
    let mapleader=' '

" Turn off search highlight bullshit to Comma and then Space
    nnoremap ,<leader> :nohlsearch<CR>

" Quicksave and Quit in vim! 
    noremap <leader>s :update<CR>
    noremap <leader>q :q!<cr>

" Copy & Paste into vim in normal mode
    noremap <leader>p  "+p
    noremap <leader>y  "+y

" Make leader+w = ctrl + w to move between windows
    noremap <leader>w <C-w>

" Make leader j = captil J--> not good but screw it
    noremap <leader>j J

" leader r is open register
    noremap <leader>r :reg<CR>
    
" Autocomplete word in insert mode
    inoremap <Leader>nn <C-n>
    
" Go to to previous buffer
    noremap <Leader>h :bp<CR>

" Go to to next buffer
    noremap <Leader>l :bn<CR>
""""""""
" Remap Capital J/K to move up and down blocks
    noremap J }
    nnoremap K {

" Set U as Ctrl R which means Redo
    nnoremap U <C-R>

" Split window
    nmap ss :split<Return><C-w>w
    nmap sv :vsplit<Return><C-w>w

" Use B to move to beginning of line
    nnoremap B ^
    nnoremap vB v^
    nnoremap dB d^
    nnoremap cB c^
" Use E to move to end of line
    nnoremap E $
    nnoremap vE v$
    nnoremap dE d$
    nnoremap cE c$

"""""Basic Preference Things
    set background=light
    set spelllang=en_us           " Turn on spell check?
    let &t_SI = "\<Esc>[5 q"      " Turn on blinking-block normal mode
    let &t_EI = "\<Esc>[1 q"      " Turn on blinking-line insert mode 
    syntax enable		          " Turn on Syntax highlighting
    set number
    set nospell                   " Turn on Line Number
    set mouse=a		              " Allow Mouse to work (I know, I suck)
    set autoindent			      " Makes it so that things are  indented when needed (i think)
    set cursorline                " Cursorline in vim 
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

" Align blocks of text and keep them selected
    vmap < <gv
    vmap > >gv

" Press F5 in normal/insert mode to paste timestamp and F4 To Date Stamp
    nnoremap <F4> "=strftime("%Y-%m-%d")<CR>P
    nnoremap <F5> "=strftime("%H:%M:%S")<CR>P 
    inoremap <F5> "=strftime("%H:%M:%S")<CR>P

" List all buffers and jump to them using 'gb'
    nnoremap gb :ls<CR>:b<Space>

" List all recently opened files and open a new buffer
    nnoremap gs :browse oldfiles<CR>


"""""Snippets!

" Basic HTML Snippet!
    nnoremap ,html :1-read $HOME/.config/nvim/snippets/skeleton.html<CR>4j3wa

" Basic yaml snippet
    " nnoremap ,post :1-read $HOME/.config/nvim/snippets/post.html<CR>4j3wa

