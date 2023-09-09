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
#                       VI like prompt stuff thanks Luke
#   More Info - https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html#Zle-Widgets
#   More Info - https://stackoverflow.com/questions/18042685/list-of-zsh-bindkey-commands
#----------------------------------------------------------------------
# Spaceship prompt
    source $(brew --prefix)/opt/spaceship/spaceship.zsh

# Auto Suggestions
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# # History in cache directory:
#     HISTSIZE=10000
#     SAVEHIST=10000

    export HISTFILE=$ZDOTDIR/.hist_zsh
    export HISTSIZE=5000000
    export SAVEHIST=$HISTSIZE

    # HISTORY
    setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
    setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
    setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
    setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
    setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
    setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
    setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
    setopt SHARE_HISTORY             # Share history between all sessions.
    # END HISTORY

    # Auto/tab complete: https://docs.brew.sh/Shell-Completion
    if type brew &>/dev/null; then
        # Load ZSH completions
        FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    fi

    # Should be called before compinit
    zmodload zsh/complist

# Setup vim mode
    bindkey -v
    export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
    bindkey -M menuselect 'h' vi-backward-char
    bindkey -M menuselect 'k' vi-up-line-or-history
    bindkey -M menuselect 'l' vi-forward-char
    bindkey -M menuselect 'j' vi-down-line-or-history

    # bindkey -M menuselect '^xg' clear-screen
    # bindkey -M menuselect '^xi' vi-insert                      # Insert
    # bindkey -M menuselect '^xh' accept-and-hold                # Hold
    # bindkey -M menuselect '^xn' accept-and-infer-next-history  # Next
    # bindkey -M menuselect '^xu' undo                           # Undo
    bindkey -v '^?' backward-delete-char

    autoload -U compinit; compinit
    _comp_options+=(globdots) # With hidden files

    setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
    setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
    setopt COMPLETE_IN_WORD     # Complete from both ends of a word.

# Be in-sensitive pls
    zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# First try the usual completion
    # zstyle ':completion:*' keep-prefix true

# Define completers
    zstyle ':completion:*' completer _extensions _complete _approximate

# Use cache for commands using cache
    zstyle ':completion:*' use-cache on
    zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

# Allow you to select in a menu
    zstyle ':completion:*' menu select

# Autocomplete options for cd instead of directory stack
    # zstyle ':completion:*' complete-options true
    zstyle ':completion:*' file-sort modification

# Show Full file list details
    # zstyle ':completion:*' file-list all

    zstyle ':completion:*:*:*:*:corrections' format '%F{red}!- %d (errors: %e) -!%f'
    zstyle ':completion:*:*:*:*:descriptions' format '%F{yellow}-- %D %d --%f'
    zstyle ':completion:*:*:*:*:messages' format ' %F{cyan} -- %d --%f'
    zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'

# Colors for files and directory
    zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}

# Only display some tags for the command cd
    zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories

# Required for completion to be in good groups (named after the tags)
    zstyle ':completion:*' group-name ''
    zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands

# See ZSHCOMPWID "completion matching control"
# zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Change cursor shape for different vi modes.
    function zle-keymap-select {
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

    function zle-line-init() {
        zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
        echo -ne "\e[5 q"
    }

    zle -N zle-line-init
    echo -ne '\e[5 q' # Use beam shape cursor on startup.
    preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
    autoload edit-command-line; zle -N edit-command-line
    bindkey '^e' edit-command-line

# SubSearch
    source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# To search via vim keybindings
    bindkey -M vicmd 'k' history-substring-search-up
    bindkey -M vicmd 'j' history-substring-search-down

# Update FZF To listen to alt C
    # bindkey "ç" fzf-cd-widget


#----------------------------------------------------------------------
#                       Setup ZSH & Plugins
#----------------------------------------------------------------------

# Give Z-lua a try
    eval "$(lua $(brew --prefix z.lua)/share/z.lua/z.lua --init zsh)"

# Syntax highlighting
    source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=$(brew --prefix)/share/zsh-syntax-highlighting/highlighters

#----------------------------------------------------------------------
#                       ALIASES
#----------------------------------------------------------------------

# Shorthand for editor
alias v="$EDITOR"
alias vi="$EDITOR"
alias vim="$EDITOR"

# Shortcut to edit system files
alias vimrc="$EDITOR $XDG_CONFIG_HOME/nvim/init.lua"      # Open nvimrc in nvim
alias rc="$EDITOR $XDG_CONFIG_HOME/zsh/.zshrc"           # Get to bash-profile faster
alias bp="$EDITOR $XDG_CONFIG_HOME/shell/profile"        # Get to env faster
alias tmuxrc="$EDITOR $XDG_CONFIG_HOME/tmux/tmux.conf"   # Tmux settings
alias alrc="$EDITOR ~/.config/alacritty.yml"             # Alacritty settings

# alias to EXA if exists
if type exa >/dev/null 2>&1; then
    alias l="exa -FG --git --icons"   # Just make ls  chill
    alias ls="exa -FG --git --icons"  # Make ls pretty
    alias ll="exa -l --git --icons"   # ls long tag
    alias s="exa -ahlF --icons"
    alias ss="exa -aF --git --icons"
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
