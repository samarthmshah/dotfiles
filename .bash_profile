#!/usr/bin/env bash

# Load ~/.exports and ~/.aliases
for file in $HOME/dotfiles/.{exports,aliases}; do
	[ -r "$file" ] && source "$file"
done

# ======= Functions =======
#Portmanteu for mkdir and go to that folder.
function mcd(){
	mkdir -p "$1" && cd "$1";
}

#Number of files in the current directory
function numfiles(){
	echo $(ls -1 | wc -l);
}

function ll(){
	ls -alFG;
}

#alarm
function alarm(){
	cd $HOME/Study/Sandbox/Python\ Practice/alarm/ && python my_alarm.py;
}

# run python server
function server() {
  local port="${1:-8000}";
  python -m SimpleHTTPServer "$port";
}

# change ~/.bash_profile on changing ~/dotfiles/.bash_profile
function bashed(){
	cd $HOME/dotfiles;
	source ./install.sh;
	reload;
	cd $HOME;
}

function re_install_docker() {
	sudo service docker stop && 
	sudo apt-get purge -y docker-ce && 
	sudo apt-get autoremove --purge -y docker-ce && 
	sudo rm -rf /var/lib/docker && 
	sudo apt-get update && 
  	sudo apt-get install -y docker-ce &&
   	sudo service docker start && 
	sudo docker run hello-world &&
	sudo usermod -aG docker $USER
}

