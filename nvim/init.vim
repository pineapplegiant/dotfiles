" ________    ___      ___  ___   _____ ______    ________   ________
" |\   ___  \ |\  \    /  /||\  \ |\   _ \  _   \ |\   __  \ |\   ____\
" \ \  \\ \  \\ \  \  /  / /\ \  \\ \  \\\__\ \  \\ \  \|\  \\ \  \___|
"  \ \  \\ \  \\ \  \/  / /  \ \  \\ \  \\|__| \  \\ \   _  _\\ \  \
"   \ \  \\ \  \\ \    / /    \ \  \\ \  \    \ \  \\ \  \\  \|\ \  \____
"    \ \__\\ \__\\ \__/ /      \ \__\\ \__\    \ \__\\ \__\\ _\ \ \_______\
"     \|__| \|__| \|__|/        \|__| \|__|     \|__| \|__|\|__| \|_______|
"


"----------------------------------------------------------------------
" NOTES FOR A HEALTHY REMINDER
"----------------------------------------------------------------------
    "Remember kids 'gd' for searching under cursor is ur friend
    "zL and zH let you view to the left and right for long lines
    "zt lets you make the current line up at the top of viewport
    " gu  : Change current line from UPPER to lower.
    " gU  : Change current line from lower to UPPER.
    " nnoremap is for normal mode - map for all and noremap for most
    " Plugin for writing -> :GOYO to minimize distraction
        " Limelight [0.0 ~ 1.0] Turn Limelight on with additional tint
    " 'z=' is for checking spell suggestions
    " s] is for checking the next spelling suggestion
    " [count]<leader>cc |NERDComComment| Comment out the current line or text selected in visual mode.
    " [count]<leader>cn |NERDComNestedComment| Force Comment
    " [count]<leader>c<space> |NERDComNestedComment| Force Comment


"----------------------------------------------------------------------
" Colors for a rainy day
"----------------------------------------------------------------------
    "colorscheme dracula
    "colorscheme peachpuff
    "colorscheme spaceduck
    colorscheme tokyo-metro

" Colorscheme things
    set background=dark
    set termguicolors


"----------------------------------------------------------------------
" Basic Preference Things
"----------------------------------------------------------------------
    set guicursor=n-v-c:block-Cursor " Hopefully make cursor better in insert
    set hidden                     " Ignorecase when searching stuff
    set ignorecase                 " Ignorecase when searching stuff
    set spelllang=en_us            " Turn on spell check?
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
    let python_hightlight_all = 1  " Who knows if this really works
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
    set list                       " Show indentations
    set wildcharm=<C-z>             "Juggling with buffers

    autocmd Filetype css setlocal  tabstop=2 shiftwidth=2 softtabstop=2 " Set tabs to 2 spaces in html and css
    autocmd Filetype html setlocal tabstop=2 shiftwidth=2 softtabstop=2 " Set tabs to 2 spaces in html and css

"----------------------------------------------------------------------
"                        PLUGINS RIP
"----------------------------------------------------------------------
    set rtp+=/usr/local/opt/fzf                      " Fuzzy Find?
    set rtp+=~/.vim-plugins/LanguageClient-neovim


"----------------------------------------------------------------------
" Airline
"----------------------------------------------------------------------
    "let g:airline_theme='tokyometro'                " Airline & Themes enabled
    "let g:airline_powerline_fonts = 1               " Let there be powerline for pretty arrow
    "let g:airline_section_b = '%{strftime("%c")}'
    "let g:airline_section_y = 'BN: %{bufnr("%")}'
    "let g:airline#extensions#tabline#enabled = 1   " Tabs for airline

"----------------------------------------------------------------------
" Nerdtree
"----------------------------------------------------------------------
" Map nerdtree to Ctrl+n
    map <C-n> :NERDTreeToggle<CR>
    
" Nerdtree size smaller
    let g:NERDTreeWinSize=18

" Let Nerdtree close if it's the last window open!
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"----------------------------------------------------------------------
" Lightline
"----------------------------------------------------------------------

let g:lightline = {
      \ 'colorscheme': 'tokyometro',
      \ }


"----------------------------------------------------------------------
" Markdown Preview
"----------------------------------------------------------------------
    let g:mkdp_open_to_the_world = 1        " Markdown preview to the world


"----------------------------------------------------------------------
" Indent-Line
"----------------------------------------------------------------------
    let g:indentLine_char = '▏'             " Show Indentation lines
    let g:indentLine_color_gui = '#474747'  " Make them pretty-gray-lines

    autocmd FileType markdown let g:indentLine_enabled=0

"----------------------------------------------------------------------
" RMD map for compiling
"----------------------------------------------------------------------

    autocmd Filetype rmd map <F10> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>


"----------------------------------------------------------------------
" GOYO && LIMELIGHT && PENCIL FOR WRITING TODO- { still in progress }
"----------------------------------------------------------------------
    let g:limelight_default_coefficient = 0.7
    "let g:limelight_paragraph_span = 1
    let g:pencil#wrapModeDefault = 'soft'   " default is 'hard

" GOYO start!
    function! s:goyo_enter()
        let b:quitting = 0
        let b:quitting_bang = 0
        autocmd QuitPre <buffer> let b:quitting = 1
        cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!

        Goyo 72
        silent !tmux set status off
        silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
        set noshowmode
        set noshowcmd
        "set scrolloff=999
        set spell
        colorscheme pencil
        set background=light
        set nocursorline
        Limelight
        call pencil#init()
        set conceallevel=2

    endfunction


" Let GOYO quit
    function! s:goyo_leave()
        " Quit Vim if this is the only remaining buffer
        if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
          if b:quitting_bang
            qa!
          else
            qa
          endif
        endif

        silent !tmux set status on
        silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
        set showmode
        set showcmd
        set scrolloff=3
        set nospell
        colorscheme tokyo-metro
        set background=dark
        set cursorline
        Limelight!
        PencilOff
        IndentLinesReset
        set conceallevel=0

    endfunction

    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()



"----------------------------------------------------------------------
"               Map Leader to '<space>' All things Leader
"----------------------------------------------------------------------
" List of used leader combo:
" d f G h i o j l m n p y r s q vs vv w cc cn c<space> z

    let mapleader=' '

" Turn off search highlight bullshit to Comma + Leader/space
    nnoremap ,<leader> :nohlsearch<CR>

" FZF to leader+f
    nnoremap <leader>f :FZF<CR>

" Goyo start Writing!
    nnoremap <leader>G :Goyo<CR>

" Delete Buffer, but keep the window open
    nnoremap <leader>d :bp\|bd! #<CR>

" Go to to previous buffer
    nnoremap <leader>h :bp<CR>

" Jumplist stuff -> Backward and forward in vim jumps
    nnoremap <leader>i <C-i>
    nnoremap <leader>o <C-o>

" Fixing vim because I break it Later -> Move better lol
    noremap <leader>j J

" Go to to next buffer
    nnoremap <leader>l :bn<CR>

" Preview Marks!
    nnoremap  <leader>m :marks<CR>

" Make leader+n = ctrl + w to move between windows
    nnoremap  <leader>n :NERDTreeRefreshRoot<CR>

" Copy & Paste into vim in normal mode
    noremap <leader>p  "+p
    noremap <leader>y  "+y

" leader r is open register
    nnoremap <leader>r :reg<CR>

" Quicksave and Quickquit in vim!
    nnoremap <leader>s :update<cr>
    nnoremap <leader>q :q!<CR>

" Split window
    nnoremap <leader>vs :split<Return><C-w>w
    nnoremap <leader>vv :vsplit<Return><C-w>w

" Make leader+w = ctrl + w to move between windows
    noremap <leader>w <C-w>

" Make leader+z = create new terminal window
    nnoremap <leader>z :new<CR>:resize 10<CR>:set nonumber<CR>:terminal<CR>A source $HOME/.bash_profile<CR>clear<CR>

"----------------------------------------------------------------------
" General Re-mappings
"----------------------------------------------------------------------

" Remap Capital J/K to move up and down blocks
    noremap J }
    noremap K {

" Remap ctrl-L and ctrl-H to scroll left & right
    map <C-L> 20zl
    map <C-H> 20zh

" Set U as Ctrl R which means Redo
    nnoremap U <C-R>

" Use B to move to beginning of line in most modes
    map B 0

" Use E to move to end of line in most modes
    map E $

" Map ,, to % because i like cycling brackets a lot
    nnoremap ,, %

" Align blocks of text and keep them selected
    vmap < <gv
    vmap > >gv

" Lots of Time-Stamp Options here in normal/insert mode to paste timestamp and F4 To Date Stamp
    nnoremap <F4> "=strftime("%Y-%m-%d")<CR>p
    inoremap <F4> <C-R>=strftime("%Y-%m-%d")<CR>
    nnoremap <F5> "=strftime("%A %B %d %Y, at %I:%M %p %Z")<CR>P
    inoremap <F5> <C-R>=strftime("%A %B %d, at %I:%M %p %Z")<CR>
    nnoremap <F6> "=strftime("%H:%M:%S")<CR>p
    inoremap <F6> <C-R>=strftime("%H:%M:%S")<CR>

" List all buffers and jump to them using 'gb'
    nnoremap gb :ls<CR>:b<Space>

" List all recently opened files and open a new buffer
    nnoremap gs :browse oldfiles<CR>

" Set F12 as Make in VIM!
    map <F12> :!make<CR>

" Set ctrlq as jump out of vim terminal mode
    tnoremap hh <C-\><C-n>

"----------------------------------------------------------------------
" Snippets!
"----------------------------------------------------------------------

" Basic HTML Snippet!
    nnoremap ,html :read $HOME/.config/nvim/snippets/skeleton.html<CR>7jf>a

" List of HTML completion snippets
    autocmd FileType html inoremap h1 <h1></h1><ESC>F>a
    autocmd FileType html inoremap h2 <h2></h2><ESC>F>a
    autocmd FileType html inoremap h3 <h3></h3><ESC>F>a
    autocmd FileType html inoremap h4 <h4></h4><ESC>F>a
    autocmd FileType html inoremap h5 <h5></h5><ESC>F>a
    autocmd FileType html inoremap h6 <h6></h6><ESC>F>a

" Post snippet
    nnoremap ,post :-1read $HOME/.config/nvim/snippets/post.md<CR>

" YAML snippet
    nnoremap ,yaml :-1read $HOME/.config/nvim/snippets/yaml.md<CR>

" MLK's Dream Speech
    nnoremap ,mlk :read $HOME/.config/nvim/snippets/mlk.txt<CR>

" Job snippet
    nnoremap ,job :read $HOME/.config/nvim/snippets/job.txt<CR>

" School's C++ top snippet
    nnoremap ,top :-1read $HOME/.config/nvim/snippets/top.txt<CR>2jA <C-R>=strftime("%A %B %d %Y, at %I:%M %p %Z")<CR><ESC>jA 

" School's Function block snippet
    nnoremap ,block :read $HOME/.config/nvim/snippets/block.txt<CR>jA

" C++ int main()
    nnoremap ,c++ :read $HOME/.config/nvim/snippets/c++.txt<CR>jo<tab>


"----------------------------------------------------------------------
" Endings
"----------------------------------------------------------------------
