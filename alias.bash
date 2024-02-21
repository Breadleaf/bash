######################################################

# Alias

######################################################

alias edba="vim ~/.config/bash/alias.bash"

# ls
alias sl="ls --color=auto"
alias ls='ls --color=auto'
alias la='ls -A --color=auto'
alias las='ls -lASh --color=auto'

# git
alias g="git"
alias gc="git clone "
alias ga="git add --all"
alias gcm="git commit -m "
alias gp="git push"
alias gpu="git pull"
alias gs="git status"

# General
alias vi="vim"
alias v="vim"
alias cls="clear"
alias py="python3"
alias cp="cp -i"
alias rm="rm -i"

# Movement
alias ..="cd .."
alias 2.="cd ../.."
alias 3.="cd ../../.."

# Weather
alias weather="clear; curl -s wttr.in > ~/.weather_temp_file; sed -i '/Follow/d' ~/.weather_temp_file; echo; cat ~/.weather_temp_file"

# Content
alias yt2mp3='yt-dlp --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s"'
