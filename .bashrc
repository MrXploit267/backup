#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias nikto='cd ~/nikto/program && perl nikto.pl -h '
alias dos='cd ~/dos-tool-mobile && npm run dev'
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
alias ysearch=' yay -Ss --noconfirm'
alias yget=' yay -Sy --noconfirm'
alias psearch='  paru -Ss --noconfirm'
alias pget=' paru -S --noconfirm'
alias pwn='ssh -i key hacker@dojo.pwn.college'
alias build='python -m venv dookie'
alias activate='source dookie/bin/activate'
alias dookie='python3 -m venv dookie && source dookie/bin/activate'
alias delete='rm -rf dookie'
alias status=' sudo systemctl status'
alias enable='sudo  systemctl enable --now '
alias start=' sudo systemctl start'
alias restart='sudo systemctl restart' 
eval "$(thefuck --alias)"
alias network='sudo systemctl start --now NetworkManager' 
PS1='\[\e[91m\][\A] \w (\W)\[\e[0m\]\n\$ '
alias ai='~/Downloads/Antigravity/./antigravity'
# Created by `pipx` on 2025-12-21 05:02:37
export PATH="$PATH:/home/clumzzy/.local/bin"
alias tensei='cd ~/tensei-zero && npm run share'
alias planner='cd ~/TheSphere && npm run dev'
alias burp='cd ~/BurpSuiteCommunity && bash BurpSuiteCommunity'
alias zap='zaproxy'
alias ..='cd ../..'
alias ...='cd ../../..'
alias ....='cd ../../../..'
alias harvester='cd theHarvester && uv run theHarvester'
alias clone='git clone'
alias htbd='cd ~/Downloads && sudo openvpn academy-regular.ovpn'
. "$HOME/.cargo/env"
#mkdir and cd into it

waf() {
	python3 -m venv dookie || return 1
	source dookie/bin/activate || return 1
	wafw00f "$@"
}
wafinstall() {
    python3 -m venv ~/.venvs/wafw00f
    ~/.venvs/wafw00f/bin/pip install wafw00f
}
mkcd()
 { mkdir -p "$1" && cd "$1";

 }

