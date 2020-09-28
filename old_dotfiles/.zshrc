# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/artrix/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
setopt PROMPT_SUBST
autoload -U colors && colors
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh 
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Function to short the pwd lenght
short_dir () {
  local truePath=$(pwd | sed "s/$(echo $(getent passwd $USER | cut -d: -f6 | sed 's=/=\\/=g'))/~/")

  #First round of shorting 	
  if [[ $(echo $truePath| wc -m) -gt 20 ]]
  then
    truePath=$(echo $truePath | sed -r 's/([^\/]{1,3})[^\/]*\//\1\//g')
  fi

  #Second round of shorting
  if [[ $(echo $truePath | wc -m) -gt 20 ]]
  then
    truePath=$(echo $truePath | sed -r 's/^(\/?[^\/]*\/).*(\/[^\/]*)$/\1...\2/g')	
  fi

  echo $truePath	
}

#Git stuff
git_part () {
	git status 2>/dev/null | grep "On branch" | sed -r "s/On branch (.*)/\1/"
}

PROMPT=' %B%{$fg[blue]%}$(short_dir) %{$fg[red]%}❱%{$fg[yellow]%}❱%{$fg[green]%}❱ %f%b'
RPROMPT='%B%(?..%{$fg[red]%}✘ %? )%{$fg[green]%}$(git_part) %b%F{240}[%T]%f'
