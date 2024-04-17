#----------------------------------------------------------------------
#       Set Spaceship ZSH as a prompt "npm install -g spaceship"
#----------------------------------------------------------------------
    autoload -U promptinit; promptinit
    # prompt spaceship

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
  # pyenv         # Pyenv section
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
