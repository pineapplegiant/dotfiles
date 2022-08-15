
"----------------------------------------------------------------------
"                        BASE SETTINGS
"----------------------------------------------------------------------

" Hopefully fix vscode copy to '+' register
    set clipboard=unnamedplus

"----------------------------------------------------------------------
"                        MAPPINGS
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


" Turn off search highlight bullshit to Comma + Leader/space
    nnoremap ,<Space> :nohlsearch<CR>

" Fixing vim because I break it Later -> Move between blocks 'better'
    nnoremap <Space>j J

" Split window
    "nnoremap <Space>vs :split<Return>
    "nnoremap <Space>vv :vsplit<Return>

" Basic Key Mappings
    imap <C-h> <C-w>h
    imap <C-j> <C-w>j
    imap <C-k> <C-w>k
    imap <C-l> <C-w>l

" g Leader key
    "let mapleader=" "

" let localleader=" "
    "nnoremap <Space> <Nop>

" Split window
    nmap <Space>vs :split<Return>
    nmap <Space>vv :vsplit<Return>

" Better Delete
    nnoremap <Space>x "_di
    vnoremap <Space>x "_di


" Better indenting
    vnoremap < <gv
    vnoremap > >gv


" Simulate same TAB behavior in VSCode
    nmap gn :Tabnext<CR>
    nmap gp :Tabprev<CR>

" Better Navigation
    nnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
    xnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
    nnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
    xnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
    nnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
    xnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
    nnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>
    xnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>

    nnoremap gr <Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>

" Bind C-/ to vscode commentary since calling from vscode produces double comments due to multiple cursors
    "xnoremap <expr> <C-/> <SID>vscodeCommentary()
    "nnoremap <expr> <C-/> <SID>vscodeCommentary() . '_'
    "nnoremap <silent> <C-w>_ :<C-u>call VSCodeNotify('workbench.action.toggleEditorWidths')<CR>


    xnoremap <silent> <C-P> :<C-u>call <SID>openVSCodeCommandsInVisualMode()<CR>

    xmap gc <Plug>VSCodeCommentary
    nmap gc <Plug>VSCodeCommentary
    omap gc  <Plug>VSCodeCommentary
    nmap gcc <Plug>VSCodeCommentaryLine

