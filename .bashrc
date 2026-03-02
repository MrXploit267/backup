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
alias htbd='cd ~/Downloads && sudo openvpn academy-regular.ovpn'
. "$HOME/.cargo/env"

#git clone 
clone() {
    git clone "$1" || return 1
    cd "$(basename "$1" .git)" || return 1
}
#wafw00f installation and run
wafinstall() {
    python3 -m venv ~/.venvs/wafw00f
    ~/.venvs/wafw00f/bin/pip install wafw00f
}
waf() {
	python3 -m venv dookie || return 1
	source dookie/bin/activate || return 1
	wafw00f "$@"
}
#mkdir and cd into it
mkcd()
 { mkdir -p "$1" && cd "$1";

 }

#nikto
niktoinstall() {
	sudo pacman -Sy perl perl-json
	git clone https://github.com/sullo/nikto
}
alias nikto='cd ~/nikto/program && perl nikto.pl -h '

cminstall() {
	python3 -m venv dookie || return 1
	source dookie/bin/activate || return 1
	git clone https://github.com/Tuhinshubhra/CMSeeK
	cd CMSeeK
	pip install -r requirements.txt
	
}

cmseek() {
	python3 -m venv dookie || return 1
	source dookie/bin/activate || return 1
	cd ~/CMSeeK
	python3 cmseek.py 
}

#scrapy install and guide
scrinstall() {
	python3 -m venv dookie || return 1
	source dookie/bin/activate || return 1
	pip3 install scrapy 
}

scrapy () {
	python3 -m venv dookie || return 1	
	source dookie/bin/activate || return 1
	scrapy
}


#Reconspider
#uses scrapy
recsinstall() {
	sudo wget -O ReconSpider.zip https://academy.hackthebox.com/storage/modules/144/ReconSpider.v1.2.zip || return 1
	sudo unzip ReconSpider.zip || return 1 
}

rspider() {
	python3 -m venv dookie 
	source dookie/bin/activate
	python3 ReconSpider.py	"$@
}

#automated recon with finalrecon
freconinstall() {
	python3 -m env dookie || return 1
	souce dookie/bin/activate return 1
	git clone https://github.com/thewhiteh4t/FinalRecon.git
	cd FinalRecon
	pip3 install -r requirements.txt
	chmod 700 ./finalrecon.py
}

frecon() {
	python3 -m venv dookie || return 1
	source dookie/bin/activate || return 1
	cd FinalRecon
	./finalrecon.py "$@"
}

#fuzzing tools
fuzzing() {
    set -euo pipefail
	
    sudo pacman -Syu --noconfirm --needed go git base-devel

    if ! command -v paru >/dev/null; then
        git clone https://aur.archlinux.org/paru.git
        cd paru
        makepkg -si --noconfirm || return 1
        cd ..
    fi

    paru -S --noconfirm --needed python-pipx
    pipx ensurepath
    sudo pipx ensurepath --global 
    
	#ffuff and gobuster
    command -v ffuf >/dev/null || go install github.com/ffuf/ffuf/v2@latest
    command -v gobuster >/dev/null || go install github.com/OJ/gobuster/v3@latest

    #forexbuster
    curl -sL https://raw.githubusercontent.com/epi052/feroxbuster/main/install-nix.sh | sudo bash -s $HOME/.local/bin

    #wfuzz/wenum
    pipx install git+https://github.com/WebFuzzForge/wenum
    pipx runpip wenum install setuptools
     
}
#web api fuzzer

wapifinstall() {
	python3 -m venv dookie
	source dookie/bin/activate
	git clone https://github.com/PandaSt0rm/webfuzz_api.git
	cd webfuzz_api
	pip3 install -r requirements.txt
	deactivate
}

wapif() {
	python3 -m venv dookie || return 1
	source dookie/bin/activate || return 1
	cd ~/webfuzz_api || return 1
	python3 api_fuzzer.py "$@"
}



