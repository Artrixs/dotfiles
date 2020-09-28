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


#Environment setup
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

PROMPT=' %B%{$fg[blue]%}$(short_dir) %{$fg[red]%}❱%{$fg[yellow]%}❱%{$fg[green]%}❱ %f%b'
RPROMPT='%B%(?..%{$fg[red]%}✘ %? )%{$fg[green]%}$(git_part) %b%F{240}[%T]%f'
