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
" The dark side plagues all
if !exists('g:vscode')
    " Ordinary Neovim Settings
    source $XDG_CONFIG_HOME/nvim/general.vim        " General Settings
    source $XDG_CONFIG_HOME/nvim/mappings.vim       " Remappings for Vim (Plugin specific in plugins)
    source $XDG_CONFIG_HOME/nvim/plugins.vim        " Plugin information and settings (vim-plug)

    if exists('+termguicolors')
      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
      let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif

   " If I installed my own theme then use it, if not then nahh
   try
       set termguicolors
       colorscheme spaceduck
       "colorscheme moonfly
       "colorscheme codedark
       "colorscheme spaceduck
       "colorscheme palenight
       "colorscheme OceanicNext
       "colorscheme everforest
       "colorscheme gruvbox-material
       "let g:gruvbox_material_background = 'hard'
       "let ayucolor="mirage"
       "colorscheme ayu
       "Fern highlight group colors
       highlight default GlyphPalette1  ctermfg=1  guifg=#e33400
       highlight default GlyphPalette2  ctermfg=2  guifg=#5ccc96
       highlight default GlyphPalette3  ctermfg=3  guifg=#f2ce00
       highlight default GlyphPalette4  ctermfg=4  guifg=#7a5ccc
       highlight default GlyphPalette6  ctermfg=6  guifg=#ce6f8f
       highlight default GlyphPalette7  ctermfg=7  guifg=#686f9a
       highlight default GlyphPalette9  ctermfg=9  guifg=#e39400
       "Better cursorhold color for coc
       "highlight default CocHighlightText guibg=#1b1c36
       " Hack for cursorline to work better over stuff
       function! s:CustomizeColors()
        if has('guirunning') || has('termguicolors')
            let cursorline_gui=''
            let cursorline_cterm='ctermfg=white'
        else
            let cursorline_gui='guifg=white'
            let cursorline_cterm=''
        endif
        exec 'hi CursorLine ' . cursorline_gui . ' ' . cursorline_cterm 
        endfunction
        augroup OnColorScheme
            autocmd!
            autocmd ColorScheme,BufEnter,BufWinEnter * call s:CustomizeColors()
        augroup END
    catch
        colorscheme default
    endtry
else
    " VSCode extension stuff
    source $XDG_CONFIG_HOME/nvim/vscode/settings.vim        " General Settings
endif
