#!/bin/bash

PATH=$(dirname "$(realpath $0)")

# ask(package) -> resp
function ask() {
 read -p "Install $1? (Y/n): " resp
 [ -z "$resp" ] || [ "$resp" = "y" ]
}

# zsh

if ask "zsh"; then
	echo "Installing zsh"
	apt install zsh

	echo "Installing oh-my-zsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

	echo "Installing tmux"
	apt install tmux

	echo "Loading config"
	cp "$PATH/.zsh/zshrc" "$HOME"
fi

# vscode
if ask "vscode"; then
	echo "Installing vscode"
	echo "Installing extensions"
	echo "Loading config"
fi

if ask "discord"; then
	echo "ADD ALIAS"
	echo "install script"
fi

