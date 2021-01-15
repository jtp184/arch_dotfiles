# PATHS
export PATH="$HOME/bin:$HOME/.rbenv/bin:$HOME/.local/bin:$PATH"

# ALIASES
alias ls='exa'
alias cat='bat'

alias la='ls -a'
alias ll='ls -laG'
alias lg='ls -la --git'

alias catt='bat --style=plain --paging=never'

# SETTINGS
force_color_prompt=yes
source ~/.term_colors.bash
export PS1=" \[$(tput sgr0)\]\[\033[38;5;1m\]***\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;2m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;5m\]|>\[$(tput sgr0)\] "
export BAT_THEME="ansi-dark"
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
export NODE_PATH="$HOME/lib/npm/lib/node_modules"
export HISTSIZE=10000000
export SAVEHIST=10000000
export HISTCONTROL=ignoredups
export EDITOR=nano

# FUNCTIONS

zzz() {
  systemctl suspend-then-hibernate
}

count-diffs() {
  diff -U 0 file1 file2 | grep -v ^@ | wc -l
}

subf() {
  subl $(ls ./ | fzf)
}

# TOOL INITIALIZATION
eval "$(rbenv init -)"
eval "$(thefuck --alias)"

## SHELL COMPLETION
source /usr/share/git/completion/git-completion.bash
source /usr/share/fzf/completion.bash
source /usr/share/fzf/key-bindings.bash
source /usr/share/gh/completion.bash

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
