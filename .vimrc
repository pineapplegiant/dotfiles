"        _                    
"       (_)                   
" __   ___ _ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
"   \_/ |_|_| |_| |_|_|  \___|
"                             

source $HOME/.config/nvim/general.vim        " General Settings point to nvim (less code duplication)
source $HOME/.config/nvim/mappings.vim       " Remappings for Vim

set notermguicolors
colorscheme default

"----------------------------------------------------------------------
"                       Plugins
"----------------------------------------------------------------------
" Setup Vim-Plug
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'https://github.com/cocopon/pgmnt.vim'
Plug 'https://github.com/cocopon/colorswatch.vim'

call plug#end()


"----------------------------------------------------------------------
"                       Nerdtree
"----------------------------------------------------------------------
" Map nerdtree to Ctrl+n
    map <C-n> :NERDTreeToggle<CR>

" Nerdtree size smaller
    let g:NERDTreeWinSize=18

" Let Nerdtree close if it's the last window open!
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" leader+n = ctrl + w to move between windows
    nnoremap  <leader>n :NERDTreeRefreshRoot<CR>
