# use this file to run your own startup commands for msys2 bash'

# To add a new vendor to the path, do something like:
# export PATH=${CMDER_ROOT}/vendor/whatever:${PATH}
alias gs='git status'
alias e='explorer .'
alias gl='git log --oneline --all --graph --decorate  $1'
alias glme='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --author="Samarth Shah" $1'
alias c='code -g -r $1'
alias bp='code -g -r "/c/Users/samashah/cmder/config"'
alias ..='cd ..'
alias ...='cd ..\..'
alias tasks='cd /d/rd/Build/src'
alias tasks-init='cd /d/rd/Build/src && start ACR.Build.Linux.sln'
alias ll='ls -alG'
alias myvm='ssh samashah@40.85.148.138'

cdf() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# brf - checkout git branch
brf() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# fuzzy grep open via ag
vg() {
  local file

  file="$(ag --nobreak --noheading $@ | fzf -0 -1 | awk -F: '{print $1 " +" $2}')"

  if [[ -n $file ]]
  then
     code $file
  fi
}
