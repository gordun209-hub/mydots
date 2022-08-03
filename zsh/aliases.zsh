#!/bin/bash

if [[ -f $(which nvim) ]]; then
  alias vi="nvim"
else
  alias vi="vim"
fi

# GIT
alias gs="git status"
alias ga="git add"
alias gcm="git commit -m"
alias gp="git push"
alias gpom="git push origin master"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

#TMUX
alias ta="tmux attach"
alias ts="tmux ls"
alias td="tmux detach"
alias tka"tmux kill-session -a"
alias tan="tmux at -t"
alias tinfo="tmux info"

# GENERAL
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
#IMPROVE DEFAULTS
alias cat="bat"
alias sl="exa --icons --sort type -a"
alias ls="nnn -e -H"
alias ll="exa --icons --long --sort type -a"
alias l="exa --icons --long --sort type -a"

#CONFIG FILES
alias zshrc="nvim ~/dotfiles/zsh/.zshrc"
alias zshrcs="source ~/dotfiles/zsh/.zshrc"
alias vimrc="nvim ~/dotfiles/nvim/init.lua"
alias vimrcs="source ~/dotfiles/nvim/init.lua"
alias tmuxrc="nvim ~/dotfiles/tmux/tmux.conf"
alias tmuxrcs="tmux source-file ~/dotfiles/tmux/tmux.conf"
alias tree="exa --icons --git -a --tree -s type -I '.git|node_modules|bower_components'"
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

# Help people new to Arch
alias apt-get='man pacman'
alias apt='man pacman'
alias helpme='cht.sh --shell'
alias pacdiff='sudo -H DIFFPROG=meld pacdiff'
alias please='sudo'
alias tb='nc termbin.com 9999'
alias upd="/usr/bin/update"
