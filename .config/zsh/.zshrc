[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Give Z-lua a try
eval "$(lua /usr/local/Cellar/z.lua/1.8.16/share/z.lua/z.lua --init zsh)"

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

# Vim to Nvim
    export VISUAL=nvim
    alias v=nvim
    alias vim=nvim
    alias vimrc='nvim $XDG_CONFIG_HOME/nvim/init.vim'     # Open nvimrc in nvim
    alias ctags="`brew --prefix`/bin/ctags"              # Ctags alias
    alias rc='nvim $XDG_CONFIG_HOME/zsh/.zshrc'           # Get to bash-profile faster
    alias bp='nvim $XDG_CONFIG_HOME/shell/profile'        # Get to env faster
    alias tmuxrc='nvim $XDG_CONFIG_HOME/tmux/tmux.conf'   # Tmux settings
    alias alrc='nvim ~/.config/alacritty.yml'             # Alacritty settings

# Nvim alias
	if type nvim >/dev/null 2>&1; then
		export VISUAL=nvim
		alias v=nvim
		alias vi=nvim
		alias vim=nvim
		alias vimrc='vim $XDG_CONFIG_HOME/nvim/init.lua'      # Open nvimrc in nvim
		alias rc='vim $XDG_CONFIG_HOME/zsh/.zshrc'           # Get to bash-profile faster
		alias bp='vim $XDG_CONFIG_HOME/shell/profile'        # Get to env faster
		alias tmuxrc='vim $XDG_CONFIG_HOME/tmux/tmux.conf'   # Tmux settings
		alias alrc='vim ~/.config/alacritty.yml'             # Alacritty settings
	fi

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
		alias s="exa -ahlF"
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

# Convert text to b64
	# convertfont -c -f "My Custom Font" -w bold font-name.woff
function convertfont() {
	local copy_css=0
	local font_family="FontFamilyHere"
	local font_weight="normal"

	# Define the help text
	local help_text="Usage: convertfont [OPTIONS] FILE
Convert a font file to base64 and copy it to the clipboard.

Options:
  -c        Copy CSS code to clipboard.
  -f NAME   Update font-family to NAME in the CSS code.
  -w WEIGHT Update font-weight to WEIGHT in the CSS code.
  -h        Show this help text."

	# Parse command-line options using getopts
	while getopts ":cf:w:h" opt; do
		case $opt in
			c)
				copy_css=1
				;;
			f)
				font_family="$OPTARG"
				;;
			w)
				font_weight="$OPTARG"
				;;
			h)
				echo "$help_text"
				return 0
				;;
			\?)
				echo "Invalid option: -$OPTARG" >&2
				echo "$help_text" >&2
				return 1
				;;
		esac
	done

	# Shift the arguments to get the filename
	shift $((OPTIND - 1))

	if [ -z "$1" ]; then
		echo "Error: Please provide a filename."
		return 1
	fi

	if [ ! -e "$1" ]; then
		echo "Error: File '$1' not found."
		return 1
	fi

	local input_file="$1"
	local output_file="${input_file%.woff}-b64.txt"

	echo "Converting '$input_file' to '$output_file'..."
	openssl base64 -A -in "$input_file" -out "$output_file"
	echo "Conversion complete."

	if [ "$copy_css" -eq 1 ]; then
		# Read the CSS template file and replace COPIED_TEXT with the output
		local css_template="@font-face {
	font-family: '$font_family';
	src: url(data:font/opentype;base64,COPIED_TEXT);
	font-weight: $font_weight;
	font-style: normal;
}"

		local css_content=$(cat "$output_file")
		local css_with_content="${css_template/COPIED_TEXT/$css_content}"

		# Copy the CSS with the replaced content to the clipboard
		echo -n "$css_with_content" | pbcopy
		echo "CSS code copied to clipboard."
	else
		# Copy the output file to the clipboard
		pbcopy < "$output_file"
		echo "Content copied to clipboard."
	fi
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
#                       ZSH Settings
#----------------------------------------------------------------------

# Setup NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Load zsh plugins
	if $BREW_INSTALLED; then
		source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
		source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
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
	fi

# Set GPG
export GPG_TTY=$(tty)
