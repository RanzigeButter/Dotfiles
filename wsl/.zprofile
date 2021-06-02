#!/bin/sh
#                         __ _ _
#    _____ __  _ __ ___  / _(_) | ___
#   |_  / '_ \| '__/ _ \| |_| | |/ _ \
#  _ / /| |_) | | | (_) |  _| | |  __/
# (_)___| .__/|_|  \___/|_| |_|_|\___|
#       |_|


# Base Directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# ~/ Clean-up
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export NVM_DIR="$HOME/.local/bin/nvm"
export NODE_REPL_HISTORY=""
export NPM_CONFIG_CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/npm"
export REDISCLI_HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/redis_history"
