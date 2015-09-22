#!/usr/bin/env bash

# Path to the bash it configuration
export BASH_IT="$HOME/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='zork'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/xvzf/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# Load Bash It
source $BASH_IT/bash_it.sh


#########################################################################################
## My version of bash.profile starts here.
# ======= Setting PATH for Python 2.7 =======
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# ======= Setting PATH for Python 3.5 =======
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

# ======= Setting Java home =======
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk/Contents/Home

# ======= Setting PATH for Maven. =======
M2_HOME=/usr/local/apache-maven/apache-maven-3.3.3
export M2_HOME
PATH=$PATH:$M2_HOME/bin
export PATH

# ======= Aliases =======
alias ..="cd .."  # papa
alias ...="cd ../.."  # dada
alias dt="cd ~/Desktop"
alias week="date +%V"  # week number
# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; sudo gem update --system; sudo gem update'
# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"
# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 7'"
# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias bp="atom /Users/samarthshah/.bash_profile"
alias auto="cd /Users/samarthshah/Study/Autodidacticism/"

echo "Entering the CIA mainframe..."
# echo "Go on. CODE like a pro."
echo "bp auto capi sapi gg mcd numfiles ll alarm makedocs"

# ======= Functions =======
#Portmanteu for mkdir and go to that folder.
mcd(){
	mkdir -p "$1" && cd "$1";
}

a(){
	atom "$1"
}

#Number of files in the current directory
numfiles(){
	echo $(ls -1 | wc -l);
}

#ls -al
ll(){
	ls -alFG;
}

#alarm
alarm(){
	cd ~/Study/Autodidacticism/Python\ Practice/alarm/ && python my_alarm.py
}

# Work stuff
capi(){
	cd /Users/samarthshah/Work/dsp-advertiser-client-api
	source /Users/samarthshah/Work/cvenv/bin/activate
}

sapi(){
	cd /Users/samarthshah/Work/dsp-advertiser-api
	source /Users/samarthshah/Work/svenv/bin/activate
}

makedocs(){
	cd /Users/samarthshah/Work/dsp-advertiser-client-api/docs/;
	make clean && make html
	open build/html/index.html
}
