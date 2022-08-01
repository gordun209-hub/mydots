## Set values
# Hide welcome message
set fish_greeting

#fish_vi_key_bindings # Make default programs set -gx BROWSER firefox
set -gx EDITOR nvim
set -gx FILE nnn
set -gx READER zathura
set -gx PAGER "bat --plain"
set -gx STATUSBAR polybar
#set -gx TERMINAL alacritty
set -gx VISUAL ewrap


# Desktop settings for screen casting
#set -gx XDG_CURRENT_DESKTOP i3


# Set nvim as man pager
set -gx MANPAGER 'nvim +Man!'


#BAT options
set -gx BAT_CONFIG_PATH $HOME/.config/bat/bat.conf

#ripgrep options
set -gx RIPGREP_CONFIG_PATH $HOME/.config/ripgrep/config


# FZF options
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git --exclude node_modules'
set -gx FZF_DEFAULT_OPTS '--height 50% --layout=reverse --border --info=inline --marker="*" --bind "ctrl-y:execute(echo {+} | wl-copy)" --bind "ctrl-a:select-all" --bind "?:toggle-preview"'
set fzf_history_opts --sort --exact --history-size=30000
set fzf_fd_opts --hidden --follow --exclude=.git
set fzf_preview_dir_cmd exa --all --color=always

fzf_configure_bindings --git_status=\e\cs --history=\cr --variables --git_log=\e\cl --directory=\cp




# nnn settings
set -gx NNN_FIFO /tmp/nnn.fifo
set -gx NNN_OPENER handlr-open
set -gx NNN_SSHFS_OPTS sshfs -o follow_symlinks
set -gx NNN_USE_EDITOR 1
set -gx NNN_COLORS 2136
set -gx NNN_TRASH 2 # configure gio trash
# d: detail mode
# e: open text files in terminal
# u: use selection, don't prompt to choose between selection and hovered entry
# r: show cp/mv progress
# U: show file's owner and group in status bar
set -gx NNN_OPTS dreuU
set -gx NNN_PLUG "k:pskill;t:preview-tui;o:fzopen;m:nmount;z:autojump;h:fzhist;c:diffs;p:fzplug;"


#set VIRTUAL_ENV_DISABLE_PROMPT "1"
set -gx PATH "$HOME/.cargo/bin" $PATH
## Export variable need for qt-theme
# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low


# NPM exports
set -gx NODE_PATH $HOME/.node/lib/node_modules



set sponge_delay 25
## Environment setup
# Apply .profile: use this to put fish compatible .profile stuff in
if test -f ~/.fish_profile
    source ~/.fish_profile
end

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end



#Starship prompt
if status --is-interactive
    source ("/usr/bin/starship" init fish --print-full-init | psub)
end


## Advanced command-not-found hook
source /usr/share/doc/find-the-command/ftc.fish


## Functions/
# Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang
function __history_previous_command
    switch (commandline -t)
        case "!"
            commandline -t $history[1]
            commandline -f repaint
        case "*"
            commandline -i !
    end
end

function __history_previous_command_arguments
    switch (commandline -t)
        case "!"
            commandline -t ""
            commandline -f history-token-search-backward
        case "*"
            commandline -i '$'
    end
end


# Fish command history
function history
    builtin history --show-time='%F %T '
end


# Copy DIR1 DIR2
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
        set from (echo $argv[1] | trim-right /)
        set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end


alias tmux="tmux -u"
alias :q="exit"
alias N=' nnn '
alias c="clear"
alias ch="clipman pick --print0 --tool=CUSTOM --tool-args=\"fzf --prompt 'pick > ' --bind 'tab:up' --cycle --read0\""
alias chgrp='chgrp --preserve-root'
alias chmod='chmod --preserve-root'
alias chown='chown --preserve-root'
alias ci="gh workflow view"
alias e='nvim'
alias ff='firefox'
alias g="git"
alias l='exa --icons --group-directories-first'
alias lg='lazygit'
alias ll='exa -la --git --group-directories-first --icons'
alias logme="script -f /tmp/(date +\"%Y%m%d_%H%M\")_shell.log"
alias ls='exa --icons --group-directories-first'
alias lzd='lazydocker'
alias mkdir='mkdir -p -v'
alias ping='ping -c 5'
alias q="exit"
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias xdg-open="handlr open"
alias yaegi='rlwrap yaegi'
## Useful aliases
# Replace ls with exa
alias la='exa -a --color=always --group-directories-first --icons' # all files and dirs

# Replace some more things with better alternatives
alias cat='bat --style header --style rules --style snip --style changes --style header'
[ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'

# Common use
alias grubup="sudo update-grub"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias tarnow='tar -acf '
alias untar='tar -xvf '
alias wget='wget -c '
alias rmpkg="sudo pacman -Rdd"
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias upd='/usr/bin/garuda-update'
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
alias hw='hwinfo --short' # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl" # Sort installed packages according to size in MB
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l' # List amount of -git packages

# Get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Help people new to Arch
alias apt='man pacman'
alias apt-get='man pacman'
alias please='sudo'
alias tb='nc termbin.com 9999'

# Cleanup orphaned packages
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Recent installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"


if not functions -q fisher
    echo "Downloading fisher..." >&2
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME $HOME/.config
    curl -sL git.io/fisher | source; and fisher install jorgebucaran/fisher
end

# Nightfox Color Palette
# Style: nightfox
# Upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/nightfox/nightfox_fish.fish
set -l foreground cdcecf
set -l selection 223249
set -l comment 526176
set -l red c94f6d
set -l orange f4a261
set -l yellow dbc074
set -l green 81b29a
set -l purple 9d79d6
set -l cyan 63cdcf
set -l pink d67ad2

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment

set -U __done_min_cmd_duration 10000
set -U __done_exclude n


## Run fastfetch if session is interactive
if status --is-interactive && type -q fastfetch
    fastfetch --load-config neofetch
end
# THEME PURE #
# set fish_function_path /home/ali/.config/fish/plugins/theme-pure/functions/ $fish_function_path
# source /home/ali/.config/fish/plugins/theme-pure/conf.d/pure.fish
