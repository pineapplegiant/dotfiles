[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# FOR Z JUMPING
. /usr/local/etc/profile.d/z.sh

#----------------------------------------------------------------------
#       Set Spaceship ZSH as a prompt "npm install -g spaceship"
#----------------------------------------------------------------------
    autoload -U promptinit; promptinit
    prompt spaceship

# General
    SPACESHIP_PROMPT_ADD_NEWLINE=true
    SPACESHIP_PROMPT_DEFAULT_SUFFIX=""
# User
    SPACESHIP_USER_SHOW=always
    SPACESHIP_USER_COLOR=green
    SPACESHIP_USER_SUFFIX=""
# Host
    SPACESHIP_HOST_SHOW=always
    SPACESHIP_HOST_PREFIX="@"
    SPACESHIP_HOST_SUFFIX=""
# Directory
    SPACESHIP_DIR_TRUNC=0
    SPACESHIP_DIR_TRUNC_REPO=false
    SPACESHIP_DIR_PREFIX="["
    SPACESHIP_DIR_SUFFIX="] "
# Symbol
    SPACESHIP_CHAR_SYMBOL="$ "

SPACESHIP_PROMPT_ORDER=(
# time          # Time stamps section
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
# hg            # Mercurial section (hg_branch  + hg_status)
# package       # Package version
  node          # Node.js section
#  ruby          # Ruby section
#  elixir        # Elixir section
#  xcode         # Xcode section
#  swift         # Swift section
#  golang        # Go section
#  php           # PHP section
#  rust          # Rust section
#  haskell       # Haskell Stack section
#  julia         # Julia section
#  docker        # Docker section
#  aws           # Amazon Web Services section
  venv          # virtualenv section
# conda         # conda virtualenv section
  pyenv         # Pyenv section
#  dotnet        # .NET section
#  ember         # Ember.js section
#  kubecontext   # Kubectl context section
#  terraform     # Terraform workspace section
#  exec_time     # Execution time
  line_sep      # Line break
#  battery       # Battery level and status
#  vi_mode       # Vi-mode indicator
#  jobs          # Background jobs indicator
#  exit_code     # Exit code section
  char          # Prompt character
)

#----------------------------------------------------------------------
#                       ALIASES
#----------------------------------------------------------------------
# System Stuff
    alias rm='safe-rm'                       # Safe-RM
    alias dog='ccat'                         # Use that new ccat plugin

# Nvim
    export VISUAL=nvim
    alias v=nvim
    alias vi=nvim
    alias vim=nvim
    alias vimrc='vim $XDG_CONFIG_HOME/nvim/init.lua'      # Open nvimrc in nvim
    alias rc='vim $XDG_CONFIG_HOME/zsh/.zshrc'           # Get to bash-profile faster
    alias bp='vim $XDG_CONFIG_HOME/shell/profile'        # Get to env faster
    alias tmuxrc='vim $XDG_CONFIG_HOME/tmux/tmux.conf'   # Tmux settings
    alias alrc='vim ~/.config/alacritty.yml'             # Alacritty settings

# EXA > ls
if command -v exa >/dev/null; then
	alias l="exa -FG --git --icons"   # Just make ls  chill
	alias ls="exa -FG --git --icons"  # Make ls pretty
	alias ll="exa -l --git --icons"   # ls long tag
	alias s="exa -ahlF --icons"
	alias ss="exa -aF --git --icons"
fi

# Safety aliases
    alias rm="rm -iv"         # Make rm safer
    alias cp="cp -i"          # Make cp safer
    alias mv="mv -i"          # Make mv safer

# Laziness at its finest
    alias rr="source $XDG_CONFIG_HOME/zsh/.zshrc && tmux source-file $XDG_CONFIG_HOME/tmux/tmux.conf" # Source bash profile & Tmux
    alias tfix="tmux select-layout even-horizontal"
    alias tfixv="tmux select-layout even-vertical"
    alias tfixd="tmux resize-pane -y 8"
    alias ..="cd .."          # Shortcut up a directory
    alias ...="cd ../.."      # Shorcut 2 directory
    alias c="clear"           # Faster clearing of the screen
    alias matrix="cmatrix"    # Stupid text on the screen
    alias lg="lazygit"
    alias scope="echo 'SearchSpring.Catalog.elems.container.scope()' &&  echo 'SearchSpring.Catalog.elems.container.scope()' | pbcopy"
    alias store="echo 'searchspring.controller.search.store.toJSON()' &&  echo 'searchspring.controller.search.store.toJSON()' | pbcopy"
    alias dic="wkdict"

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
    function web()
    {
        open "$URLprefix$@" -a "Google Chrome"
    }

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

# Notion script
    function notion()
    {
         pipenv run python /Users/Gmo/Blog/notion_scripts.py -f $@
    }

# Tmux create session
    function tnew()
    {
         tmux new-session -s $@
    }

# Tmux script to rename window
    function tname()
    {
         tmux rename-window $@
    }
# Tmux script to rename session
    function tsesh()
    {
         tmux rename-session $@
    }


# Kill a specific tmux session
function tkill()
    {
        tmux kill-session -t $@
    }


# Create directories alongside files
    function mktouch() {
        mkdir -p "$(dirname "$1")" && touch "$1"
    }

#----------------------------------------------------------------------
#                       VI like prompt stuff thanks Luke
#----------------------------------------------------------------------

# History in cache directory:
    HISTSIZE=10000
    SAVEHIST=10000
    HISTFILE=$XDG_CACHE_HOME/zsh/history

# Basic auto/tab complete:
    autoload -U compinit
    zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
    zmodload zsh/complist
    compinit
    _comp_options+=(globdots)       # Include hidden files.

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

#----------------------------------------------------------------------
#                       Better then bash
#----------------------------------------------------------------------

# Setup NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Load zsh-autosuggestions
    source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Load zsh-syntax-highlighting
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load zsh-history-substring-search
    source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# To search via vim keybindings
    bindkey -M vicmd 'k' history-substring-search-up
    bindkey -M vicmd 'j' history-substring-search-down

    export PATH="/usr/local/sbin:$PATH"
    fpath+=${ZDOTDIR:-~}/.zsh_functions

# Setup fzf
    if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
      export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
    fi

# Auto-completion
    [[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
    source "/usr/local/opt/fzf/shell/key-bindings.zsh"


# Set GPG
export GPG_TTY=$(tty)
