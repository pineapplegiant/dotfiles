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
    "Remember kids 'gd' for searching under cursor is ur friend
    "zL and zH let you view to the left and right for long lines
    "zt lets you make the current line up at the top of viewport
    " gu  : Change current line from UPPER to lower.
    " gU  : Change current line from lower to UPPER.
    " nnoremap is for normal mode - map for all and noremap for most
    " Plugin for writing -> :GOYO to minimize distraction
        " Limelight [0.0 ~ 1.0] Turn Limelight on with additional tint


"----------------------------------------------------------------------
" Colors for a rainy day
"----------------------------------------------------------------------
    "colorscheme Dracula
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
    set wildignorecase
    set wildignore=*.swp,*.bak
    set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*
    set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
    set wildignore+=tags
    set wildignore+=*.tar.*
    set noswapfile                 " NO SWAP FILES
    set list                       " Show indentations
    "set listchars=tab:\|\<Space


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


"----------------------------------------------------------------------
" GOYO && LIMELIGHT && PENCIL FOR WRITING TODO- { still in progress }
"----------------------------------------------------------------------
    let g:limelight_default_coefficient = 0.7
    let g:limelight_paragraph_span = 1
    let g:pencil#wrapModeDefault = 'soft'   " default is 'hard

    function! s:goyo_enter()
        Goyo 72
        silent !tmux set status off
        silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
        set noshowmode
        set noshowcmd
        "set scrolloff=999
        set spell
        colorscheme pencil
        set background=light
        Limelight
        call pencil#init()

    endfunction

    function! s:goyo_leave()
        silent !tmux set status on
        silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
        set showmode
        set showcmd
        set scrolloff=3
        set nospell
        colorscheme tokyo-metro
        set background=dark
        Limelight!
        PencilOff
        IndentLinesReset

    endfunction

    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()



"----------------------------------------------------------------------
"               Map Leader to '<space>' All things Leader
"----------------------------------------------------------------------

    let mapleader=' '

"Turn off search highlight bullshit to Comma and then Leader/space
    nnoremap ,<leader> :nohlsearch<CR>

"Quicksave and Quickquit in vim!
    nnoremap <leader>s :update<cr>
    nnoremap <leader>q :q!<CR>

"Copy & Paste into vim in normal mode
    noremap <leader>p  "+p
    noremap <leader>y  "+y

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
    "nnoremap <leader>d :bd!<CR>

"Preview Marks!
    nnoremap  <leader>m :marks<CR>

"Jumplist stuff -> Forward and back in vim jumps
    nnoremap <leader>o <C-o>
    nnoremap <leader>i <C-i>

" FZF to leader+f
    nnoremap <leader>f :FZF<CR>


"Split window
    nnoremap <leader>vs :split<Return><C-w>w
    nnoremap <leader>vv :vsplit<Return><C-w>w

" Fixing vim because I break it Later -> Move better lol
    nnoremap <leader>G :Goyo<CR>

" Fixing vim because I break it Later -> Move better lol
    noremap <leader>j J


"----------------------------------------------------------------------
" General Re-mappings
"----------------------------------------------------------------------

"Remap Capital J/K to move up and down blocks
    noremap J }
    noremap K {

"Remap ctrl-L and ctrl-H to scroll left & right
    map <C-L> 20zl
    map <C-H> 20zh

"Set U as Ctrl R which means Redo
    nnoremap U <C-R>

"Use B to move to beginning of line in most modes
    noremap B ^

" Use E to move to end of line in most modes
    noremap E $

" Map ,, to % because i like cycling brackets a lot
    nnoremap ,, %

"Commenting blocks of code.
    autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
    autocmd FileType sh,ruby,python   let b:comment_leader = '# '
    autocmd FileType conf,fstab       let b:comment_leader = '# '
    autocmd FileType tex              let b:comment_leader = '% '
    autocmd FileType mail             let b:comment_leader = '> '
    autocmd FileType vim              let b:comment_leader = '" '
    noremap gcc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
    noremap gcu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

"Align blocks of text and keep them selected
    vmap < <gv
    vmap > >gv

"Lots of Time-Stamp Options here in normal/insert mode to paste timestamp and F4 To Date Stamp
    nnoremap <F4> "=strftime("%Y-%m-%d")<CR>P
    inoremap <F4> <C-R>=strftime("%Y-%m-%d")<CR>
    nnoremap <F5> "=strftime("%H:%M:%S")<CR>P
    inoremap <F5> <C-R>=strftime("%H:%M:%S")<CR>
    nnoremap <F6> "=strftime("%c")<CR>P
    inoremap <F6> <C-R>=strftime("%c")<CR>
    nnoremap <F7> "=strftime("%A %B %d, at%l:%M %Z")<CR>P
    inoremap <F7> <C-R>=strftime("%A %B %d, at%l:%M %Z")<CR>


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

"----------------------------------------------------------------------
" Endings
"----------------------------------------------------------------------
" Put these lines at the very end of your vimrc file.  Load all plugins now
" for ale
" Plugins need to be added to runtimepath before helptags can be generated.
    packloadall
" Load all of the helptags now, after plugins have been loaded.All messages and errors will be ignored.
    silent! helptags ALL
