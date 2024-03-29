"  ___      ___  ___   _____ ______    ________   ________
"  |\  \    /  /||\  \ |\   _ \  _   \ |\   __  \ |\   ____\
"  \ \  \  /  / /\ \  \\ \  \\\__\ \  \\ \  \|\  \\ \  \___|
"   \ \  \/  / /  \ \  \\ \  \\|__| \  \\ \   _  _\\ \  \
"    \ \    / /    \ \  \\ \  \    \ \  \\ \  \\  \|\ \  \____
"     \ \__/ /      \ \__\\ \__\    \ \__\\ \__\\ _\ \ \_______\
"      \|__|/        \|__| \|__|     \|__| \|__|\|__| \|_______|


"----------------------------------------------------------------------
"                   General Re-mappings
"----------------------------------------------------------------------

" Remap Capital J/K to move up and down blocks
"    nnoremap J }
"    vmap J }
"    nnoremap K {
"    vmap K {

" Next level text moving
    vnoremap <C-J> :m '>+1<CR>gv=gv
    vnoremap <C-K> :m '<-2<CR>gv=gv

" Set U as Ctrl R which means Redo
    nnoremap U <C-R>

" Use B to move to the beginning of the line
    map B 0

" Use E to move to the end of the line
    map E $

" Better Yank
    map Y y$

" Map ,, to % because I like cycling brackets a lot
    map ,, %

" Align blocks of text and keep them selected
    vmap < <gv
    vmap > >gv

" Lots of Time-Stamp Options here in normal/insert mode to paste timestamp and F4 To Date Stamp
    "nnoremap <F5> a"<ESC>"=strftime("%Y-%m-%d %H:%M:%S")<CR>pa"<ESC>
    "inoremap <F5> <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
    "nnoremap <F6> "=strftime("%A %B %d %Y, at %I:%M %p %Z")<CR>P
    "inoremap <F6> <C-R>=strftime("%A %B %d, at %I:%M %p %Z")<CR>
    nnoremap <F5> a<ESC>"=strftime("%Y-%m-%d")<CR>pa<ESC>
    inoremap <F5> <C-R>=strftime("%Y-%m-%d")<CR>
    nnoremap <F6> "=strftime("%A %B %d, %Y")<CR>P
    inoremap <F6> <C-R>=strftime("%A %B %d, %Y")<CR>

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
    nnoremap gn :bn<CR>
    nnoremap gp :bp<CR>

" Better opening of filepath under the cursor
nnoremap gX :silent :execute
            \ "!open" expand('%:p:h') . "/" . expand("<cfile>") " &"<cr>

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
"    nnoremap <leader>j J

" Copy & Paste into vim in normal mode
    map<leader>p  "+p
    map<leader>y  "+y

" Better vim replace with r in visual mode
    vmap r "_dP

" Quicksave and Quickquit in vim using leader!
    nnoremap <C-S> :update<cr>
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

" Set U as Ctrl N To Explore
    nnoremap <C-N> :Explore<CR>

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
"    function! PandocCreate()
"      let curr_file = expand('%:p')                             " Name of current file
"      let pdf_file = expand('%:r') . '.pdf'                     " Name of file with pdf extension
"      execute '!pandoc --columns=10 --pdf-engine=xelatex ' . curr_file . ' -o ' . pdf_file
"      if filereadable(pdf_file)
"          execute '!open ' . pdf_file
"      endif
"    endfunction

" Make/Compile current Latex File
"    function! LatexCreate()
"      let curr_file = expand('%:p')                             " Name of current file
"      let pdf_file = expand('%:r') . '.pdf'                     " Name of file with pdf extension
"      execute '!pdflatex  ./' . curr_file
"      execute '!open ' . pdf_file
"      execute '!open -a "alacritty.app"'
"    endfunction

"    augroup markdownHelpers
"        autocmd!
"    " LaTeX Remaps
"        autocmd FileType tex nnoremap <F7> :update<CR>:call LatexCreate()<CR>
"        autocmd FileType tex nnoremap ,top :-1read $XDG_CONFIG_HOME/nvim/snippets/blockLatex.txt<CR>
"    " Pandoc Remaps
"        autocmd BufRead,BufNewFile *.md,*.markdown set filetype=markdown
"        autocmd FileType markdown nnoremap <F7> :update<CR>:call PandocCreate()<CR>
"    augroup END

    " Expose TrimWhitespace Command to remove spaces
    command! -nargs=? -range=% -complete=custom,s:TrimCompletionOptions
      \ TrimWhitespace <line1>,<line2>call s:TrimWhitespace(<f-args>)

    function! s:TrimWhitespace(...) abort
      let confirm = a:0
      execute a:firstline . ',' . a:lastline . 's/\s\+$//e' . (confirm ? 'c' : '')
    endfunction

    function! s:TrimCompletionOptions(A,L,P) abort
      return "-confirm"
    endfunction

    function! TabFile() abort
        set expandtab!
        %retab!
    endfunction

    map <F9> :call TabFile()<CR>


" Create file under cursor
    function! s:openOrCreateFile()
        let s:bundle = expand('<cfile>:p')
        let path = expand('<cfile>:p:h')

        let suffixes = split(&suffixesadd, ',')
        let isExists = 0

        for s in suffixes
            if empty(glob(s:bundle . s))
                let isExists = 1
            endif
        endfor

        if !isExists
            let answer = input("file doesn't exists; create file ?")

            if answer ==? 'y'
                if !isdirectory(path)
                    echomsg path . ' created'
                    "netrw_localmkdiropts("p")
                    "netrw_localmkdir(path)
                    :call mkdir(path, 'p')
                endif
            endif
        endif
        :edit <cfile> " create or edit now path is available
        ":norm! gf
    endfunction

    command -nargs=0 OpenOrCreateFile call s:openOrCreateFile()

    nnoremap gF :OpenOrCreateFile<CR>

"----------------------------------------------------------------------
"                           Snippets! -> Comma
"----------------------------------------------------------------------
" Mockup
    nnoremap ,mock :-1read $XDG_CONFIG_HOME/nvim/snippets/mock.txt<CR>A

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

" MLK's Dream Speech
    nnoremap ,snap :read $XDG_CONFIG_HOME/nvim/snippets/snap.md<CR>
