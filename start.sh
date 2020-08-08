# Update Ubuntu
sudo apt update
sudo apt upgrade

# Install required packages
sudo apt install build-essential git wget curl valgrind gdb gcc tree openssh-client openssh-server kcachegrind python3 python3-pip htop aria2 ffmpeg cmake g++ maven dnsutils gzip unzip zsh ruby-dev neofetch lolcat cowsay fortune toilet figlet

# Install starship.rs
sudo curl -fsSL https://starship.rs/install.sh | sudo bash

# Install colorls
sudo gem install colorls

# Install youtube-dl
pip3 install youtube-dl

# Set figlet/toilet font
sudo cp ANSI\ Shadow.flf /usr/share/figlet

# Update current terminal
cd
source .zshrc
