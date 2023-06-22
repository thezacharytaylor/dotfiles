#!/bin/bash

# If using zsh, then add this function to ~/.zshrc:
# up() { . up.sh "$1"; }

[[ -z "$1" ]] && {
	echo "usage: up [site]"
	return
}

KINDIR="$HOME/Kinetic/$1"
echo "$KINDIR"

# Check for valid working directory or symbolic link
if [ $1 = "." ]; then
	echo "🤘 Current dir"
	WORKDIR="."
	TRELLIS=false
elif [[ -d "$KINDIR" ]]; then
	echo "🤘 Let's do this"
	WORKDIR=$KINDIR
else
	echo "⚠️  Directory doesn't exist."
	return
fi

# Change to the working directory and do work
cd $WORKDIR
# echo "✅ Open editor"
# code .
# lvim

# If .git, then do git stuff
if [[ -d "$WORKDIR/.git" ]]; then
	echo "✅ Fetching repo"
	git pull

	# echo "✅ Open Lazygit"
	# lg
fi

# If .valetrc, then switch PHP version
# To use, add a .valetrc file to the folder root with the following: php=php@8.1
if [[ -f "$WORKDIR/.valetrc" ]]; then
	echo "✅ Switching PHP version"
	valet use
  composer global update
fi

# If composer.json, then install
if [[ -f "$WORKDIR/composer.json" ]]; then
  echo "✅ Composer install"
  composer install
fi

# If trellis, then init it.
if [[ -d "$WORKDIR/trellis" ]]; then
	echo "✅ Trellis"
	trellis init
fi

echo "✅ Open editor"
# code .
lvim

echo "👯‍"
return
