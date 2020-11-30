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

" Install plugin manager if not installed already!
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

    " Make sure you have vim-plug installed ~/.local/share/nvim/site/autoload/plug.vim
    call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
    " COLORS, PRETTY & FUN
    Plug 'sheerun/vim-polyglot'
    Plug 'itchyny/lightline.vim'
    " MOVING AROUND
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'justinmk/vim-dirvish'
    Plug 'kristijanhusak/vim-dirvish-git'
    Plug 'justinmk/vim-sneak'
    " ESSENTIAL
    Plug 'tpope/vim-surround'
    Plug 'jiangmiao/auto-pairs'
    Plug 'vim-scripts/The-NERD-Commenter'
    " Git 
    Plug 'airblade/vim-gitgutter'
    " PROSE & WRITING
    Plug 'junegunn/goyo.vim' 
    Plug 'reedes/vim-pencil'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
    Plug 'arthurxavierx/vim-unicoder'
    " NEXT LEVEL SHIT
    Plug 'mhinz/vim-grepper'
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
    Plug 'liuchengxu/vista.vim'
    " Tmux
    Plug 'christoomey/vim-tmux-navigator'
    " Low-key messes everything up
    Plug 'Yggdroot/indentLine'
    call plug#end()


"----------------------------------------------------------------------
"                       Sneakin'
"----------------------------------------------------------------------
" Use s char to traverse the the next ocurrence of sneak
  let g:sneak#s_next = 1

"Replace f and/or t with one-character Sneak?
  "map f <Plug>Sneak_f
  "map F <Plug>Sneak_F
  "map t <Plug>Sneak_t
  "map T <Plug>Sneak_T

"----------------------------------------------------------------------
"                       Dirvish
"----------------------------------------------------------------------

    map <C-n> :Dirvish<CR>

"----------------------------------------------------------------------
"                       FZF
"----------------------------------------------------------------------
" FZF to leader+f
    nnoremap <leader>f :Files<CR>

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
"                       Vim-Grepper
"----------------------------------------------------------------------

" Grepper with <leader>g
    nnoremap <leader>g :Grepper<cr>
    let g:grepper = { 'next_tool': '<leader>g' }
    let g:grepper.tools=["rg"]

    xmap gr <plug>(GrepperOperator)
" After searching for text, press this mapping to do a project wide find and
" replace. It's similar to <leader>r except this one applies to all matches
" across all files instead of just the current file.
    nnoremap <leader>R
      \ :let @s='\<'.expand('<cword>').'\>'<CR>
      \ :Grepper -cword -noprompt<CR>
      \ :cfdo %s/<C-r>s//g \| update
      \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" The same as above except it works with a visual selection.
    xmap <Leader>R
        \ "sy
        \ gvgr
        \ :cfdo %s/<C-r>s//g \| update
         \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>


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
          \             [ 'cocstatus', 'readonly', 'filename', 'modified', 'method'] ]
          \ },
          \ 'component_function': {
          \   'method': 'NearestMethodOrFunction',
          \   'cocstatus': 'coc#status',
          \ },
          \ }

"----------------------------------------------------------------------
"                   Markdown Preview
"----------------------------------------------------------------------
    let g:mkdp_open_to_the_world = 1        " Markdown preview to the world

"----------------------------------------------------------------------
"                   GOYO && PENCIL WRITING
"----------------------------------------------------------------------

" Goyo start Writing!
    nnoremap <leader>G :Goyo<CR>

    let g:pencil_higher_contrast_ui = 1   " 0=low (def), 1=high
    "let g:limelight_default_coefficient = 0.7
    "let g:limelight_paragraph_span = 1
    let g:pencil#wrapModeDefault = 'soft'   " default is 'hard
    let g:pencil_terminal_italics = 1 " Support italics bc i'm dumb

" GOYO start!
    function! s:goyo_enter()
        let b:quitting = 0
        let b:quitting_bang = 0
        autocmd QuitPre <buffer> let b:quitting = 1
        cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
        Goyo 80
          if executable('tmux') && strlen($TMUX)
            silent !tmux set status off
            silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
          endif
        set noshowmode
        set noshowcmd
        set spell
        "set scrolloff=999
        set background=dark
        "Limelight
        unmap <leader>j
        TogglePencil
        colorscheme pencil
        syntax off
        syntax on
        "set conceallevel=2

    endfunction


" Let GOYO quit
    function! s:goyo_leave()
          if executable('tmux') && strlen($TMUX)
            silent !tmux set status on
            silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
          endif

          " Quit Vim if this is the only remaining buffer
          if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
            if b:quitting_bang
              qa!
            else
              qa
            endif
          endif
        endfunction

    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()

"----------------------------------------------------------------------
"                       Indent-Line
"----------------------------------------------------------------------
    let g:indentLine_char = '▏'             " Show Indentation lines
    let g:indentLine_color_gui = '#474747'  " Make them pretty-gray-lines
    let g:indentLine_enabled = 0            " Just toggle this shit bro

    autocmd BufNew,BufEnter *.md,*.markdown,*.wiki execute "set conceallevel=0"
    autocmd BufNew,BufEnter *.html,*.css, execute "IndentLinesToggle"

"----------------------------------------------------------------------
"                       CocNVIM
"----------------------------------------------------------------------
" Remap Format prettier file to
    nnoremap ,f :CocCommand prettier.formatFile<CR>

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
