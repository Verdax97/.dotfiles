# Set default shell
chsh -s $(which zsh)

# Get Dotfiles directory (for Symlinks)
CURRENT_PATH=$(pwd) # Store current location
REL_DOTFILES_PATH=$(dirname $0) # Relative dotfiles path
ABS_DOTFILES_PATH=$(cd $REL_DOTFILES_PATH && pwd) # Absolute dotfiles path
cd $CURRENT_PATH # return to previous location


####################
# Install dotfiles #
####################

# ZSH & Starship prompt
ln -sfn $ABS_DOTFILES_PATH/.zshrc ~/.zshrc
ln -sfn $ABS_DOTFILES_PATH/.starship.toml ~/.starship.toml

# Nano (https://github.com/serialhex/nano-highlight) and Git
ln -sfn $ABS_DOTFILES_PATH/.nanorc ~/.nanorc
ln -sfn $ABS_DOTFILES_PATH/.nano ~/.nano
ln -sfn $ABS_DOTFILES_PATH/.gitconfig ~/.gitconfig