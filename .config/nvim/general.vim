" ________    ___      ___  ___   _____ ______    ________   ________
" |\   ___  \ |\  \    /  /||\  \ |\   _ \  _   \ |\   __  \ |\   ____\
" \ \  \\ \  \\ \  \  /  / /\ \  \\ \  \\\__\ \  \\ \  \|\  \\ \  \___|
"  \ \  \\ \  \\ \  \/  / /  \ \  \\ \  \\|__| \  \\ \   _  _\\ \  \
"   \ \  \\ \  \\ \    / /    \ \  \\ \  \    \ \  \\ \  \\  \|\ \  \____
"    \ \__\\ \__\\ \__/ /      \ \__\\ \__\    \ \__\\ \__\\ _\ \ \_______\
"     \|__| \|__| \|__|/        \|__| \|__|     \|__| \|__|\|__| \|_______|


"----------------------------------------------------------------------
"               Basic Preference Things
"----------------------------------------------------------------------
    set nocompatible               " Better safe than sorry to have this on
    filetype plugin indent on      " Vim super sucks man
    syntax enable                  " Turn on Syntax highlighting
    set number                     " ESSENTIAL -> Turn on Line Number
    set backspace=indent,eol,start " Allow backspace in insert mode
    set hidden                     " Let's vim use buffers in background without having to save
    set nolazyredraw               " Makes vim not redraw while performing macros
    set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50 "Fix cursor in insert mode
     \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
     \,sm:block-blinkwait175-blinkoff150-blinkon175
    let &t_SI = "\e[6 q"           " Just block vim cursor things
    let &t_EI = "\e[2 q"           " Just block vim cursor things
    set ignorecase                 " Ignorecase when searching stuff
    set spelllang=en_us            " english muthafucka do you speak it?
    set nospell                    " Turn off spellcheck
    set mouse=a                    " Allow the mouse to work, what? sue me
    set autoindent                 " Makes it indented in insert mode on new lines
    set cursorline                 " Show a line under the cursor
    set expandtab                  " Use spaces instead of tabs
    set tabstop=4                  " TAB becomes 4 spaces
    set softtabstop=4              " TAB becomes 4 spaces in Vim operations
    set shiftwidth=4               " Number of spaces for indentation
    set numberwidth=4              " Padding of space in the side number column
    set hlsearch                   " Highlight search results
    set incsearch                  " Turn on incremental searching
    set showcmd                    " Show (partial) command in the last line of the screen
    set scrolloff=2                " When scrolling, keep cursor 2 lines away from screen border
    set nowrap                     " Don't wrap lines when they are too long
    set title                      " Title of the window is set to 'titlestring' or filename
    set wildmode=longest,list,full " First tab complete to longest string second tab will complete to first full match and open the wildmenu
    set wildmenu                   " Set autocomplete for the command menu
    set splitbelow                 " When splitting a window open at the bottom
    set splitright                 " When splitting a window open at the right
    set wildignorecase             " Completing file names and directories 
    set wildignore=*.swp,*.bak     " List of file patterns that vim will ignore
    set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*
    set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
    set wildignore+=tags
    set wildignore+=*.tar.*
    set noswapfile                 " NO SWAP FILES
    set wildcharm=<C-z>            " Juggling with buffers
    set list                       " Be aware of trailing spaces
    set listchars=tab:‣\ ,trail:·
    set colorcolumn=99999          " Indentblankline quick fix

" Disable automatic comment insertion
    augroup betterComments
        autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    augroup END

" Just softabs to 2 for the homies
    augroup filetype_webdev
        autocmd!
        autocmd Filetype css setlocal  tabstop=2 shiftwidth=2 softtabstop=2
        autocmd Filetype html setlocal  tabstop=2 shiftwidth=2 softtabstop=2
        autocmd Filetype javascript  setlocal  tabstop=2 shiftwidth=2 softtabstop=2
" Set Handlebars up like regular ol' HTML
        autocmd Filetype *.handlebars set filetype=html 
    augroup END

" Turn off Cursorline in insert mode
    augroup betterCursor
        autocmd!
        autocmd InsertLeave,WinEnter * set cursorline
        autocmd InsertEnter,WinLeave * set nocursorline
    augroup END
