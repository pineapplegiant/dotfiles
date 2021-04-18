" ________    ___      ___  ___   _____ ______    ________   ________
" |\   ___  \ |\  \    /  /||\  \ |\   _ \  _   \ |\   __  \ |\   ____\
" \ \  \\ \  \\ \  \  /  / /\ \  \\ \  \\\__\ \  \\ \  \|\  \\ \  \___|
"  \ \  \\ \  \\ \  \/  / /  \ \  \\ \  \\|__| \  \\ \   _  _\\ \  \
"   \ \  \\ \  \\ \    / /    \ \  \\ \  \    \ \  \\ \  \\  \|\ \  \____
"    \ \__\\ \__\\ \__/ /      \ \__\\ \__\    \ \__\\ \__\\ _\ \ \_______\
"     \|__| \|__| \|__|/        \|__| \|__|     \|__| \|__|\|__| \|_______|


"----------------------------------------------------------------------
"                   General Re-mappings
"----------------------------------------------------------------------

" Remap Capital J/K to move up and down blocks
    nnoremap J }
    vmap J }
    nnoremap K {
    vmap K {

" Set U as Ctrl R which means Redo
    nnoremap U <C-R>

" Use B to move to beginning of line
    map B ^

" Use E to move to end of line in
    map E $

" Better Yank
    map Y y$

" Map ,, to % because I like cycling brackets a lot
    map ,, %

" Align blocks of text and keep them selected
    vmap < <gv
    vmap > >gv

" Lots of Time-Stamp Options here in normal/insert mode to paste timestamp and F4 To Date Stamp
    nnoremap <F5> a"<ESC>"=strftime("%Y-%m-%d %H:%M:%S")<CR>pa"<ESC>
    inoremap <F5> <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
    nnoremap <F6> "=strftime("%A %B %d %Y, at %I:%M %p %Z")<CR>P
    inoremap <F6> <C-R>=strftime("%A %B %d, at %I:%M %p %Z")<CR>

" Source vimrc
    nnoremap <F10> :source $MYVIMRC<CR>

" List all buffers and jump to them using 'gb'
    nnoremap gb :ls<CR>:b<Space>

" List all recently opened files and open a new buffer
    nnoremap gs :browse oldfiles<CR>

" Map hh to escape out of vi mode when in the terminal
    if exists(':terminal')
        tnoremap hh <C-\><C-n>
    endif

" Shift Tab to cyle tabs
    nnoremap <Tab> :bn<CR>
    nnoremap <S-Tab> :bp<CR>

"----------------------------------------------------------------------
"               Map Leader to '<space>'
"               Map Llocalleader to \\
"----------------------------------------------------------------------

    let mapleader=' '
    let maplocalleader = '\'

" Turn off search highlight bullshit to Comma + Leader/space
    nnoremap ,<leader> :nohlsearch<CR>

" Run Last command in tmux window
    nnoremap ,gcc :!tmux send-keys -t1 "\!! " ENTER <CR><CR>

" Mac open dictionary under word cursor
    nnoremap <silent> <leader>? :!open dict://<cword><cr><cr>

" Delete Buffer, but keep the window open
    nnoremap <leader>d :bdelete!<CR>

" Fixing vim because I break it Later -> Move between blocks 'better'
    nnoremap <leader>j J

" Copy & Paste into vim in normal mode
    map<leader>p  "+p
    map<leader>y  "+y

" Quicksave and Quickquit in vim using leader!
    nnoremap <leader>s :update<cr>
    nnoremap <leader>q :q!<CR>

" Split window
    "nnoremap <leader>vs :split<Return>
    "nnoremap <leader>vv :vsplit<Return>

" Change directory to current directory
    nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Show syntax color highlighting groups for word under cursor
    nnoremap <c-a> :call <SID>SynStack()<CR>
    function! <SID>SynStack()
      if !exists("*synstack")
        return
      endif
      echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
    endfunction

" leader+r to search and replace in file
    nnoremap <leader>r :%s/\<<C-r><C-w>\>//gI<Left><Left><Left>

"----------------------------------------------------------------------
"               Terminal -> z
"----------------------------------------------------------------------

" Terminal Mappings
    function! TerminalCreate()
        let time_now = strftime("%T")
        let terminal_name = "terminal_" . time_now
        execute "terminal"
        execute "set nonumber"
        execute "file " . terminal_name
        normal A
    endfunction

" Leader+z = create new terminal buffer BELOW
    nnoremap <leader>zb :new<CR>:resize 10<CR>:call TerminalCreate()<CR>

" Leader+zb = new terminal in a new window completely by itself
    nnoremap <leader>zz :call TerminalCreate()<CR>

" Leader+zv = new terminal in a new vertical split
    nnoremap <leader>zv :vsplit<CR>:call TerminalCreate()<CR>

"----------------------------------------------------------------------
"                           Functions
"----------------------------------------------------------------------

" Markdown Remaps
    function! PandocCreate()
      let curr_file = expand('%:t')                             " Name of current file
      let pdf_file = expand('%:r') . '.pdf'                     " Name of file with pdf extension
      execute '!pandoc --pdf-engine=xelatex ' . curr_file . ' -o ' . pdf_file
      if filereadable(pdf_file)
          execute '!open ' . pdf_file
      endif
    endfunction

" Make/Compile current Latex File
    function! LatexCreate()
      let curr_file = expand('%:t')                             " Name of current file
      let pdf_file = expand('%:r') . '.pdf'                     " Name of file with pdf extension
      execute '!pdflatex  ./' . curr_file
      execute '!open ' . pdf_file
      execute '!open -a "iterm.app"'
    endfunction

    augroup markdownHelpers
        autocmd!
    " LaTeX Remaps
        autocmd FileType tex nnoremap ,comp :update<CR>:call LatexCreate()<CR>
        autocmd FileType tex nnoremap ,top :-1read $XDG_CONFIG_HOME//nvim/snippets/blockLatex.txt<CR>
    " Pandoc Remaps
        autocmd BufRead,BufNewFile *.md,*.markdown set filetype=markdown
        autocmd FileType markdown nnoremap <F7> :update<CR>:call PandocCreate()<CR>
    augroup END

    " Expose StripTrailingWhitespace Command to remove spaces
    command! -nargs=? -range=% -complete=custom,s:StripCompletionOptions
      \ StripTrailingWhitespace <line1>,<line2>call s:StripTrailingWhitespace(<f-args>)

    function! s:StripTrailingWhitespace(...) abort
      let confirm = a:0
      execute a:firstline . ',' . a:lastline . 's/\s\+$//e' . (confirm ? 'c' : '')
    endfunction

    function! s:StripCompletionOptions(A,L,P) abort
      return "-confirm"
    endfunction

"----------------------------------------------------------------------
"                           Snippets! -> Comma
"----------------------------------------------------------------------
" Basic HTML Snippet!
    nnoremap ,html :-1read $XDG_CONFIG_HOME/nvim/snippets/skeleton.html<CR>7jf>a

" Basic CSS Snippet!
    nnoremap ,css :-1read $XDG_CONFIG_HOME/nvim/snippets/cssComment.css<CR>jA
    "nnoremap ,csss :-1read $XDG_CONFIG_HOME/nvim/snippets/reset.css<CR>

" School's C++ top snippet
    nnoremap ,top :-1read $XDG_CONFIG_HOME/nvim/snippets/top.txt<CR>2jA <C-R>=strftime("%A %B %d %Y, at %I:%M %p %Z")<CR><ESC>jA

" School's Function block snippet
    nnoremap ,block :read $XDG_CONFIG_HOME/nvim/snippets/block.txt<CR>jA

" YAML snippet
    nnoremap ,yaml :-1read $XDG_CONFIG_HOME/nvim/snippets/yaml.md<CR>

" MLK's Dream Speech
    nnoremap ,mlk :read $XDG_CONFIG_HOME/nvim/snippets/mlk.txt<CR>
