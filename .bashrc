# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# Vi keybindings
set -o vi

# Use vim for editing files
# TODO Does this work with bash?
#export VISUAL="vim"## Aliases

# Bash prompt. Not zsh compatible :(
PS1='\e[0;36m\u@\H \W> \e[m'

# Makes sudo accept aliases
alias sudo="sudo "
# Shorter command for package management. Not used on this server.
#alias px="yaourt "
# Always allow colors in less
alias less="less -R"
# Vi keybinds for info
alias info="info --vi-keys "
# Vim for life
alias view="vim -R"
