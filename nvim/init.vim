" ________    ___      ___  ___   _____ ______    ________   ________     
" |\   ___  \ |\  \    /  /||\  \ |\   _ \  _   \ |\   __  \ |\   ____\    
" \ \  \\ \  \\ \  \  /  / /\ \  \\ \  \\\__\ \  \\ \  \|\  \\ \  \___|    
"  \ \  \\ \  \\ \  \/  / /  \ \  \\ \  \\|__| \  \\ \   _  _\\ \  \       
"   \ \  \\ \  \\ \    / /    \ \  \\ \  \    \ \  \\ \  \\  \|\ \  \____  
"    \ \__\\ \__\\ \__/ /      \ \__\\ \__\    \ \__\\ \__\\ _\ \ \_______\
"     \|__| \|__| \|__|/        \|__| \|__|     \|__| \|__|\|__| \|_______|
"                                                                          

"----------------------------------------------------------------------
" Notes for a healthy reminder
"----------------------------------------------------------------------
    "Remember kids 'gd' for searching under ur cursor is ur friend
    "zL and zH let you view to the left and right for long lines
    "zt lets you make the current line up at the top
    " gu  : Change current line from UPPER to lower.  
    " gU  : Change current line from lower to UPPER.
    " nnoremap is for normal mode
    

"----------------------------------------------------------------------
" Colors for a rainy day
"----------------------------------------------------------------------
    "colorscheme Dracula
    "colorscheme peachpuff
    "colorscheme spaceduck -> soon
    
" Colorscheme things
    set background=dark
    set termguicolors
    colorscheme tokyo-metro


"----------------------------------------------------------------------
" Basic Preference Things
"----------------------------------------------------------------------
    set hidden 
    set background=light
    set ignorecase                " Ignorecase when searching stuff  
    set spelllang=en_us           " Turn on spell check?
    syntax enable		          " Turn on Syntax highlighting
    set number                    " Turn on Line Number
    set nospell                   " Allow for spellcheck?
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
    set backspace=indent,eol,start" Allow backspace in insert mode
    set scrolloff=3               " When scrolling, keep cursor 3 lines away from screen border
    set nowrap                    " Wrap lines when they are too long
    set title                     " Update the title of the window or the terminal  
    let python_hightlight_all = 1 " Who knows if this really works
    set wildmenu                  " Visual autocomplete for command menu
    set wildignorecase
    set wildignore=*.swp,*.bak
    set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*
    set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
    set wildignore+=tags
    set wildignore+=*.tar.*
    set noswapfile                 " NO SWAP FILES

"----------------------------------------------------------------------
" PLUGINS RIP
"----------------------------------------------------------------------
" Fuzzy Find?
    set rtp+=/usr/local/opt/fzf

" Airline & Themes enabled
    let g:airline_powerline_fonts = 1
    let g:airline_section_b = '%{strftime("%c")}'
    let g:airline_section_y = 'BN: %{bufnr("%")}'
    let g:airline_theme='deep_space'
    
" Tabs for airline 
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#formatter = 'default'

"----------------------------------------------------------------------
" Map Leader to '<space>' All things Leader
"----------------------------------------------------------------------
    let mapleader=' '

"Turn off search highlight bullshit to Comma and then Leader/space
    nnoremap ,<leader> :nohlsearch<CR>

"Quicksave and Quickquit in vim! 
    nnoremap <leader>s :update<cr>
    nnoremap <leader>q :q!<CR>

"Copy & Paste into vim in normal mode
    nnoremap <leader>p  "+p
    nnoremap <leader>y  "+y

"Make leader+w = ctrl + w to move between windows
    noremap <leader>w <C-w>

"leader r is open register
    nnoremap <leader>r :reg<CR>
    
"Go to to previous buffer
    nnoremap <leader>h :bp<CR>

"Go to to next buffer
    nnoremap <leader>l :bn<CR>

"Juggling with buffers 
    set wildcharm=<C-z>
    nnoremap <leader>d :bd!<CR>

"Preview Marks!
    nnoremap  <leader>m :marks<CR>

"Jumplist stuff -> Forward and back in vim jumps
    nnoremap <leader>o <C-o>
    nnoremap <leader>i <C-i>

" FZF to leader+f
    nnoremap  <leader>f :FZF<CR>


"Split window
    nnoremap <leader>ss :split<Return><C-w>w
    nnoremap <leader>sv :vsplit<Return><C-w>w

"----------------------------------------------------------------------
" More Re-mappings
"----------------------------------------------------------------------

"Remap ctrl-L and ctrl-H to scroll left & right
    map <C-L> 20zl 
    map <C-H> 20zh

" Fixing vim because I break it in the next block
    noremap <leader>j J

"Remap Capital J/K to move up and down blocks
    noremap J }
    noremap K {

"Set U as Ctrl R which means Redo
    nnoremap U <C-R>

"Use B to move to beginning of line
    nnoremap B ^
    nnoremap vB v^
    nnoremap dB d^
    nnoremap cB c^
" Use E to move to end of line
    nnoremap E $
    nnoremap vE v$
    nnoremap dE d$
    nnoremap cE c$

" Map ,, to % because i like cycling brackets a lot
    nnoremap ,, %
"Commenting blocks of code.
    autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
    autocmd FileType sh,ruby,python   let b:comment_leader = '# '
    autocmd FileType conf,fstab       let b:comment_leader = '# '
    autocmd FileType tex              let b:comment_leader = '% '
    autocmd FileType mail             let b:comment_leader = '> '
    autocmd FileType vim              let b:comment_leader = '" '
    nnoremap <silent> <leader>cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
    nnoremap <silent> <leader>cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>


"Align blocks of text and keep them selected
    vmap < <gv
    vmap > >gv

"Press F5 in normal/insert mode to paste timestamp and F4 To Date Stamp
    noremap <F4> "=strftime("%Y-%m-%d")<CR>P
    noremap <F5> "=strftime("%H:%M:%S")<CR>P 

"List all buffers and jump to them using 'gb'
    nnoremap gb :ls<CR>:b<Space>

"List all recently opened files and open a new buffer
    nnoremap gs :browse oldfiles<CR>
"----------------------------------------------------------------------
" Snippets!
"----------------------------------------------------------------------

"Basic HTML Snippet!
    nnoremap ,html :-read $HOME/.config/nvim/snippets/skeleton.html<CR>4j3wa

"Basic yaml snippet
    nnoremap ,post :-read $HOME/.config/nvim/snippets/post.md<CR>5ja

