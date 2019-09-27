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
    Plug 'sheerun/vim-polyglot'
    Plug 'itchyny/lightline.vim'
    Plug 'edkolev/tmuxline.vim'
    Plug 'ryanoasis/vim-devicons'
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
    Plug 'turbio/bracey.vim'
    " NEXT LEVEL SHIT
    "Plug 'Shougo/denite.nvim', { 'do' : ':UpdateRemotePlugins' }
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
    Plug 'liuchengxu/vista.vim'
    " Low-key messes everything up
    Plug 'Yggdroot/indentLine'
    call plug#end()


"----------------------------------------------------------------------
"                       FZF
"----------------------------------------------------------------------
     let $FZF_DEFAULT_OPTS = '--layout=reverse'

     let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }

     function! OpenFloatingWin()
       let height = &lines - 3
       let width = float2nr(&columns - (&columns * 2 / 10))
       let col = float2nr((&columns - width) / 2)

       let opts = {
             \ 'relative': 'editor',
             \ 'row': height * 0.3,
             \ 'col': col + 30,
             \ 'width': width * 2 / 3,
             \ 'height': height / 2
             \ }

       let buf = nvim_create_buf(v:false, v:true)
       let win = nvim_open_win(buf, v:true, opts)

       call setwinvar(win, '&winhl', 'Normal:Pmenu')

       setlocal
             \ buftype=nofile
             \ nobuflisted
             \ bufhidden=hide
             \ nonumber
             \ norelativenumber
             \ signcolumn=no
     endfunction


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
"                       VistaVim
"----------------------------------------------------------------------
    function! NearestMethodOrFunction() abort
      return get(b:, 'vista_nearest_method_or_function', '')
    endfunction

" How each level is indented and what to prepend.
    let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
    let g:vista#renderer#icons = {
    \   "function": "\uf794",
    \   "variable": "\uf71b",
    \  }

"Let Vista run explicitly
    autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

    autocmd BufEnter * if winnr("$") == 1 && vista#sidebar#IsVisible() | q | endif

"----------------------------------------------------------------------
"                       Lightline
"----------------------------------------------------------------------
    function! CocCurrentFunction()
        return get(b:, 'coc_current_function', '')
    endfunction


    let g:lightline = {
          \ 'colorscheme': 'spaceduck',
          \ 'active': {
          \   'left': [ [ 'mode', 'paste' ],
          \             [ 'cocstatus', 'readonly', 'filename', 'modified', 'gitbranch', 'method'] ]
          \ },
          \ 'component_function': {
          \   'method': 'NearestMethodOrFunction',
          \   'cocstatus': 'coc#status',
          \   'gitbranch': 'fugitive#head'
          \ },
          \ }

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
    let g:pencil_higher_contrast_ui = 1   " 0=low (def), 1=high
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
    let g:indentLine_enabled = 0            " Just toggle this shit bro

    autocmd BufNew,BufEnter *.md,*.markdown,*.wiki execute "set conceallevel=0"
    autocmd BufNew,BufEnter *.html,*.css, execute "IndentLinesToggle"


"----------------------------------------------------------------------
"                       Devicons
"----------------------------------------------------------------------

" NERDTrees File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('inputrc', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('py', 'Green', 'none', '#51a77e', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')


"----------------------------------------------------------------------
"                       Denite
"----------------------------------------------------------------------


"----------------------------------------------------------------------
"                       CocNVIM
"----------------------------------------------------------------------
"Format Prettier coc-extension -> :Prettier on current buffer
    command! -nargs=0 Prettier :CocCommand prettier.formatFile
" Better display for messages
    set cmdheight=1
" Smaller updatetime for CursorHold & CursorHoldI
    set updatetime=1500
" don't give |ins-completion-menu| messages.
    set shortmess+=c
" always show signcolumns
    set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

" Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
    nmap <silent> [c <Plug>(coc-diagnostic-prev)
    nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
    nnoremap <silent> ,K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

" Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')
" Remap for rename current word
    nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
    vmap <leader>F  <Plug>(coc-format-selected)
    nmap <leader>F  <Plug>(coc-format-selected)
" Show all diagnostics
    nnoremap <silent> ,a  :<C-u>CocList diagnostics<cr>
" Manage extensions
    nnoremap <silent> ,e  :<C-u>CocList extensions<cr>
" Show commands
    nnoremap <silent> ,c  :<C-u>CocList commands<cr>
" Find symbol of current document
    nnoremap <silent> ,o  :<C-u>CocList outline<cr>
" Search workspace symbols
    nnoremap <silent> ,s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
    nnoremap <silent> ,j  :<C-u>CocNext<CR>
" Do default action for previous item.
    nnoremap <silent> ,k  :<C-u>CocPrev<CR>
" Resume latest coc list
    nnoremap <silent> ,p  :<C-u>CocListResume<CR>

" Turn off COC IN MARKDOWN
    autocmd BufNew,BufEnter *.md,*.markdown,*.wiki execute "silent! CocDisable"
