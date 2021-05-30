#!/bin/zsh
#            _
#    _______| |__  _ __ ___
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__
# (_)___|___/_| |_|_|  \___|


# General
setopt autocd
setopt globdots
setopt interactive_comments
unsetopt beep
stty stop undef
autoload -U colors && colors

# Completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

# History
HISTFILE=~/.cache/zsh_history
HISTSIZE=5000
SAVEHIST=5000

# Promt
PS1="%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$ "

# Aliases
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/aliases" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/aliases"

# nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
