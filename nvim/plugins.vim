" ________    ___      ___  ___   _____ ______    ________   ________
" |\   ___  \ |\  \    /  /||\  \ |\   _ \  _   \ |\   __  \ |\   ____\
" \ \  \\ \  \\ \  \  /  / /\ \  \\ \  \\\__\ \  \\ \  \|\  \\ \  \___|
"  \ \  \\ \  \\ \  \/  / /  \ \  \\ \  \\|__| \  \\ \   _  _\\ \  \
"   \ \  \\ \  \\ \    / /    \ \  \\ \  \    \ \  \\ \  \\  \|\ \  \____
"    \ \__\\ \__\\ \__/ /      \ \__\\ \__\    \ \__\\ \__\\ _\ \ \_______\
"     \|__| \|__| \|__|/        \|__| \|__|     \|__| \|__|\|__| \|_______|
"

"----------------------------------------------------------------------
"                        PLUGINS RIP
"----------------------------------------------------------------------
    " Make sure you have vim-plug installed ~/.local/share/nvim/site/autoload/plug.vim
    call plug#begin('~/.local/share/nvim/plugged')
    " Colors & Pretty
    Plug 'cocopon/colorswatch.vim'
    Plug 'ap/vim-css-color'
    Plug 'sheerun/vim-polyglot'
    Plug 'itchyny/lightline.vim'
    Plug 'edkolev/tmuxline.vim'
    Plug 'bling/vim-bufferline'
    " Moving around
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'scrooloose/nerdtree'
    " Essential
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'jiangmiao/auto-pairs'
    Plug 'vim-scripts/The-NERD-Commenter'
    " Git 
    Plug 'airblade/vim-gitgutter'
    " Prose & Writing
    Plug 'junegunn/goyo.vim'
    Plug 'reedes/vim-pencil'
    Plug 'junegunn/limelight.vim'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
    Plug 'vimwiki/vimwiki'
    " HTML
    Plug 'mattn/emmet-vim'
    " Not used, maybe one day?
    "Plug 'neoclide/coc.nvim', {'branch': 'release'}
    "Plug 'ryanoasis/vim-devicons'
    "Plug 'Yggdroot/indentLine' " Low-key messes everything up
    "Plug 'https://github.com/gerw/vim-HiLinkTrace.git'
    call plug#end()

"----------------------------------------------------------------------
"                       Airline
"----------------------------------------------------------------------
    "let g:airline_theme='tokyometro'                " Airline & Themes enabled
    "let g:airline_powerline_fonts = 1               " Let there be powerline for pretty arrow
    "let g:airline_section_b = '%{strftime("%c")}'
    "let g:airline_section_y = 'BN: %{bufnr("%")}'
    "let g:airline#extensions#tabline#enabled = 1   " Tabs for airline

"----------------------------------------------------------------------
"                       Nerdtree
"----------------------------------------------------------------------
" Map nerdtree to Ctrl+n
    map <C-n> :NERDTreeToggle<CR>

" Nerdtree size smaller
    let g:NERDTreeWinSize=18

" Let Nerdtree close if it's the last window open!
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"----------------------------------------------------------------------
"                       Lightline
"----------------------------------------------------------------------

let g:lightline = {
      \ 'colorscheme': 'spaceduck',
      \ 'tabline': {
      \   'left': [ ['bufferline'] ]
      \ },
      \ 'component_expand': {
      \   'bufferline': 'LightlineBufferline',
      \ },
      \ 'component_type': {
      \   'bufferline': 'tabsel',
      \ },
      \ }

function! LightlineBufferline()
  call bufferline#refresh_status()
  return [ g:bufferline_status_info.before, g:bufferline_status_info.current, g:bufferline_status_info.after]
endfunction

"----------------------------------------------------------------------
"                       TMUX-line
"----------------------------------------------------------------------



"----------------------------------------------------------------------
"                   Markdown Preview
"----------------------------------------------------------------------
    let g:mkdp_open_to_the_world = 1        " Markdown preview to the world

"----------------------------------------------------------------------
"                   GOYO && LIMELIGHT && PENCIL WRITING
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
      silent !tmux set status on
      silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
      Limelight!
      source $MYVIMRC
    endfunction

    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()

"----------------------------------------------------------------------
"                       EMMET
"----------------------------------------------------------------------
    "let g:user_emmet_leader_key='<Tab>'

"----------------------------------------------------------------------
"                       VimWiki
"----------------------------------------------------------------------
    let g:vimwiki_dir_link='index'
    let g:vimwiki_list = [{'path': '~/vimwiki/'}]

"----------------------------------------------------------------------
"                       Indent-Line
"----------------------------------------------------------------------
    let g:indentLine_char = '▏'             " Show Indentation lines
    let g:indentLine_color_gui = '#474747'  " Make them pretty-gray-lines

    autocmd FileType markdown,md let g:indentLine_enabled=0
