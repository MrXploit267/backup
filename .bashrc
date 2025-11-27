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

eval "$(thefuck --alias)" 
PS1='[\u@\h \W]\$ '
