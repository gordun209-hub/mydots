#!/bin/sh

export BOOKMARKS="$HOME/.cache/bookmarks"
export TODOS="$HOME/.cache/todos"
export DOTFILES="$HOME/dots"
export DEBUG_MODE=false
export CURRENT_SHELL=zsh
export BROWSER=firefox
export PACKPATH="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
export PATH="$HOME/.cabal/bin:$PATH"

# FZF
#export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
#export FZF_DEFAULT_OPTS='--bind ctrl-n:down,ctrl-p:up'

#export ZSH_AUTOSUGGEST_MANUAL_REBIND=1  # make prompt faster
#export DISABLE_MAGIC_FUNCTIONS=true     # make pasting into terminal faster
