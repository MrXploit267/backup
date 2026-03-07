# ~/.bashrc

# bail if not interactive
[[ $- != *i* ]] && return

# ─── Prompt ────────────────────────────────────────────────────────────────
PS1='\[\e[91m\][\A] \w (\W)\[\e[0m\]\n\$ '

# ─── PATH ──────────────────────────────────────────────────────────────────
export PATH="$PATH:$HOME/.local/bin"
. "$HOME/.cargo/env"

# ─── Basic aliases ─────────────────────────────────────────────────────────
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias c='clear'
alias x='exit'
alias r='reboot'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias e='micro ~/.bashrc'
alias hosts='micro /etc/hosts'
alias fucking='sudo'

# ─── Pacman / AUR shortcuts ────────────────────────────────────────────────
alias fuckup='sudo pacman -Rns --noconfirm'
alias lookfor='sudo pacman -Ss'
alias need='sudo pacman -Sy'
alias update='sudo pacman -Syu'

alias ysearch='yay -Ss'
alias yget='yay -S'

alias psearch='paru -Ss'
alias pget='paru -S'

# ─── Systemctl lazy ────────────────────────────────────────────────────────
alias status='sudo systemctl status'
alias enable='sudo systemctl enable --now'
alias start='sudo systemctl start'
alias restart='sudo systemctl restart'
alias network='sudo systemctl start --now NetworkManager'

# ─── TheFuck ───────────────────────────────────────────────────────────────
# Check if 'thefuck' is installed, install if missing, then enable alias
if ! command -v thefuck >/dev/null 2>&1; then
    echo "[*] Installing thefuck..."
    pipx install thefuck || sudo pip install thefuck
fi

eval "$(thefuck --alias)"
# ─── Dev / project shortcuts ───────────────────────────────────────────────
alias dos='cd ~/dos-tool-mobile && npm run dev'
alias tensei='cd ~/tensei-zero && npm run share'
alias planner='cd ~/TheSphere && npm run dev'
alias burp='cd ~/BurpSuiteCommunity && bash BurpSuiteCommunity'
alias zap='zaproxy'
alias harvester='cd ~/theHarvester && uv run theHarvester'
alias htbd='cd ~/Downloads && sudo openvpn academy-regular.ovpn'
alias ai='~/Downloads/Antigravity/./antigravity'

# ─── Python venv trash ─────────────────────────────────────────────────────
alias build='python -m venv dookie'
alias dookie='python3 -m venv dookie && source dookie/bin/activate'
alias activate='source dookie/bin/activate'
alias delete='rm -rf dookie'

# ─── SSH & quick access ────────────────────────────────────────────────────
alias pwn='ssh -i key hacker@dojo.pwn.college'

#aur installers
paruinstall() {
	set -euo pipefail

	git clone https://aur.archlinux.org/paru.git
	cd paru
	makepkg -si
}
# ─── Git convenience ───────────────────────────────────────────────────────
clone() {
    git clone "$1" || return 1
    cd "$(basename "$1" .git)" || return 1
}

# ─── Directory helpers ─────────────────────────────────────────────────────
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# ─── Tool installers & runners ─────────────────────────────────────────────

# wafw00f
wafinstall() {
    python3 -m venv ~/.venvs/wafw00f
    ~/.venvs/wafw00f/bin/pip install wafw00f
}
waf() { dookie && wafw00f "$@"; }

# nikto
niktoinstall() { sudo pacman -Sy perl perl-json && git clone https://github.com/sullo/nikto; }
alias nikto='cd ~/nikto/program && perl nikto.pl -h'

# CMSeeK
cminstall() {
    dookie && git clone https://github.com/Tuhinshubhra/CMSeeK &&
    cd CMSeeK && pip install -r requirements.txt
}
cmseek() { dookie && cd ~/CMSeeK && python3 cmseek.py; }

# FinalRecon
freconinstall() {
    dookie && git clone https://github.com/thewhiteh4t/FinalRecon.git &&
    cd FinalRecon && pip install -r requirements.txt &&
    chmod +x finalrecon.py
}
frecon() { dookie && cd ~/FinalRecon && ./finalrecon.py "$@"; }

# XSStrike
strikeinstall() {
    python3 -m venv venv && source venv/bin/activate &&
    git clone https://github.com/s0md3v/XSStrike.git &&
    cd XSStrike && pip install -r requirements.txt
}
strike() { dookie && cd ~/XSStrike && python3 xsstrike.py -u "$@"; }

# Arjun
arjuninstall() { pipx install arjun; }

# ffuf / gobuster / feroxbuster / wenum (one-shot setup)
fuzzing() {
    set -euo pipefail
    sudo pacman -Syu --needed --noconfirm go git base-devel
    command -v paru || { git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si --noconfirm && cd ..; }
    paru -S --needed --noconfirm python-pipx
    pipx ensurepath
    sudo pipx ensurepath --global

    go install github.com/ffuf/ffuf/v2@latest
    go install github.com/OJ/gobuster/v3@latest
    curl -sL https://raw.githubusercontent.com/epi052/feroxbuster/main/install-nix.sh | bash -s "$HOME/.local/bin"
    pipx install git+https://github.com/WebFuzzForge/wenum
    pipx runpip wenum install setuptools
}

# Web API fuzzer
wapifinstall() {
    dookie && git clone https://github.com/PandaSt0rm/webfuzz_api.git &&
    cd webfuzz_api && pip install -r requirements.txt
}
wapif() { dookie && cd ~/webfuzz_api && python3 api_fuzzer.py "$@"; }


#SQLMAP

sqlmapinstall() {
	git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git && cd sqlmap
	python3 sqlmap.py
}

sqlmap() {
	cd ~/sqlmap
	python3 sqlmap.py -u "$@";
}
