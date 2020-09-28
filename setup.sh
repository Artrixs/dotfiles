#!/usr/bin/env bash

PROGRAMS=(alias bash env git shell tmux vim zsh)
OLD_DOTFILES="dotfile_bk_$(date -u +'%Y%m%d%H%M%S')"
mkdir $OLD_DOTFILES

function backup_if_exists() {
	if [ -f $1 ];
	then
		mv $1 $OLD_DOTFILES
	fi
	if [ -d $1 ];
	then
		mv $1 $OLD_DOTFILES
	fi
}

backup_if_exists ~/.bash_profile
backup_if_exists ~/.bashrc
backup_if_exists ~/.gitconfig
backup_if_exists ~/.tmux.conf
backup_if_exists ~/.zshrc
backup_if_exists ~/.vim
backup_if_exists ~/.vimrc

for program in ${PROGRAMS[@]}; do
	stow -v --target=$HOME $program
	echo "Configuring $program"
done

echo "Done!"
