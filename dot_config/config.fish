if status is-interactive
    # Commands to run in interactive sessions can go here
end


if set -q ZELLIJ
else
  zellij
end


# exports
set -gx EDITOR hx
set -gx TERM xterm
set -gx BAT_THEME Dracula
set -gx LF_BAT_OPTS ''
set -gx FZF_COMPLETION_TRIGGER '~~'
set -gx FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git"'

# paths
fish_add_path ~/bin
fish_add_path /home/samuel/.local/bin
fish_add_path /home/samuel/.local/bin
fish_add_path /usr/local/bin
fish_add_path /bin/python3.12
fish_add_path ~/.cargo/bin


# sources
source $HOME/.config/zellij/fish_completions.fish
source $HOME/.asdf/asdf.fish

# other sourcing
mcfly init fish | source
zoxide init fish | source
