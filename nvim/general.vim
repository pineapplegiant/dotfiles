" ________    ___      ___  ___   _____ ______    ________   ________
" |\   ___  \ |\  \    /  /||\  \ |\   _ \  _   \ |\   __  \ |\   ____\
" \ \  \\ \  \\ \  \  /  / /\ \  \\ \  \\\__\ \  \\ \  \|\  \\ \  \___|
"  \ \  \\ \  \\ \  \/  / /  \ \  \\ \  \\|__| \  \\ \   _  _\\ \  \
"   \ \  \\ \  \\ \    / /    \ \  \\ \  \    \ \  \\ \  \\  \|\ \  \____
"    \ \__\\ \__\\ \__/ /      \ \__\\ \__\    \ \__\\ \__\\ _\ \ \_______\
"     \|__| \|__| \|__|/        \|__| \|__|     \|__| \|__|\|__| \|_______|

"----------------------------------------------------------------------
"               Colors for a rainy day
"----------------------------------------------------------------------
    if exists('+termguicolors')
      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
      let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
      set termguicolors
    endif

   colorscheme spaceduck
   "colorscheme peachpuff
   "colorscheme tokyo-metro
   "colorscheme iceberg

"----------------------------------------------------------------------
"               Basic Preference Things
"----------------------------------------------------------------------
    "syntax enable                  " Turn on Syntax highlighting
    set number                     " Turn on Line Number
    set guicursor=n-v-c:block-Cursor " Hopefully make cursor better in insert
    set hidden                     " Ignorecase when searching stuff
    set ignorecase                 " Ignorecase when searching stuff
    set spelllang=en_us            " Turn on spell check?
    set nospell                    " Turn off spellcheck
    set mouse=a                    " Allow Mouse to work (I know, I suck)
    set autoindent                 " Makes it so that things are indented when needed (i think)
    set cursorline                 " Cursorline in vim
    set expandtab                  " Tabs are spaces
    set tabstop=4                  " TAB becomes 4 spaces
    set softtabstop=4              " TAB becomes 4 spaces in Vim operations
    set shiftwidth=4               " Number of spaces for indentation
    set hlsearch                   " Highlight search results
    set incsearch                  " Turn on incremental searching
    set showcmd                    " Turn on Cmd as typed on the bottom-bar
    set backspace=indent,eol,start " Allow backspace in insert mode
    set scrolloff=2                " When scrolling, keep cursor 2 lines away from screen border
    set nowrap                     " Wrap lines when they are too long
    set title                      " Update the title of the window or the terminal
    set wildmode=longest,list,full " List as much as possible
    set wildmenu                   " Visual autocomplete for command menu
    set splitbelow                 " Splits open at the bottom, which is non-retarded, unlike vim defaults.
    set splitright                 " Splits open at the right, which is non-retarded, unlike vim defaults.
    set wildignorecase
    set wildignore=*.swp,*.bak
    set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*
    set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
    set wildignore+=tags
    set wildignore+=*.tar.*
    set noswapfile                 " NO SWAP FILES
    set wildcharm=<C-z>             "Juggling with buffers

    autocmd Filetype css  setlocal  tabstop=2 shiftwidth=2 softtabstop=2 " Set tabs to 2 spaces in html and css
    autocmd Filetype html setlocal  tabstop=2 shiftwidth=2 softtabstop=2 " Set tabs to 2 spaces in html and css

" Turn off Cursorline in insert mode
    autocmd InsertLeave,WinEnter * set cursorline
    autocmd InsertEnter,WinLeave * set nocursorline
