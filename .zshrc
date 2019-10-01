[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#----------------------------------------------------------------------
#                       ALIASES
#----------------------------------------------------------------------

# Login to school!
    #alias osu='ssh rodrguil@access.engr.oregonstate.edu'
    alias osu='ssh flip'
# System Stuff
    alias rm='safe-rm'                       # Safe-RM
    alias dog='ccat'                         # Use that new ccat plugin

# Vim to Nvim
    export VISUAL=nvim                       # Nvim Stuff so that the haters know
    alias v=nvim                             # Nvim Stuff so that the haters know 
    alias vim=nvim                           # Nvim Stuff so that the haters know
    alias vimrc='vim $HOME/.config/nvim/init.vim' # Open nvimrc in nvim
    alias ctags="`brew --prefix`/bin/ctags"  # Ctags alias
    alias bp='vim ~/.zshrc'           # Get to bash-profile faster

# I HAVE SWITCHED TO EXA
# ls more nice
    alias l="exa -FG"                         # Just make ls  chill
    alias ls="exa -FG"                        # Make ls pretty
    alias ll="exa -l"                         # ls long tag
    alias s="exa -ahlF"

# Safety aliases
    alias rm="rm -iv"                        # Make rm more safe
    alias cp="cp -i"                         # Make cp more safe
    alias mv="mv -i"                         # Make mv more safe

# Laziness at its finest
    alias rr="source ~/.zshrc && tmux source-file ~/.tmux.conf" # Source bash profile & Tmux
    alias ..="cd .."                         # Shortcut up a directory
    alias ...="cd ../.."                     # Shorcut 2 directory
    alias time="time -lp"                    # Time is verbose
    alias c="clear"

# WebDev Baby
    alias web='browser-sync start --server --files "*"'

#----------------------------------------------------------------------
#                       Functions
#----------------------------------------------------------------------
# CD && LS all at once 
    cd() { builtin cd "$@" && ls;}

# This will open manpages in preview!
    function preman()
    {
        man -t $@ | open -f -a "preview"
    }

# Open in google
    function google()
    {
        open $@ -a "Google Chrome"
    }

# Open in firefox
    function firefox()
    {
        open $@ -a "Firefox"
    }
#----------------------------------------------------------------------
#                       PATH
#----------------------------------------------------------------------

# Z cd Command Jumping -> IN bashrc
. /usr/local/etc/profile.d/z.sh

# Neovim-Remote add to Path Python3
    PATH=/Users/Gmo/Library/Python/3.7/bin:$PATH
    PATH=$HOME/.cargo/bin:$PATH

# Google Test stuff
    CPLUS_INCLUDE_PATH=/usr/local/include
    LIBRARY_PATH=/usr/local/lib

# YAN PATH stuff
    PATH=$PATH:/usr/local/opt/go/libexec/bin

# Add Personal Scripts to my path
    PATH=$PATH:/Users/Gmo/Github/dotfiles/.scripts

# Environment / Path
    GOBIN=$HOME/go/bin
    GOPATH=$HOME/go

    export PATH=$GOBIN:$PATH


#----------------------------------------------------------------------
#                       Luke
#----------------------------------------------------------------------

# Enable colors and change prompt:
    autoload -U colors && colors
    PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory:
    HISTSIZE=10000
    SAVEHIST=10000
    HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
    autoload -U compinit
    zstyle ':completion:*' menu select
    zstyle ':completion:*:default'         list-colors ${(s.:.)LS_COLORS}
    zmodload zsh/complist
    compinit
    _comp_options+=(globdots)		# Include hidden files.

# vi mode
    bindkey -v
    export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
    function zle-keymap-select 
    {
      if [[ ${KEYMAP} == vicmd ]] ||
         [[ $1 = 'block' ]]; then
        echo -ne '\e[1 q'
      elif [[ ${KEYMAP} == main ]] ||
           [[ ${KEYMAP} == viins ]] ||
           [[ ${KEYMAP} = '' ]] ||
           [[ $1 = 'beam' ]]; then
        echo -ne '\e[5 q'
      fi
    }
    zle -N zle-keymap-select
    zle-line-init() 
    {
        zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
        echo -ne "\e[5 q"
    }
    zle -N zle-line-init
    echo -ne '\e[5 q' # Use beam shape cursor on startup.
    preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
    autoload edit-command-line; zle -N edit-command-line
    bindkey '^e' edit-command-line

# Load zsh-syntax-highlighting; should be last.
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
