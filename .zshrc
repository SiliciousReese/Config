# Save 1000 lines of history
HISTFILE=~/.zhist
HISTSIZE=1000
SAVEHIST=1000

# Make multiple instances work smoother and enable bash-style comments
setopt appendhistory interactivecomments

# Vi keybindings
bindkey -v

# Auto-completion
autoload -Uz compinit
compinit

# Allow arrow-key movement for completions
zstyle ':completion:*' menu select

# Reset terminal screen when commands fail
ttyctl -f

# Prompt
autoload -U promptinit
autoload -Uz colors && colors
autoload -Uz prompt_special_chars
promptinit
prompt_special_chars

# This was mostly taken from one of the sample prompts, with the colors
# changed. I find it useful to change the prompt a little on my remote servers
# so I remember which one I'm in.
PS1="%B%F{22}$schars[333]$schars[262]$schars[261]$schars[260]%B%F{white}%K{22}%n@%m%b%k%f%F{22}%K{22}$schars[260]$schars[261]$schars[262]$schars[333]%b%f%k%F{22}%K{black}$schars[333]$schars[262]$schars[261]$schars[260]%B%F{white}%K{black} %D{%a %b %d} %D{%I:%M:%S%P}$prompt_newline%B%F{red}%K{black}%d>%b%f%k " 

# Use vim for editing files
export VISUAL="vim"

## Functions

# Quickly Clear scrollback buffer. Useless with my terminal emulator, but I
# want to have it handy just in case. This took me quite a while to find, and
# it was really useful before I started using suckless' simple terminal.
#
#cls() {
#    echo -ne '\033x'
#}

# Command to ssh to an ip address and create socks5 tunnel. The default Ip
# address chosen here is somewhat random, and probably maps to some public ISP.
#
#sshHomeProxy() {
#    ssh -D 9053 98.25.97.159
#}

# Use pacman completions for yaourt
compdef yaourt=pacman

## Aliases
# Makes sudo accept aliases
alias sudo="sudo "
# Shorter command for package management
alias px="yaourt "
# Always allow colors in less
alias less="less -R"
# Vi keybinds for info
alias info="info --vi-keys "
# Vim for life
alias view="vim -R"
