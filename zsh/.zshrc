#!/usr/bin/sh
export DOTFILES="$HOME/dots"
source $DOTFILES/zsh/aliases.zsh
source $DOTFILES/zsh/env.zsh
source $DOTFILES/zsh/paths.zsh
source $DOTFILES/zsh/nnn.zsh
source $DOTFILES/zsh/functions.zsh
source $DOTFILES/zsh/options.zsh
source $DOTFILES/zsh/fzf.zsh
source $HOME/.config/lf/icons
source ~/.fzf/shell/completion.zsh
source ~/.fzf/shell/key-bindings.zsh
bindkey -v
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6'
export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"

export PATH="/home/ali/.local/share/fnm:$PATH"
eval "`fnm env`"

[ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'
export DISCORD_TOKEN="MTAzODQ2MzA0OTQ5NDk1ODIyMA.GaVIkJ.7x8UjEYY-0y6P7YYV53NXYu2ao5EV59D5hf-CA"

export PATH=$PATH:$(go env GOPATH)/bin
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions


if [[ $EUID -ne 0 ]]; then
#     PROMPT="%B%1F[%f%3F%n%f%2F@%f%6F%m%f %4F%1~%f%5F\$(git_info)%f%1F]%f%7F$%f %b"
    PROMPT="%B%1F[%f%3F%n%f%2F@%f%6F%m%f %4F%1~%f%1F]%f%7F$%f %b"
else
    PROMPT="%B%3F[%n@%m %1~]# %f%b"
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
