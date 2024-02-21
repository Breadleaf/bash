######################################################

# General Setup

######################################################

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# For some reason this wasn't enabled by default
shopt -s extglob

# Set the colors in the tty
if [ "$TERM" = "linux" ]; then
	echo -en "\e]P0232323" # BLACK
	echo -en "\e]P82B2B2B" # DARK GREY
	echo -en "\e]P1D75F5F" # DARK RED
	echo -en "\e]P9E33636" # RED
	echo -en "\e]P287AF5F" # DARK GREEN
	echo -en "\e]PA98E34D" # GREEN
	echo -en "\e]P3D7AF87" # BROWN
	echo -en "\e]PBFFD75F" # YELLOW
	echo -en "\e]P48787AF" # DARK BLUE
	echo -en "\e]PC7373C9" # BLUE
	echo -en "\e]P5BD53A5" # DARK MAGENTA
	echo -en "\e]PDD633B2" # MAGENTA
	echo -en "\e]P65FAFAF" # DARK CYAN
	echo -en "\e]PE44C9C9" # CYAN
	echo -en "\e]P7E5E5E5" # LIGHT GRAY
	echo -en "\e]PFFFFFFF" # WHITE
	clear # FOR BACKGROUND ARTIFACTING
fi


######################################################

# Exports

######################################################

export HISTCONTROL=erasedups:ignorespace

######################################################

# Alias

######################################################

# remove all alias
unalias -a

# ~/.bashrc
alias srcb="source ~/.bashrc"
alias edb="vim ~/.bashrc"

# ~/.config/bash/entry.bash
alias edbe="vim ~/.config/bash/entry.bash"

# source all alias
source ~/.config/bash/alias.bash
source ~/.config/bash/functions.bash

#
# NOTE: It is up to you to make your own ~/.config/bash/custom.bash file as it contains my
#       ssh commands and other commands only relevant to my machines.
#

if [ -f ~/.config/bash/custom.bash ]; then
	source ~/.config/bash/custom.bash
fi

######################################################

# Other Configurations

######################################################


# PS1 Configurations

update_ps1() {
    local exit_code=$?

    local s_color="\[\033[38;5;218m\]"
    local e_color="\[\033[0m\]"

    local git_branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

    local user="\u"
    local hostname="\h"

    local working_dir="$(pwd | sed "s|${HOME}|~|")"

    PS1="┌[${s_color}${git_branch}${e_color}]-[${s_color}${exit_code}${e_color}]-[${s_color}${user}${e_color}@${s_color}${hostname}${e_color}]-[${s_color}${working_dir}${e_color}]\n└>> "
}

PROMPT_COMMAND=update_ps1
