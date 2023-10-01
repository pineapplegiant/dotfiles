# Loads brew
    eval "$(/opt/homebrew/bin/brew shellenv)"

#----------------------------------------------------------------------
#                       Plugins
#----------------------------------------------------------------------

# Default Programs
    if type nvim >/dev/null 2>&1; then
       export EDITOR="nvim"
       export VISUAL=nvim
    else
       export EDITOR="vim"
       export VISUAL=vim
    fi

# Spaceship prompt
    source $HOMEBREW_PREFIX/opt/spaceship/spaceship.zsh

#----------------------------------------------------------------------
#                       ZSH VI MODE
#----------------------------------------------------------------------

# Edit line in vim with <C-e>
    autoload edit-command-line; zle -N edit-command-line
    bindkey '^e' edit-command-line


# To search via vim keybindings
    bindkey -M vicmd 'k' history-substring-search-up
    bindkey -M vicmd 'j' history-substring-search-down

# Update FZF To listen to alt C
    bindkey "ç" fzf-cd-widget

# Setup vim mode
    bindkey -v
    export KEYTIMEOUT=1

#----------------------------------------------------------------------
#                       FZF
#----------------------------------------------------------------------
# NOTE: Run (/opt/homebrew/opt/fzf/install) to install necessary fzf keybindings
# CTRL-T - Paste the selected files and directories onto the command-line
# CTRL-R - Paste the selected command from history onto the command-line
# ALT-C  - `cd` into the selected directory


# Load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Switch <C-T> to <C-P> for fzf
    bindkey -r '^T'
    bindkey '^P' fzf-file-widget

#----------------------------------------------------------------------
#   More Info - https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html#Zle-Widgets
#   More Info - https://stackoverflow.com/questions/18042685/list-of-zsh-bindkey-commands
#----------------------------------------------------------------------

# HISTORY
    export HISTFILE=$ZDOTDIR/.zhistory
    export HISTSIZE=10000            # Maximum events for internal history
    export SAVEHIST=$HISTSIZE        # Maximum events in history file
    setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
    setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
    setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
    setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
    setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
    setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
    setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
    setopt SHARE_HISTORY             # Share history between all sessions.


# Allow you to select in a menu
    # zstyle ':completion:*' menu select

# Use vim keys in tab complete menu:
    # bindkey -M menuselect 'h' vi-backward-char
    # bindkey -M menuselect 'k' vi-up-line-or-history
    # bindkey -M menuselect 'l' vi-forward-char
    # bindkey -M menuselect 'j' vi-down-line-or-history
    # bindkey -M menuselect '^xg' clear-screen
    # bindkey -M menuselect '^xi' vi-insert                      # Insert
    # bindkey -M menuselect '^xh' accept-and-hold                # Hold
    # bindkey -M menuselect '^xn' accept-and-infer-next-history  # Next
    # bindkey -M menuselect '^xu' undo                           # Undo

# Options
    # setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
    setopt NO_CASE_GLOB
    setopt ALWAYS_TO_END        # Move cursor to the end of a completed word.
    setopt AUTO_LIST            # Automatically list choices on ambiguous completion.

# Should be called before compinit
    # zmodload zsh/complist

# Initialize
    # autoload -U compinit; compinit

# Load ZSH Plugins
    if type brew &>/dev/null; then
        # Completions
        FPATH=$HOMEBREW_PREFIX/share/zsh-completions:$FPATH
        source $HOMEBREW_PREFIX/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

        # Autosuggest
        source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
        # bindkey '^ ' autosuggest-accept

        # Substring
        source $HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh
    fi


# Initialize
    zstyle '*:compinit' arguments -D -i -u -C -w

# Don't show any completions unless TAB hit
    zstyle ':autocomplete:*' ignored-input '*'

# Make Tab and ShiftTab cycle completions on the command line
    bindkey '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete

# Case insensitive
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Define completers
    # zstyle ':completion:*' completer _extensions _complete _approximate

# Use cache for commands using cache
    # zstyle ':completion:*' use-cache on
    # zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

# Standard style used by default for 'list-colors'
    LS_COLORS=${LS_COLORS:-'di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'}

# Color files and directory
    zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}

# First try the usual completion
    # zstyle ':completion:*' keep-prefix true



# Autocomplete options for cd instead of directory stack
    # zstyle ':completion:*' complete-options true
    # zstyle ':completion:*' file-sort modification

# Show Full file list details
    # zstyle ':completion:*' file-list all

    # zstyle ':completion:*:*:*:*:corrections' format '%F{red}!- %d (errors: %e) -!%f'
    # zstyle ':completion:*:*:*:*:descriptions' format '%F{yellow}-- %D %d --%f'
    # zstyle ':completion:*:*:*:*:messages' format ' %F{cyan} -- %d --%f'
    # zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'


# Only display some tags for the command cd
    # zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories

#----------------------------------------------------------------------
#                       Setup ZSH & Plugins
#----------------------------------------------------------------------

# Zoxide my new z command
    eval "$(zoxide init zsh)"

# Syntax highlighting
    source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/highlighters

#----------------------------------------------------------------------
#                       ALIASES
#----------------------------------------------------------------------
# Python is python3
    alias python="python3"

# Shorthand for editor
    alias v="$EDITOR"
    alias vi="$EDITOR"
    alias vim="$EDITOR"

# Shortcut to edit system files
    alias vimrc="$EDITOR $XDG_CONFIG_HOME/nvim/init.lua"      # Open nvimrc in nvim
    alias vimrc_old="\vim $XDG_CONFIG_HOME/vim/vimrc"      # Open nvimrc in nvim
    alias rc="$EDITOR $XDG_CONFIG_HOME/zsh/.zshrc"           # Get to bash-profile faster
    alias bp="$EDITOR $XDG_CONFIG_HOME/shell/profile"        # Get to env faster
    alias tmuxrc="$EDITOR $XDG_CONFIG_HOME/tmux/tmux.conf"   # Tmux settings
    alias alrc="$EDITOR ~/.config/alacritty.yml"             # Alacritty settings

# alias to EZA if exists
    if type eza >/dev/null 2>&1; then
        alias l="eza -FG --git --icons"   # Just make ls  chill
        alias ls="eza -FG --git --icons"  # Make ls pretty
        alias ll="eza -l --git --icons"   # ls long tag
        alias s="eza -ahlF --icons"
        alias ss="eza -aF --git --icons"
    else
        alias l="ls -FG"
        alias ls="ls -FG"
        alias ll="ls -l"   # ls long tag
        alias s="ls -ahlF"
        alias ss="ls -aF"
    fi

# Safety aliases
    alias rm="rm -iv"         # Make rm safer
    alias cp="cp -i"          # Make cp safer
    alias mv="mv -i"          # Make mv safer

# Laziness at its finest
    if type tmux >/dev/null 2>&1; then
        alias rr="source $XDG_CONFIG_HOME/zsh/.zshrc && tmux source-file $XDG_CONFIG_HOME/tmux/tmux.conf" # Source bash profile & Tmux
        alias tfix="tmux select-layout even-horizontal"
        alias tfixx="tmux resize-pane -x 145"
        alias tfixxx="tmux resize-pane -x 20"
        alias tfixv="tmux select-layout even-vertical"
        alias tfixvv="tmux resize-pane -y 40"
        alias tfixvvv="tmux resize-pane -y 10"
    fi

    alias ..="cd .."          # Shortcut up a directory
    alias ...="cd ../.."      # Shorcut 2 directory
    alias c="clear"           # Faster clearing of the screen
    alias matrix="cmatrix"    # Stupid text on the screen
    alias lg="lazygit"
    alias dic="wkdict"

    alias scope="echo 'SearchSpring.Catalog.elems.container.scope()' &&  echo 'SearchSpring.Catalog.elems.container.scope()' | pbcopy"
    alias store="echo 'searchspring.controller.search.store.toJSON()' &&  echo 'searchspring.controller.search.store.toJSON()' | pbcopy"

# Better Less
    export LESS="-iXR --RAW-CONTROL-CHARS"

#----------------------------------------------------------------------
#                       Functions
#----------------------------------------------------------------------

# Make and CD into the directory
    function mcdir () {
        mkdir -p -- "$1" &&
          cd -P -- "$1"
    }

# Let's be nice to our terminal
    function pls() {
        if [ "$1" ]; then
            sudo $@
        else
            sudo "$BASH" -c "$(history -p !!)"
        fi
    }

# Web Baby
    URLprefix="http://www."
    function web() {
        open "$URLprefix$@" -a "Google Chrome"
    }

# CD && LS all at once
    cd() { builtin cd "$@" && ls;}

# This will open manpages in preview!
    function preman() {
        man -t $@ | open -f -a "preview"
    }

# Open in google
    function google() {
        open $@ -a "Google Chrome"
    }

# Tmux create session
    function tnew() {
         tmux new-session -s $@
    }

# Tmux script to rename window
    function tname() {
         tmux rename-window $@
    }
# Tmux script to rename session
    function tsesh() {
         tmux rename-session $@
    }

# Kill a specific tmux session
function tkill() {
        tmux kill-session -t $@
    }

# Create directories alongside files
function mktouch() {
    mkdir -p "$(dirname "$1")" && touch "$1"
}

