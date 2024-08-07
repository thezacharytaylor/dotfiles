#  ~/.zshenv
# Core envionmental variablesh
# Locations configured here are requred for all other files to be correctly imported

# Set XDG directories
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_BIN_HOME="${HOME}/.local/bin"
export XDG_LIB_HOME="${HOME}/.local/lib"
export XDG_CACHE_HOME="${HOME}/.cache"

# Set default applications
export EDITOR="nvim"
export VISUAL="nvim"
export GIT_EDITOR=vim
export TERMINAL="kitty"
export BROWSER="arc"
# export TERM="xterm-kitty"
[ ! -z "$KITTY_WINDOW_ID" ] && export TERM="xterm-kitty"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

## Respect XDG directories
export GIT_CONFIG="${HOME}/.gitconfig"
export LESSHISTFILE="-" # Disable less history.

# Encodings, languges and misc settings
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';
export PYTHONIOENCODING='UTF-8';
export ZSH="$HOME/.oh-my-zsh"
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
export ARTISAN_OPEN_ON_MAKE_EDITOR=nvr
export XDEBUG_CONFIG="idekey=VSCODE"
. "$HOME/.cargo/env"
export PATH=/Users/zacharytaylor/.local/bin:$PATH
