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

source $XDG_CONFIG_HOME/nvim/general.vim        " General Settings
source $XDG_CONFIG_HOME/nvim/mappings.vim       " Remappings for Vim (Plugin specific in plugins)
source $XDG_CONFIG_HOME/nvim/plugins.vim        " Plugin information and settings (vim-plug)

"----------------------------------------------------------------------
"               Colors for a rainy day
"----------------------------------------------------------------------
    if exists('+termguicolors')
      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
      let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif

   " If I installed my own theme then use it, if not then nahh
   try
       colorscheme spaceduck
       set termguicolors
    catch
        colorscheme default
    endtry
