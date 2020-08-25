"        _                    
"       (_)                   
" __   ___ _ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
"   \_/ |_|_| |_| |_|_|  \___|
"                             

source $HOME/.config/nvim/general.vim        " General Settings point to nvim (less code duplication)

"Vim version greater than 7, if not gtfo
if v:version < 703
    finish
endif
source $HOME/.config/nvim/mappings.vim       " Remappings for Vim


" Make sure to install colorscheme properly btw
set notermguicolors
colorscheme default
