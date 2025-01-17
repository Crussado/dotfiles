#! /bin/bash

FILE_PATH=$(dirname "$(realpath $0)")

# ask(package) -> bool
function ask() {
 read -p "Install $1? (Y/n): " resp
 [ -z "$resp" ] || [ "$resp" = "y" ]
}

# zsh
if ask "zsh"; then
	ZSH_CONFIG_PATH="$FILE_PATH/.zsh"

	echo "Installing fonts powerline"
	sudo apt-get install fonts-powerline

	echo "Installing zsh"
	sudo apt install zsh

	echo "Installing oh-my-zsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

	echo "Adding theme"
	ln -sf "$ZSH_CONFIG_PATH/.oh-my-zsh/themes/agnoster++.zsh-theme" "$ZSH/themes/"

	source "$HOME/.zshrc"

	echo "Installing plugins"
	mapfile -t repos < "$FILE_PATH/.zsh/.oh-my-zsh/plugins/repos"
	mapfile -t plugins < "$FILE_PATH/.zsh/.oh-my-zsh/plugins/plugins"

	for ((i=0; i<${#repos[@]}; i++)); do
	    plugin="${plugins[i]}"
	    url="${repos[i]}"

		folder="$ZSH/custom/plugins"
		mkdir $plugin $folder
	    git clone "$url" "$folder/$plugin"
	done

	echo "Installing tmux"
	sudo apt install tmux

	echo "Loading config"
	cp "$ZSH_CONFIG_PATH/.zshrc" "$HOME"
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

