

# Set $PATH if ~/.local/bin exist
if [ -d "$HOME/.local/bin" ]; then
    export PATH=$HOME/.local/bin:$PATH
fi

eval "$(fnm env --use-on-cd)"
eval "$(starship init zsh)"


# Arch Linux command-not-found support, you must have package pkgfile installed
# https://wiki.archlinux.org/index.php/Pkgfile#.22Command_not_found.22_hook
[[ -e /usr/share/doc/pkgfile/command-not-found.zsh ]] && source /usr/share/doc/pkgfile/command-not-found.zsh

# Advanced command-not-found hook
[[ -e /usr/share/doc/find-the-command/ftc.zsh ]] && source /usr/share/doc/find-the-command/ftc.zsh

export DOTFILES="$HOME/dotfiles"
export DEBUG_MODE=false
export CURRENT_SHELL=zsh
export BROWSER=firefox
[[ $DEBUG_MODE = true ]] && echo "Sourcing .zshrc"

bindkey -v

autoload -U colors && colors
# zmodload zsh/complist
# compinit
# Completion.


# Zstyle.
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "$HOME/.zcompcache"
zstyle ':completion:*' list-colors $LS_COLORS
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
zstyle ':completion:*' rehash true

# History.
HISTFILE="${ZDOTDIR:-$HOME}/.zhistory"
HISTSIZE=100000
SAVEHIST=5000
unsetopt beep nomatch
## Options section
#setopt correct                                                  # Auto correct mistakes
#setopt nocaseglob                                               # Case insensitive globbing
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt pushdminus
setopt           auto_cd  auto_list           pushd_ignore_dups
setopt auto_pushd interactivecomments pushdsilent
setopt menu_complete            # Do Not Autoselect The First Completion Entry.
unsetopt flow_control           # Disable Start/Stop Characters In Shell Editor.
setopt complete_in_word         # Complete From Both Ends Of A Word.
setopt always_to_end            # Move Cursor To The End Of A Completed Word.
setopt path_dirs                # Perform Path Search Even On Command Names With Slashes.
setopt auto_menu                # Show Completion Menu On A Successive Tab Press.
setopt auto_param_slash         # If Completed Parameter Is A Directory, Add A Trailing Slash.
setopt no_complete_aliases
unsetopt share_history
setopt   no_share_history
setopt   bang_hist          extended_history  inc_append_history
setopt   hist_save_no_dups  hist_ignore_dups  hist_expire_dups_first
setopt   hist_find_no_dups  hist_ignore_space hist_ignore_all_dups
setopt   hist_reduce_blanks hist_verify       hist_beep
setopt promptsubst
# Replace yay with paru if installed
[ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'


source $DOTFILES/zsh/aliases.zsh --source_only
source $DOTFILES/zsh/env.zsh --source_only
source $DOTFILES/zsh/paths.zsh --source_only
source $DOTFILES/zsh/nnn.zsh --source_only
source $DOTFILES/zsh/functions.zsh
source $DOTFILES/zsh/options.zsh --source-only

source $DOTFILES/zsh/fzf.zsh
source ~/.fzf/shell/completion.zsh
source ~/.fzf/shell/key-bindings.zsh
## Run neofetch
# source ~/powerlevel10k/powerlevel10k.zsh-theme

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
# load=light
#

