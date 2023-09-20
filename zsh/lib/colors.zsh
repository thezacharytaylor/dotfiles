#!/usr/bin/env zsh

# Use wider color range
export TERM=xterm-256color

# Enable dircolors.
if type -p dircolors &>/dev/null; then
    #  Enable custom colors if it exists.
    [ -e "${XDG_CONFIG_HOME}/dircolors" ] && \
    eval "$(dircolors -b "${XDG_CONFIG_HOME}/dircolors")" || \
    eval "$(dircolors -b)"
fi
