#    ██████╗  █████╗ ███████╗██╗  ██╗    ██████╗ ██████╗  ██████╗ ███████╗██╗██╗     ███████╗
#    ██╔══██╗██╔══██╗██╔════╝██║  ██║    ██╔══██╗██╔══██╗██╔═══██╗██╔════╝██║██║     ██╔════╝
#    ██████╔╝███████║███████╗███████║    ██████╔╝██████╔╝██║   ██║█████╗  ██║██║     █████╗  
#    ██╔══██╗██╔══██║╚════██║██╔══██║    ██╔═══╝ ██╔══██╗██║   ██║██╔══╝  ██║██║     ██╔══╝  
# ██╗██████╔╝██║  ██║███████║██║  ██║    ██║     ██║  ██║╚██████╔╝██║     ██║███████╗███████╗
# ╚═╝╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝    ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝╚══════╝

#----------------------------------------------------------------------
# Notes to self for a healthy reminder
#----------------------------------------------------------------------
    # TERMTOSVG RECORDINGS : termtosvg -c -t "dracula" <FILENAME>
    # g++ -std=c++0x FILE.cpp FILE_MAIN.cpp -lgtest -lgtest_main -pthread -o testProgram // TESTING EXAMPLE
    # When compiling C++ add the "-g" flag and then run 'valgrind' on the output
    #sudo rm /var/log/asl/*.asl -> delete Macosx system log files
    # chmod u+x makes a bash script executable
    #convert to pdf via groff
        #groff -ms document.ms -T pdf
        #pandoc document.md -t ms -o document.pdf
    # CSS: repeat( auto-fit, minmax(250px, 1fr) )

#----------------------------------------------------------------------
#               Start off with a friendly hello
#----------------------------------------------------------------------
#    echo "Hey $USER, welcome back my dude ^‿^"



#----------------------------------------------------------------------
# Location of places i go to a lot
#----------------------------------------------------------------------
    journal="$HOME/Github/Optimizations/gmo/"                      # my journal
    dotfiles="$HOME/Github/dotfiles/"                              # my dotfiles
    github="$HOME/Github/"                                         # my github
    pluginz="$HOME/.local/share/nvim/site/"                        # my vim-plugins
    config="$HOME/.config/nvim/"                                   # nvim config
    sillyy="$HOME/Github/silly-coding-things/"                     # code playground 
    resume="$HOME/Github/resume"                                   # markdown-resume
    document="$HOME/Documents"                                     # Documents
    desktop="$HOME/Desktop"                                        # Desktop
    download="$HOME/Downloads"                                     # Downloads
    school="$HOME/Documents/School/OSU_Classes"                                # School
    work="$HOME/Documents/Work"                                    # Work
    jobs="$HOME/Documents/Work/JOBS"                               # Job applications


#----------------------------------------------------------------------
#                       ALIASES
#----------------------------------------------------------------------

# Login to school!
    #alias osu='ssh rodrguil@access.engr.oregonstate.edu'
    alias osu='ssh rodrguil@flip3.engr.oregonstate.edu'

# Cd to places i go to a lot
    alias gh="cd $github"                    # Github alias
    alias dot="cd $dotfiles"                 # Dotfiles alias
    alias conf="cd $config"                  # Nvim/conf alias 
    alias plug="cd $pluginz"                 # Nvim/plugins alias
    alias silly="cd $sillyy"                 # Silly/dir alias
    alias res="cd $resume"                   # Resume dir alias
    alias doc="cd $document"                 # Documents dir alias
    alias dow="cd $download"                 # Downloads dir alias
    alias des="cd $desktop"                  # Desktop dir alias
    alias sch="cd $school"                   # School dir alias
    alias wor="cd $work"                     # Work dir alias
    alias job="cd $jobs"                     # Jobs dir alias
    alias opt="cd $journal"                  # Journal alias
    alias optt="vim $journal/optimizations.md"

# System Stuff
    alias rm='safe-rm'                       # Safe-RM
    alias dog='ccat'                         # Use that new ccat plugin

# Vim to Nvim 
    export VISUAL=nvim                       # Nvim Stuff so that the haters know
    alias v=nvim                             # Nvim Stuff so that the haters know 
    alias vim=nvim                           # Nvim Stuff so that the haters know
    alias vi=nvim                            # Nvim Stuff so that the haters know
    alias vimrc='vim ~/.config/nvim/init.vim' # Open nvimrc in nvim
    alias ctags="`brew --prefix`/bin/ctags"  # Ctags alias
    alias bp='vim ~/.bash_profile'           # Get to bash-profile faster

# I HAVE SWITCHED TO EXA
# ls more nice
    alias ls="exa -FG"                        # Make ls pretty
    alias l="exa"                             # Just make ls  chill
    alias ll="exa -l"                         # ls long tag
    alias s="exa -ahlF"

# Safety aliases
    alias rm="rm -iv"                        # Make rm more safe
    alias cp="cp -i"                         # Make cp more safe
    alias mv="mv -i"                         # Make mv more safe

# Laziness at its finest
    alias rr="source ~/.bash_profile && tmux source-file ~/.tmux.conf" # Source bash profile & Tmux
    alias ..="cd .."                         # Shortcut up a directory
    alias ...="cd ../.."                     # Shorcut 2 directory
    alias time="time -lp"                    # Time is verbose
    alias c="clear"


#----------------------------------------------------------------------
#                   Functions
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

# Bash 4.0 no 'CD' neccassary to  change dircetory
    shopt -s autocd


#----------------------------------------------------------------------
#               PS1 PROMPT VARIABLE <THANKS JOHN>
#----------------------------------------------------------------------
# The various escape codes that we can use to color our prompt.
    RED="\[\033[38;5;202m\]"
    YELLOW="\[\033[38;5;220m\]"
    GREEN="\[\033[0;32m\]"
    BLUE="\[\033[38;5;24m\]"
    LIGHT_RED="\[\033[38;5;202m\]"
    LIGHT_BOLD_CYAN="\[\033[38;5;39m\]"
    LIGHT_GREEN="\[\033[38;5;208m\]"
    WHITE="\[\033[1;37m\]"
    LIGHT_GRAY="\[\033[38;5;188m\]"
    COLOR_NONE="\[\e[0m\]"

# I made these, but don't use them lol
    PURPLE="\[\033[38;5;99m\]" 
    BROWN="\[\033[38;5;130m\]"


# Detect whether the current directory is a git repository.
    function is_git_repository {
        git branch > /dev/null 2>&1
    }

# Set the branch to dirty
    function set_git_branch 
    {
       # Set the final branch string
       BRANCH=`parse_git_dirty``parse_git_branch`
       local TIME=`fmt_time` # format time for prompt string
     }


 function parse_git_branch() 
 {
   git branch --no-color 2> /dev/null           \
					 | sed -e '/^[^*]/d'                  \
					 -e 's/* //'
 }


 function parse_git_dirty() 
 {
    GIT_STATE=$(git status 2> /dev/null | tail -n1)
    if [ "$GIT_STATE" != "nothing to commit, working tree clean" ]
    then
        echo "*"
    else
        echo ''
    fi
 }


fmt_time () 
{ #format time just the way I likes it
     if [ `date +%p` = "PM" ]; then
         meridiem="pm"
     else
         meridiem="am"
     fi
     date +"%l:%M:%S$meridiem"|sed 's/ //g'
}


 # Return the prompt symbol to use, colorized based
 # on the return value of the previous command.
 function set_prompt_symbol () {
   if test $1 -eq 0 ; then
       PROMPT_SYMBOL="\$"
   else
       PROMPT_SYMBOL="${RED}\$${COLOR_NONE}"
   fi
 }

 # Determine active Python virtualenv details.
 function set_virtualenv () {
   if test -z "$VIRTUAL_ENV" ; then
       PYTHON_VIRTUALENV=""
   else
       PYTHON_VIRTUALENV="${LIGHT_GRAY}(`basename \"$VIRTUAL_ENV\"`)${COLOR_NONE}"
   fi
 }

 # Set the full bash prompt.
 function set_bash_prompt () 
 {
   # Set the PROMPT_SYMBOL variable.
   # We do this first so we don't lose the
   # return value of the last command.
   set_prompt_symbol $?

   # Set the PYTHON_VIRTUALENV variable.
   set_virtualenv

   # Set the BRANCH variable.
   if is_git_repository ; then
     set_git_branch
     BRANCH={$BRANCH}
   else
     BRANCH=''
   fi

   	 GIT="${YELLOW}${BRANCH}"
	 PY="${COLOR_NONE}${PYTHON_VIRTUALENV}"
	 PS=" ${PURPLE}${PROMPT_SYMBOL}${COLOR_NONE}"
	 INDICTORS="\n${GIT}${PY}${PS}"

     # Set the bash prompt variable.
     PS1="\n${BLUE}\u${RED}@${LIGHT_BOLD_CYAN}\h:${GREEN}\w${INDICTORS} "

}

# Tell bash to execute this function just before displaying its prompt.
PROMPT_COMMAND=set_bash_prompt


#----------------------------------------------------------------------
#                       PATH
#----------------------------------------------------------------------

# Neovim-Remote add to Path Python3
    export PATH=/Users/Gmo/Library/Python/3.7/bin:$PATH 

# Add Personal Scripts to my path
    export PATH=$PATH:/Users/Gmo/.scripts/


# YARN PATH stuff
    export PATH=$PATH:/usr/local/opt/go/libexec/bin

# Z cd Command Jumping -> IN bashrc
. /usr/local/etc/profile.d/z.sh

# Google Test stuff
    export CPLUS_INCLUDE_PATH=/usr/local/include
    export LIBRARY_PATH=/usr/local/lib


#----------------------------------------------------------------------
#                       Final
#----------------------------------------------------------------------


export PATH="$HOME/.cargo/bin:$PATH"
