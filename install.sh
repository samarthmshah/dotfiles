#!/bin/bash
##############################

olddir=$HOME/old.dotfiles
files="bash_profile gitconfig"  # list of files/folders to symlink in homedir

echo "Creating $olddir for backup of any existing dotfiles in ~ ..."
rm -rf $olddir
mkdir -p $olddir
echo "... done"

for file in $files; do
    echo "Moving any existing files from ~ to $olddir"
    cp -r $HOME/.$file $olddir
    cp -r .$file $HOME/
done

# install bash_it
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
echo "y" | . ~/.bash_it/install.sh