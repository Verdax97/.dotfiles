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

# Set zsh-substring-search-history
git clone https://github.com/zsh-users/zsh-history-substring-search.git
cd zsh-history-substring-search/
sudo mkdir /usr/local/share/zsh-history-substring-search
sudo cp zsh-history-substring-search.zsh /usr/local/share/zsh-history-substring-search

# Update current terminal
cd
source .zshrc
