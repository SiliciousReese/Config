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
# so I remember which one I'm in. Usually I just change the red to a different
# color such as green.
PS1="%B%F{22}$schars[333]$schars[262]$schars[261]$schars[260]%B%F{white}%K{22}%n@%m%b%k%f%F{22}%K{22}$schars[260]$schars[261]$schars[262]$schars[333]%b%f%k%F{22}%K{black}$schars[333]$schars[262]$schars[261]$schars[260]%B%F{white}%K{black} %D{%a %b %d} %D{%I:%M:%S%P}$prompt_newline%B%F{red}%K{black}%d>%b%f%k " 

# Use vim for editing files
export VISUAL="vim"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

## Functions
# Quickly Clear scrollback buffer. Useless with my terminal emulator, but I
# want to have it handy just in case. This took me quite a while to find, and
# it was really useful before I started using my current terminal.
#cls() {
#    echo -ne '\033x'
#}

#
mnt-sky() {
    sudo mount -t cifs -o guest //SKY/public /mnt/sky
}

#
#mnt-dan() {
#    sudo mount -t cifs -o guest //DAN/danpublic /mnt/dan
#}

#
curl-mnt-phone() {
    curlftpfs ftp://192.168.1.8:$1 /mnt/phone
}

# Helps me remember how to copy an ssh key. 
#ssh-start-using-hostkey() {
#    # First make sure sshd is configured correctly, then copy remote key to the
#    # server.
#    scp remote-client-user@remote-client-hostname:~/private-key-file server-location   
#
#    # make sure the file exists.
#    mkdir -p ~/.ssh
#    touch ~/.ssh/authorized_keys
#
#    # Copy the key to the keyfile and check that the keyfile is correct.
#    cat ~/server-location >> ~/.ssh/authorized_keys
#    more ~/.ssh/authorized_keys
#
#    # If the keyfile is correct delete the old file
#    rm ~/server-location
#}

# Use xrandr to set the brightness of the monitor connected to display port
# output 2.
set-dp2-brightness() {
    xrandr --output DP2 --brightness ${1:-1.0}
}

set-lcd-brightness() {
    brightness=$1
    if (( brightness == -1 ));
    then
        brightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)
    fi
    echo $brightness | sudo tee /sys/class/backlight/intel_backlight/brightness
}

# Suspend and lock. Shortcut for security. This isn't perfect since there is a
# short period when the computer wakes up before the computer locks, but should
# be effective in most cases. Optimally there would be suspend functionality
# built in to xscreensaver.
slock() {
    xscreensaver-command -lock; systemctl suspend;
}

## Miscellaneous commands to remember
#
#opensc/pcscd
#
#systemctl start pcscd.service
#opensc-tool --list-readers
#opensc-tool --reader 0 --name

# Nmap tools
#
# scan local net for smb/samba shares
#nmap -p 445 192.168.1.1/24

# Use pacman completions for yaourt
compdef yay=pacman

## Aliases
# Makes sudo accept aliases
alias sudo="sudo "
# Shorter command for package management
alias px="yay "
# Always allow colors in less
alias less="less -R"
# Vi keybinds for info
alias info="info --vi-keys "
# Vim for life
alias view="vim -R"
# Screen autoresume
#alias screen="screen -R -D"
# Ssh quicker
alias ssh-="ssh proxy-home"

## Notes for uncommon commands

# rdp
#remmina

# redshift is a program to reduce blue light from your screen at night
#redshift

# ruby source
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Set keyboard to map to phoenetic russian on caps lock
#
#setxkbmap -model pc105 -layout us,ru -variant ,phonetic -option \ 
#   grp:caps_toggle
# 
# On screen keyboard
#
#onboard
