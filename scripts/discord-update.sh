#! /bin/bash

PACKAGE="discord.deb"
FILE_PATH="$HOME"/Downloads/"$PACKAGE"
DOWNLOAD_URL="https://discordapp.com/api/download?platform=linux&format=deb"

# make_task(task_name, task)
make_task() {
  task_name=$1
  task_command=${@:2}

  echo "Step: $task_name"
  "$task_command"
  if [ $? -ne 0 ]
    then
      echo "ERROR: $task_name fail."
      exit 1
  fi
}

uninstall() {
  # check if discord is already installed
  dpkg -l | grep discord > /dev/null
  if [ $? -eq 0 ]
    then
      echo "Removing Discord..."
      sudo dpkg --remove discord
  fi
}

download() {
  wget -O $FILE_PATH $DOWNLOAD_URL
}

install() {
  sudo dpkg --install $FILE_PATH
}

clean() {
  rm $FILE_PATH
}

echo "Discord Updater"

make_task "Uninstalling" uninstall
make_task "Downloading" download 
make_task "Installing" install 
make_task "Cleaning" clean 

echo "Done!"

