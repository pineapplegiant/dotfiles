" ________    ___      ___  ___   _____ ______    ________   ________
" |\   ___  \ |\  \    /  /||\  \ |\   _ \  _   \ |\   __  \ |\   ____\
" \ \  \\ \  \\ \  \  /  / /\ \  \\ \  \\\__\ \  \\ \  \|\  \\ \  \___|
"  \ \  \\ \  \\ \  \/  / /  \ \  \\ \  \\|__| \  \\ \   _  _\\ \  \
"   \ \  \\ \  \\ \    / /    \ \  \\ \  \    \ \  \\ \  \\  \|\ \  \____
"    \ \__\\ \__\\ \__/ /      \ \__\\ \__\    \ \__\\ \__\\ _\ \ \_______\
"     \|__| \|__| \|__|/        \|__| \|__|     \|__| \|__|\|__| \|_______|
"


"----------------------------------------------------------------------
"                        Modularity is life
"----------------------------------------------------------------------

source $HOME/.config/nvim/general.vim        " General Settings
source $HOME/.config/nvim/plugins.vim        " (vim-plug) Plugin information and settings
source $HOME/.config/nvim/mappings.vim       " Remappings for Vim

"----------------------------------------------------------------------
"               NOTES FOR A HEALTHY REMINDER
"----------------------------------------------------------------------
    " gf Goes to file under path
    " H, M, L, Let's you get to the high, middle, and lower parts of the screen
    " D lets you delete the contents of the line after the cursor
    "Remember kids 'gd' for searching under cursor is ur friend
    "zL and zH let you view to the left and right for long lines
    "zt lets you make the current line up at the TOP of viewport
    "zb lets you make the current line up at the BOTTOM of viewport
    " gu  : Change current line from UPPER to lower.
    " gU  : Change current line from lower to UPPER.
    " gq to wrap lines to a specified length
    " 'nnoremap' is for normal mode - 'map' for all, and 'noremap' for most
    " Plugin for writing -> :GOYO to minimize distraction
        " Limelight [0.0 ~ 1.0] Turn Limelight on with additional tint
    " 'z=' is for checking spell suggestions
    " s] is for checking the next spelling suggestion
    " [count]<leader>cc |NERDComComment| Comment out the current line or text selected in visual mode.
    " [count]<leader>cn |NERDComNestedComment| Force Comment
    " [count]<leader>c<space> |NERDComNestedComment| Force Comment
