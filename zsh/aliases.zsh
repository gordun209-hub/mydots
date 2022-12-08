#!/usr/bin/sh
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
alias install='doas pacman -S'
alias search='doas pacman -Ss'
alias remove='doas pacman -R'
alias update='doas pacman -Sy'
alias yinstall='yay -S'
alias ysearch='yay -Ss'
alias yremove='yay -R'
alias yupdate='yay -Sy'
alias c="clear"


alias yw="yarn workspace"
#IMPROVE DEFAULTS
alias cat="bat"
alias sl="exa --icons --sort type -a"
alias ll="exa --icons --long --sort type -a"
alias l="exa --icons --long --sort type -a"

#CONFIG FILES
alias zshrc="nvim ~/dots/zsh/.zshrc"
alias zshrcs="source ~/dots/zsh/.zshrc"
alias vimrc="nvim ~/dots/nvim/init.lua"
alias vimrcs="source ~/dots/nvim/init.lua"
alias tmuxrc="nvim ~/dots/tmux/tmux.conf"
alias tmuxrcs="tmux source-file ~/dots/tmux/tmux.conf"
alias tree="exa --icons --git -a --tree -s type -I '.git|node_modules|bower_components'"
 ## Useful aliases
alias grubup="doas update-grub"
alias fixpacman="doas rm /var/lib/pacman/db.lck"
alias rorphans="sudo pacman -Qtdq | pacman -Rns -"
alias vrrorphans="sudo pacman -Qqd | pacman -Rsu --print -"
alias rrorphans="sudo pacman -Qqd | pacman -Rsu -"
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias rmpkg="doas pacman -Rdd"
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





#fix obvious typo's
alias cd..='cd ..'
alias pdw='pwd'
alias udpate='doas pacman -Syyu'
alias upate='doas pacman -Syyu'
alias updte='doas pacman -Syyu'
alias updqte='doas pacman -Syyu'
alias upqll='paru -Syu --noconfirm'
alias upal='paru -Syu --noconfirm'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#readable output
alias df='df -h'

#keyboard
alias give-me-azerty-be="doas localectl set-x11-keymap be"
alias give-me-qwerty-us="doas localectl set-x11-keymap us"

#setlocale
alias setlocale="doas localectl set-locale LANG=en_US.UTF-8"
alias setlocales="doas localectl set-x11-keymap be && doas localectl set-locale LANG=en_US.UTF-8"

#pacman unlock
alias unlock="doas rm /var/lib/pacman/db.lck"
alias rmpacmanlock="doas rm /var/lib/pacman/db.lck"



#free
alias free="free -mt"

#continue download
alias wget="wget -c"

#userlist
alias userlist="cut -d: -f1 /etc/passwd | sort"

#merge new settings
alias merge="xrdb -merge ~/.Xresources"

# Aliases for software managment
# pacman
alias pacman="doas pacman --color auto"
alias update="doas pacman -Syyu"

# paru as aur helper - updates everything
alias pksyua="paru -Syu --noconfirm"
alias upall="paru -Syu --noconfirm"

#ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

#grub update
alias update-grub="doas grub-mkconfig -o /boot/grub/grub.cfg"

#add new fonts
alias update-fc='doas fc-cache -fv'

#copy/paste all content of /etc/skel over to home folder - backup of config created - beware
#skel alias has been replaced with a script at /usr/local/bin/skel

#backup contents of /etc/skel to hidden backup folder in home/user
alias bupskel='cp -Rf /etc/skel ~/.skel-backup-$(date +%Y.%m.%d-%H.%M.%S)'

#copy shell configs
alias cb='cp /etc/skel/.bashrc ~/.bashrc && echo "Copied."'
alias cz='cp /etc/skel/.zshrc ~/.zshrc && exec zsh'
alias cf='cp /etc/skel/.config/fish/config.fish ~/.config/fish/config.fish && echo "Copied."'

#switch between bash and zsh
alias tobash="doas chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="doas chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="doas chsh $USER -s /bin/fish && echo 'Now log out.'"

#switch between lightdm and sddm
alias tolightdm="doas pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings --noconfirm --needed ; doas systemctl enable lightdm.service -f ; echo 'Lightm is active - reboot now'"
alias tosddm="doas pacman -S sddm --noconfirm --needed ; doas systemctl enable sddm.service -f ; echo 'Sddm is active - reboot now'"
alias toly="doas pacman -S ly --noconfirm --needed ; doas systemctl enable ly.service -f ; echo 'Ly is active - reboot now'"
alias togdm="doas pacman -S gdm --noconfirm --needed ; doas systemctl enable gdm.service -f ; echo 'Gdm is active - reboot now'"
alias tolxdm="doas pacman -S lxdm --noconfirm --needed ; doas systemctl enable lxdm.service -f ; echo 'Lxdm is active - reboot now'"

# kill commands
# quickly kill conkies
alias kc='killall conky'
# quickly kill polybar
alias kp='killall polybar'
# quickly kill picom
alias kpi='killall picom'

#hardware info --short
alias hw="hwinfo --short"

#audio check pulseaudio or pipewire
alias audio="pactl info | grep 'Server Name'"

#skip integrity check
alias paruskip='paru -S --mflags --skipinteg'
alias yayskip='yay -S --mflags --skipinteg'
alias trizenskip='trizen -S --skipinteg'

#check vulnerabilities microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'

#get fastest mirrors in your neighborhood
alias mirror="doas reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="doas reflector --latest 30 --number 10 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="doas reflector --latest 30 --number 10 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="doas reflector --latest 30 --number 10 --sort age --save /etc/pacman.d/mirrorlist"
#our experimental - best option for the moment
alias mirrorx="doas reflector --age 6 --latest 20  --fastest 20 --threads 5 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
alias mirrorxx="doas reflector --age 6 --latest 20  --fastest 20 --threads 20 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
alias ram='rate-mirrors --allow-root --disable-comments arch | doas tee /etc/pacman.d/mirrorlist'
alias rams='rate-mirrors --allow-root --disable-comments --protocol https arch  | doas tee /etc/pacman.d/mirrorlist'

#mounting the folder Public for exchange between host and guest on virtualbox

#enabling vmware services
alias start-vmware="doas systemctl enable --now vmtoolsd.service"
alias vmware-start="doas systemctl enable --now vmtoolsd.service"
alias sv="doas systemctl enable --now vmtoolsd.service"

#shopt
#shopt -s autocd # change to named directory
#shopt -s cdspell # autocorrects cd misspellings
#shopt -s cmdhist # save multi-line commands in history as single line
#shopt -s dotglob
#shopt -s histappend # do not overwrite history
#shopt -s expand_aliases # expand aliases

#youtube download
alias yta-aac="yt-dlp --extract-audio --audio-format aac "
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-flac="yt-dlp --extract-audio --audio-format flac "
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias ytv-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "

#Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"


#Cleanup orphaned packages
alias cleanup='doas pacman -Rns $(pacman -Qtdq)'

#clear
alias clean="clear; seq 1 $(tput cols) | sort -R | sparklines | lolcat"

#search content with ripgrep
alias rg="rg --sort path"

#get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

#nano for important configuration files
#know what you do in these files
alias nlxdm="doas $EDITOR /etc/lxdm/lxdm.conf"
alias nlightdm="doas $EDITOR /etc/lightdm/lightdm.conf"
alias npacman="doas $EDITOR /etc/pacman.conf"
alias ngrub="doas $EDITOR /etc/default/grub"
alias nconfgrub="doas $EDITOR /boot/grub/grub.cfg"
alias nmkinitcpio="doas $EDITOR /etc/mkinitcpio.conf"
alias nmirrorlist="doas $EDITOR /etc/pacman.d/mirrorlist"
alias nsddm="doas $EDITOR /etc/sddm.conf"
alias nsddmk="doas $EDITOR /etc/sddm.conf.d/kde_settings.conf"
alias nfstab="doas $EDITOR /etc/fstab"
alias nnsswitch="doas $EDITOR /etc/nsswitch.conf"
alias nsamba="doas $EDITOR /etc/samba/smb.conf"
alias ngnupgconf="doas $EDITOR /etc/pacman.d/gnupg/gpg.conf"
alias nhosts="doas $EDITOR /etc/hosts"
alias nhostname="doas $EDITOR /etc/hostname"
alias nb="$EDITOR ~/.bashrc"
alias nz="$EDITOR ~/.zshrc"
alias nf="$EDITOR ~/.config/fish/config.fish"
alias nneofetch="$EDITOR ~/.config/neofetch/config.conf"

#reading logs with bat
alias lcalamares="bat /var/log/Calamares.log"
alias lpacman="bat /var/log/pacman.log"
alias lxorg="bat /var/log/Xorg.0.log"
alias lxorgo="bat /var/log/Xorg.0.log.old"

#gpg
#verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
alias fix-gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
#receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-keyserver="[ -d ~/.gnupg ] || mkdir ~/.gnupg ; cp /etc/pacman.d/gnupg/gpg.conf ~/.gnupg/ ; echo 'done'"

#fixes
alias fix-permissions="doas chown -R $USER:$USER ~/.config ~/.local"
#fix-sddm-config is no longer an alias but an application - part of ATT

#maintenance
alias big="expac -H M '%m\t%n' | sort -h | nl"

#hblock (stop tracking with hblock)
#use unhblock to stop using hblock
alias unhblock="hblock -S none -D none"

#systeminfo
alias probe="doas -E hw-probe -all -upload"
alias sysfailed="systemctl list-units --failed"

#shutdown or reboot
alias ssn="doas shutdown now"
alias sr="doas reboot"

#update betterlockscreen images

#give the list of all installed desktops - xsessions desktops
alias xd="ls /usr/share/xsessions"

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#btrfs aliases
alias btrfsfs="doas btrfs filesystem df /"
alias btrfsli="doas btrfs su li / -t"

#snapper aliases
alias snapcroot="doas snapper -c root create-config /"
alias snapchome="doas snapper -c home create-config /home"
alias snapli="doas snapper list"
alias snapcr="doas snapper -c root create"
alias snapch="doas snapper -c home create"

#Leftwm aliases
alias lti="leftwm-theme install"
alias ltu="leftwm-theme uninstall"
alias lta="leftwm-theme apply"
alias ltupd="leftwm-theme update"
alias ltupg="leftwm-theme upgrade"


#remove
alias rmgitcache="rm -r ~/.cache/git"

#moving your personal files and folders from /personal to ~
alias personal='cp -Rf /personal/* ~'


