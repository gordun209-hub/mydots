#!/usr/bin/sh
eval "$(fnm env --use-on-cd)"
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
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=180'
[ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'


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

##zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(starship init zsh)"

