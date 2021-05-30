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


" Make sure you have vim-plug installed -> ~/.local/share/nvim/site/autoload/plug.vim
call plug#begin(stdpath('data') . '/plugged')
    "" COLORS, PRETTY & FUN
    Plug 'sheerun/vim-polyglot'
    Plug 'hoob3rt/lualine.nvim'
    Plug 'romgrk/barbar.nvim'                     "Better buffers/tabs: requires NVIM 0.5
    Plug 'kyazdani42/nvim-web-devicons'           "Icons
    "Plug 'luochen1990/rainbow'                    "Rainbow parentheses
    Plug 'psliwka/vim-smoothie'                   "Make Ctrl+D or Ctrl + U more pleasant
    "" Filetree
    "Plug 'kyazdani42/nvim-tree.lua'
    Plug 'lambdalisue/fern.vim'
    Plug 'LumaKernel/fern-mapping-fzf.vim/'
    Plug 'lambdalisue/fern-git-status.vim'        "Add git dirty status to filetree
    Plug 'lambdalisue/fern-hijack.vim'            "Makes fern the default file explorer
    Plug 'lambdalisue/nerdfont.vim'
    Plug 'lambdalisue/fern-renderer-nerdfont.vim' "Basically vim-devicons
    Plug 'lambdalisue/glyph-palette.vim'
    """ COLOR SCHEMES
    Plug 'pineapplegiant/spaceduck', { 'branch': 'dev' }
    Plug 'dracula/vim'
    Plug 'cocopon/iceberg.vim'
    Plug 'arcticicestudio/nord-vim'
    Plug 'morhetz/gruvbox'
    Plug 'ayu-theme/ayu-vim'
    "" MOVING AROUND
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'justinmk/vim-sneak'
    "" ESSENTIAL
    Plug 'tpope/vim-surround'
    Plug 'vim-scripts/The-NERD-Commenter'
    Plug 'mattn/emmet-vim'
    "" Git
    "Plug 'itchyny/vim-gitbranch'
    "" PROSE & WRITING
    Plug 'junegunn/goyo.vim'
    Plug 'reedes/vim-pencil'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
    "" NEXT LEVEL SHIT
    Plug 'mhinz/vim-grepper'
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
    Plug 'alec-gibson/nvim-tetris'
    "" TMUX
    Plug 'christoomey/vim-tmux-navigator'
    "" LOW-KEY MESSES EVERYTHING UP
    "":GenTocGFM -> Make TOC
    Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'lua'} "Fixes vim indentline no skipping lines
    " MAKE PRETTY SCREENSHOTS
    Plug 'kristijanhusak/vim-carbon-now-sh'
call plug#end()

"----------------------------------------------------------------------
"                      Nerdcommenter
"----------------------------------------------------------------------


    let g:NERDCreateDefaultMappings = 0
    nmap gcc <plug>NERDCommenterInvert
    xmap gcc <plug>NERDCommenterInvert

"----------------------------------------------------------------------
"                       Lualine
"----------------------------------------------------------------------

    let g:lualine = {
        \'options' : {
        \  'theme' : 'spaceduck',
        \  'section_separators' : ['', ''],
        \  'component_separators' : ['', ''],
        \  'disabled_filetypes' : [],
        \  'icons_enabled' : v:true,
        \},
        \'sections' : {
        \  'lualine_a' : [ ['mode', {'upper': v:true,},], ],
        \  'lualine_b' : [ ['branch', {'icon': '',}, ], ],
        \  'lualine_c' : [ ['filename', {'file_status': v:true,},], ],
        \  'lualine_x' : [ 'encoding', 'fileformat', 'filetype' ],
        \  'lualine_y' : [ 'progress' ],
        \  'lualine_z' : [ 'location'  ],
        \},
        \'inactive_sections' : {
        \  'lualine_a' : [  ],
        \  'lualine_b' : [  ],
        \  'lualine_c' : [ 'filename' ],
        \  'lualine_x' : [ 'location' ],
        \  'lualine_y' : [  ],
        \  'lualine_z' : [  ],
        \},
        \'extensions' : [ 'fzf' ],
        \}

    lua require("lualine").setup()

"----------------------------------------------------------------------
"                       Barbar
"----------------------------------------------------------------------

    let bufferline = get(g:, 'bufferline', {}) "Initialize bufferline
    let bufferline.maximum_padding = 4
    let bufferline.animation = v:false
    let bufferline.icons = v:true

    " Redefine previous mappinigs for barbar
    nnoremap <leader>d :BufferClose<CR>
    nnoremap gn :BufferNext<CR>
    nnoremap gp :BufferPrevious<CR>

"----------------------------------------------------------------------
"                       Vim-carbon-now-sh
"----------------------------------------------------------------------

" Make pretty screenshots in visual mode with f7
    vnoremap <F7> :CarbonNowSh

"----------------------------------------------------------------------
"                       Rainbow
"----------------------------------------------------------------------

" Set to 0 if you want to enable it later via :RainbowToggle
    let g:rainbow_active = 1


"----------------------------------------------------------------------
"                       Sneakin'
"----------------------------------------------------------------------

" Use the s character to traverse the the next ocurrence of sneak
    let g:sneak#s_next = 1

"----------------------------------------------------------------------
"                       FERN
"----------------------------------------------------------------------

" Custom settings and mappings.
  let g:fern#disable_default_mappings = 1

  function! FernInit() abort
    nmap <buffer><expr>
          \ <Plug>(fern-my-open-expand-collapse)
          \ fern#smart#leaf(
          \   "\<Plug>(fern-action-open:select)",
          \   "\<Plug>(fern-action-expand)",
          \   "\<Plug>(fern-action-collapse)",
          \ )
    nmap <buffer> <CR> <Plug>(fern-action-open-or-enter)
    nmap <buffer> <BS> <Plug>(fern-action-leave)
    nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
    nmap <buffer> n <Plug>(fern-action-new-file)
    nmap <buffer> N <Plug>(fern-action-new-dir)
    nmap <buffer> x <Plug>(fern-action-remove)
    nmap <buffer> m <Plug>(fern-action-move)
    nmap <buffer> r <Plug>(fern-action-rename)
    nmap <buffer> R <Plug>(fern-action-reload)
    nmap <buffer> H <Plug>(fern-action-hidden-toggle)
    nmap <buffer> b <Plug>(fern-action-open:split)
    nmap <buffer> v <Plug>(fern-action-open:vsplit)
    nmap <buffer> V <Plug>(fern-action-mark:toggle)
    nmap <buffer> o <Plug>(fern-action-open:system)
    nmap <buffer> l <Plug>(fern-action-expand)
    nmap <buffer> h <Plug>(fern-action-collapse)
    nmap <buffer> ff <Plug>(fern-action-fzf-both)
    nmap <buffer> fg <Plug>(fern-action-grep)
  endfunction

    let g:fern#renderer = "nerdfont"

  augroup FernGroup
    autocmd!
    autocmd FileType fern call FernInit()
    autocmd FileType fern setlocal nonumber
    autocmd FileType fern call glyph_palette#apply()
    autocmd FileType nerdtree,startify call glyph_palette#apply()
  augroup END

    nmap <C-r> :Fern . -reveal=%<CR>
    "Break Undo to use c-r for fern
    nmap <C-n> :Fern . -drawer -toggle -stay -reveal=%<CR>

"----------------------------------------------------------------------
"                       FZF
"----------------------------------------------------------------------

" Make FZF display up top instead of bottom
    let $FZF_DEFAULT_OPTS = '--layout=reverse'

" Make FZF better contextually -> ignore gitignore stuff & work if not in git dir
    let $FZF_DEFAULT_COMMAND = "rg --files --hidden -g '!.git' -g '!node_modules'"

    nmap <silent> <C-b> :Buffers<CR>
    nmap <silent> <C-p> :Files<CR>
    nmap <silent> <C-f> :Rg <CR>
    nmap <silent> <C-c> :History<CR>

"----------------------------------------------------------------------
"                       Vim-Grepper
"----------------------------------------------------------------------

" Grepper with <leader>g
    nmap <leader>g :Grepper<cr>
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
    xmap <leader>R
        \ "sy
        \ gvgr
        \ :cfdo %s/<C-r>s//g \| update
         \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>


"----------------------------------------------------------------------
"                   Markdown Preview
"----------------------------------------------------------------------
    let g:mkdp_open_to_the_world = 1        " Markdown preview to the world

"----------------------------------------------------------------------
"                   GOYO && PENCIL WRITING
"----------------------------------------------------------------------

" Goyo start Writing!
    nmap <leader>G :Goyo<CR>

    let g:pencil_higher_contrast_ui = 1   " 0=low (def), 1=high
    "let g:limelight_default_coefficient = 0.7
    "let g:limelight_paragraph_span = 1
    let g:pencil#wrapModeDefault = 'soft'   " default is 'hard
    let g:pencil_terminal_italics = 1 " Support italics bc i'm dumb

" GOYO start!
    function! s:goyo_enter() abort
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
    function! s:goyo_leave() abort
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
    let g:indent_blankline_char = '▏'
    "let g:indentLine_enabled = 1            " Just toggle this shit bro
    "let g:indentLine_char = '▏'             " Show Indentation lines
    "let g:indentLine_color_gui = '#474747'  " Make them pretty-gray-lines
    "let g:indentLine_fileTypeExclude = ['tex', 'markdown', 'txt'] " Shit don't work in md

"----------------------------------------------------------------------
"                       CocNVIM
"----------------------------------------------------------------------

    let g:coc_global_extensions = [
    \ 'coc-css',
    \ 'coc-dictionary',
    \ 'coc-emmet',
    \ 'coc-emoji',
    \ 'coc-eslint',
    \ 'coc-flutter',
    \ 'coc-git',
    \ 'coc-go',
    \ 'coc-highlight',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-lua',
    \ 'coc-pairs',
    \ 'coc-phpls',
    \ 'coc-prettier',
    \ 'coc-python',
    \ 'coc-react-refactor',
    \ 'coc-snippets',
    \ 'coc-styled-components',
    \ 'coc-tabnine',
    \ 'coc-tailwindcss',
    \ 'coc-tsserver',
    \ 'coc-word',
    \ 'coc-yaml',
    \ ]

" Some servers have issues with backup files, see #649.
  set nobackup
  set nowritebackup

"Format Prettier coc-extension -> :Prettier on current buffer
  command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Give more space for displaying messages.
  set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
  set updatetime=300

" Don't pass messages to |ins-completion-menu|.
  set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
    if has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
      set signcolumn=number
    else
      set signcolumn=yes
    endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

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

" Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

" Use U to show documentation in preview window
    nnoremap <silent> ,k :call <SID>show_documentation()<CR>

    function! s:show_documentation() abort
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
      else
        execute '!' . &keywordprg . " " . expand('<cword>')
      endif
    endfunction

" Remap for format selected region
    vmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

" Show all diagnostics
    nnoremap <silent> ,a  :<C-u>CocList diagnostics<cr>

" Manage extensions
    nnoremap <silent> ,e  :<C-u>CocList extensions<cr>

" Remap Format prettier file to
    nnoremap ,f :CocCommand prettier.formatFile<CR>

" Show commands
    nnoremap <silent> ,c  :<C-u>CocList commands<cr>

" Find symbol of current document
    nnoremap <silent> ,o  :<C-u>CocList outline<cr>

" Search workspace symbols
    nnoremap <silent> ,s  :<C-u>CocList -I symbols<cr>

" Resume latest coc list
    nnoremap <silent> ,p  :<C-u>CocListResume<CR>

" Better coc-pairs so it opens on new line
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
				\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

