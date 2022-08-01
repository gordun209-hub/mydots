#!/bin/bash

if [[ -f $(which nvim) ]]; then
  alias vi="nvim"
else
  alias vi="vim"
fi

alias gs="git status"
alias ga="git add"
alias gcm="git commit -m"
alias gp="git push"
alias ta="tmux attach"
alias gpom="git push origin master"
alias q="exit"
alias n='nvim'
alias install='sudo pacman -S'
alias search='sudo pacman -Ss'
alias remove='sudo pacman -R'
alias update='sudo pacman -Sy'
alias yinstall='yay -S'
alias ysearch='yay -Ss'
alias yremove='yay -R'
alias yupdate='yay -Sy'
alias c="clear"
alias yw="yarn workspace"
alias cat="bat"
alias sl="exa --icons --sort type -a"
alias ls="nnn -e"
alias ll="exa --icons --long --sort type -a"
alias l="exa --icons --long --sort type -a"
alias zshrc="nvim ~/dotfiles/zsh/.zshrc"
alias zshrcs="source ~/dotfiles/zsh/.zshrc"
alias vimrc="nvim ~/dotfiles/nvim/init.lua"
alias vimrcs="source ~/dotfiles/nvim/init.lua"
alias tmuxrc="nvim ~/dotfiles/tmux/tmux.conf"
alias tmuxrcs="tmux source-file ~/dotfiles/tmux/tmux.conf"
alias tree="exa --icons --git -a --tree -s type -I '.git|node_modules|bower_components'"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
 ## Useful aliases
alias grubup="sudo update-grub"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias rmpkg="sudo pacman -Rdd"
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias hw='hwinfo --short'                                   # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"              # Sort installed packages according to size in MB (expac must be installed)
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'			# List amount of -git packages

# Get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# doesnt work
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down
# bindkey '^k' history-substring-search-up
# bindkey '^j' history-substring-search-down
# Help people new to Arch
alias apt-get='man pacman'
alias apt='man pacman'
alias helpme='cht.sh --shell'
alias pacdiff='sudo -H DIFFPROG=meld pacdiff'
alias please='sudo'
alias tb='nc termbin.com 9999'
alias upd="/usr/bin/update"
