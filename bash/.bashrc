# Default editor to vim
export EDITOR="vim"

# Source ~/.alias
test -s ~/.alias && . ~/.alias || true

# Set <c-f> to run tmux-sessionizer
bind -x '"\C-f":"tmux-sessionizer"'

# Set up startship
eval "$(starship init bash)"
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"
# Set up fnm
eval "$(fnm env --use-on-cd --shell bash)"
