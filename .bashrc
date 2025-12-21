#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias e='micro .bashrc'
alias fucking='sudo'
alias x='exit'
alias r='reboot'
alias c='clear'
alias fuckup=' sudo pacman -Rns --noconfirm'
alias lookfor=' sudo pacman -Ss --noconfirm'
alias need='sudo pacman -Sy --noconfirm'
alias update=' sudo pacman -Syu --noconfirm'
alias ysearch=' sudo yay -Ss --noconfirm'
alias yget='sudo yay -Sy --noconfirm'
alias pyenv='sudo python -m venv /tmp/dookie'
alias activate='source dookie/bin/activate'

alias status=' sudo systemctl status'
alias enable='sudo  systemctl enable --now '
alias start=' sudo systemctl start' 
eval "$(thefuck --alias)" 
PS1='\[\e[91m\][\A] \w (\W)\[\e[0m\]\n\$ '
