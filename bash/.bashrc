# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Environment setup
if [ -f ~/.env ]; then
	source ~/.env
fi

#Custom functions load
if [-f ~/.functions]; then
	source ~/.functions
fi

#Aliases
if [-f ~/.aliases ]; then
	source ~/.aliases
fi

PS1='\[\e[90m\][\A]\[\e[1;34m\] $(short_dir) \[\e[31m\]❱\[\e[33m\]❱\[\e[32m\]❱ \[$(tput sgr0)\]'
