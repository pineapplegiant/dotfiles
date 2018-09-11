# Friendly Message
echo "Hey, welcome back my dude ^‿^"

# All of my aliases
alias ls="ls -FG"				 # Make ls pretty
alias ll="ls -l"				 # ls long tag

# Save me from myself
alias rm="rm -i"				 # Make rm more safe
alias cp="cp -i"				 # Make cp more safe
alias mv="mv -i"				 # Make mv more safe
alias refresh="source ~/.bash_profile"		 # Source bash profile

# Moving around
alias ..="cd .."				 # Shortcut up a directory
alias ...="cd ../.."	         # Shorcut 2 directory
alias cd..="cd .."				 # Typo

# Useful Functions!

# This will open manpages in Preview!
function preman() {
    man -t $@ | open -f -a "Preview"
}

# Time
function time_now() {
  local TIME  # Declare variable
  TIME="$(date "+%H:%M:%S")"  # Assign value to variable
  echo "The time right now is:" "${TIME}"
}

