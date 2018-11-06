;= @echo off
;= rem Call DOSKEY and use this file as the macrofile
;= %SystemRoot%\system32\doskey /listsize=1000 /macrofile=%0%
;= rem In batch mode, jump to the end of the file
;= goto:eof
;= Add aliases below here
e.=explorer .
gl=git log --oneline --all --graph --decorate  $*
ls=ls --show-control-chars -F --color $*
pwd=cd
clear=cls
history=cat "%CMDER_ROOT%\config\.history"
unalias=alias /d $1
vi=vim $*
ll=ls -alG
cmderr=cd /d "%CMDER_ROOT%"
glme= git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --author="Samarth Shah" $*
gs = git status
gp = git pull
c=code -g -r $*
bp=code /c C:\Users\samashah\cmder\config
..=cd ..
...=cd ..\..
desk=cd /d C:\Users\samashah\Desktop
down=cd /d C:\Users\samashah\Downloads
tasks=cd /d D:\rd\Build\src
tasks-init=cd /d D:\rd\Build\src && start ACR.Build.Linux.sln
myvm="ssh samashah@40.85.148.138"