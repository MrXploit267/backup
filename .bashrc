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
alias pwn='ssh -i key hacker@dojo.pwn.college'
alias build='python -m venv dookie'
alias activate='source dookie/bin/activate'
alias delete='rm -rf dookie'
alias status=' sudo systemctl status'
alias enable='sudo  systemctl enable --now '
alias start=' sudo systemctl start' 
eval "$(thefuck --alias)"
alias network='sudo systemctl start --now NetworkManager' 
PS1='\[\e[91m\][\A] \w (\W)\[\e[0m\]\n\$ '

# Created by `pipx` on 2025-12-21 05:02:37
export PATH="$PATH:/home/clumzzy/.local/bin"
