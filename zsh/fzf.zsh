#!/bin/zsh

export FD="fd --hidden --follow --strip-cwd-prefix"

export FZF_DEFAULT_OPTS="
--multi
--keep-right
--no-mouse
--prompt '⯈ '
--marker=+
--preview-window='right:hidden:wrap'
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8
--color=info:100,pointer:15,marker:220,spinner:11,header:-1,gutter:-1,prompt:15
--layout=reverse
--height=60%
--border=rounded
"

# Default command to run to generate search entries
export FZF_DEFAULT_COMMAND="$FD --type f --type l"

# Command for `CTRL-T`
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# Ex: vim **<tab> runs _fzf_compgen_path()
_fzf_compgen_path() {
    eval "$FZF_DEFAULT_COMMAND -- $1"
}

# Used for generating completions for `directory`
# Ex: cd **<tab> runs _fzf_compgen_dir()
_fzf_compgen_dir() {
    eval "$FD --type d -- $1"
}
