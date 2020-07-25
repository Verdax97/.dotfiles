#!/bin/zsh

# Pull .dotfiles and private submodule
function update-dotfiles() {
  CURRENT_PATH="$(pwd)"
  cd "${ZDOTDIR:-$HOME}/.dotfiles/"
  git pull --recurse-submodules
  cd $CURRENT_PATH
  source ~/.zshrc
}

# Push .dotfiles and private submodule
function push-dotfiles() {
  CURRENT_PATH="$(pwd)"
  cd "${ZDOTDIR:-$HOME}/.dotfiles/"
  git push --recurse-submodules
  cd $CURRENT_PATH
  source ~/.zshrc
}

# Call update-dotfiles()
alias .u="update-dotfiles"

# Call push-dotfiles()
alias .p="push-dotfiles"

# Show local IP
alias localip="hostname -I"

# Show public IP
alias ip="dig +short myip.opendns.com @resolver1.opendns.com" 

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"


# Tree commands
alias tree2="tree -a -L 2 -I \"node_modules|.git|scripts|.DS_Store|.idea\" ."


# Convert .otf to .ttf
# uses cli utilities from fontforge - https://github.com/fontforge/fontforge 
otf2ttf() {
	fontforge  -c 'Open('"$1"'); Generate('"$2"')'
}


# Download website with assets using wget
download-website() {
	wget --recursive --no-clobber --page-requisites --adjust-extension --span-hosts --convert-links --restrict-file-names=windows --domains "$1" --no-parent "$1"
}


# Jpegoptim recursive
function jpegoptim-recursive() {
	find -type f -name "*.jpg" -exec jpegoptim -m 80 --all-progressive -s -p {} \;
}


# Rename numerically every matching file given an extension ($1 parameter).
# Result will be a 3-digit filename (ie.: 001.jpg)
function renumber() {
	if [[ "$1" != "" ]]; then
		i=0; for f (*.$1) zmv $f '${(l:3::0:)$((++i))}'.$1
	else
		echo "Specify file extension"
		echo "ie.: renumber jpg"
	fi
}

# Change extensions of every matching file
# from filename.$1 to filename.$2
function convertext() {
  if [[ "$1" != "" ]] || [[ "$2" != "" ]]; then
    for f in *.$1; do 
      mv -- "$f" "${f%.$1}.$2"
    done
	else
		echo "Specify starting and destination extensions"
		echo "ie.: changeext png jpg"
	fi
}

# Function useful to find "big" files inside a git repo
function git-large-files() {
	git rev-list --objects --all \
	| git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' \
	| sed -n 's/^blob //p' \
	| sort --numeric-sort --key=2 \
	| cut -c 1-12,41- \
	| $(command -v gnumfmt || echo numfmt) --field=2 --to=iec-i --suffix=B --padding=7 --round=nearest
}