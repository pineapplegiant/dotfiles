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

   " If I installed my own theme then use it, if not then nahh
   try
       colorscheme spaceduck
    catch
        colorscheme default
    endtry

"----------------------------------------------------------------------
"               Basic Preference Things
"----------------------------------------------------------------------
    set nocompatible              " be iMproved, required for normie Vim
    filetype plugin indent on
    syntax enable                  " Turn on Syntax highlighting
    set nolazyredraw               " Hopefully makes it so nvim doesn't get buggy screen probs
    set number                     " Turn on Line Number
    set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50 "Fix cursor in insert mode
     \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
     \,sm:block-blinkwait175-blinkoff150-blinkon175
    set hidden                     " Ok IDK what this does
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
    set splitbelow                 " Splits open at the bottom, unlike vim defaults.
    set splitright                 " Splits open at the right, unlike vim defaults.
    set wildignorecase
    set wildignore=*.swp,*.bak
    set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*
    set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
    set wildignore+=tags
    set wildignore+=*.tar.*
    set noswapfile                 " NO SWAP FILES
    set wildcharm=<C-z>            " Juggling with buffers

" Disable automatic comment insertion
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"" Just softabs for the homies
    autocmd Filetype css setlocal  tabstop=2 shiftwidth=2 softtabstop=2  " Set tabs to 2 spaces in html and css
    autocmd Filetype html setlocal  tabstop=2 shiftwidth=2 softtabstop=2 " Set tabs to 2 spaces in html and css
    autocmd Filetype javascript  setlocal  tabstop=2 shiftwidth=2 softtabstop=2  " Set tabs to 2 spaces in html and css

" Turn off Cursorline in insert mode
    autocmd InsertLeave,WinEnter * set cursorline
    autocmd InsertEnter,WinLeave * set nocursorline

"Set Handlebars up like regular ol' HTML
    autocmd Filetype *.handlebars set filetype=html
augroup vimrc
  autocmd!

" Hopefully delete Netrw mappings
  autocmd FileType netrw call s:RemoveNetrwMap()
augroup END

function s:RemoveNetrwMap()
  if hasmapto('<Plug>NetrwRefresh')
    unmap <buffer> <C-l>
  endif
endfunction