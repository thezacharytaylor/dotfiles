#!/bin/bash

# If using zsh, then add this function to ~/.zshrc:
# up() { . up.sh "$1"; }

[[ -z "$1" ]] && { echo "usage: up [site]"; return; }

KINDIR="$HOME/Kinetic/$1"
echo "$KINDIR"

# Check for valid working directory or symbolic link
if [ $1 = "." ]
then
    echo "🤘 Current dir"
    WORKDIR="."
    TRELLIS=false
elif [[ -d "$KINDIR" ]]
then
    echo "🤘 Let's do this"
    WORKDIR=$KINDIR
else
    echo "⚠️  Directory doesn't exist."
    return
fi

# Change to the working directory and do work
cd $WORKDIR;
echo "4️⃣  Open VS Code"
code .;
echo "3️⃣  Fetching repo"
git pull;
echo "2️⃣  Switching PHP version"
valet use;
echo "1️⃣  Open Tower"
lg;

# If trellis, then init it.
if [[ -d "$WORKDIR/trellis" ]]
then
    trellis init
fi

echo "👯‍♀️"
return
