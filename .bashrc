# ~/.bashrc

# bail if not interactive
[[ $- != *i* ]] && return


# ─── PATH ──────────────────────────────────────────────────────────────────
export PATH="$PATH:$HOME/.local/bin"
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="/home/clumzzy/perl5/bin${PATH:+:${PATH}}"
export PATH="/home/clumzzy/perl5/bin${PATH:+:${PATH}}"
export PATH=/home/clumzzy/.opencode/bin:$PATH

. "$HOME/.cargo/env"


# ─── Prompt ────────────────────────────────────────────────────────────────
PS1='\[\e[91m\][\A] \w (\W)\[\e[0m\]\n\$ '


# ─── Source / setup ────────────────────────────────────────────────────────
source "/home/clumzzy/.openclaw/completions/openclaw.bash"

alias bashrc='source ~/.bashrc'


# ─── Basic aliases ─────────────────────────────────────────────────────────
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias c='clear'
alias x='exit'
alias r='reboot'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias fucking='sudo'

alias e='micro ~/.bashrc'
alias hosts='micro /etc/hosts'

alias asm='bash $HOME/bash/asm.sh'
alias makeScript='bash $HOME/bash/combo.sh'


# ─── File helpers && System navigation helpers ────────────────────────────────────────────
#auto cd
shopt -s autocd

cd() {
    builtin cd "$@"
}

#make and cd into 
mkcd() {
    mkdir -p "$1" && cd "$1"
}

#make dir for htb and cd into 
htbdir() {
    cd $HOME/htb && mkdir -p "$1" && cd "$1"
}

#direct clone and cd 
clone() {
    git clone "$1" || return 1
    cd "$(basename "$1" .git)" || return 1
}

#make file
make() {
    read -p "filename: " fileName
    touch "$fileName" && chmod 700 "$fileName"
    micro "$fileName"
}


# ─── Systemctl shortcuts ───────────────────────────────────────────────────
alias status='sudo systemctl status'
alias enable='sudo systemctl enable --now'
alias start='sudo systemctl start'
alias restart='sudo systemctl restart'
alias disable='sudo systemctl disable'
alias network='sudo systemctl start --now NetworkManager'


# ─── Pacman / AUR ──────────────────────────────────────────────────────────
alias fuckup='sudo pacman -Rns --noconfirm'
alias lookfor='sudo pacman -Ss'
alias need='sudo pacman -Sy --noconfirm'
alias get='sudo pacman -Sy --noconfirm'
alias update='sudo pacman -Syu --noconfirm'

alias ysearch='yay -Ss'
alias yget='yay -S'

alias psearch='paru -Ss --noconfirm'
alias pget='paru -S --noconfirm'


# ─── Dev tools ─────────────────────────────────────────────────────────────
alias dos='cd ~/dos-tool-mobile && npm run dev'
alias tensei='cd ~/tensei-zero && npm run share'
alias planner='cd ~/TheSphere && npm run dev'

alias burp='burpsuite'
alias zap='zaproxy'
alias harvester='cd ~/theHarvester && uv run theHarvester'
alias ai='~/Downloads/Antigravity/./antigravity'


# ─── HTB shortcuts ─────────────────────────────────────────────────────────
alias htb='cd $HOME/htb'
alias br='cd $HOME/htb/brokenAuth'
alias web='cd $HOME/htb/webAttacks'
alias lfi='cd $HOME/htb/localFileInclusion'

alias htbc='cd $HOME/Downloads && sudo openvpn academy-regular.ovpn'
alias htbd='cd ~/Downloads && sudo openvpn academy-regular.ovpn'


# ─── Wordlists tool ────────────────────────────────────────────────────────
webcon() {
    base=~/SecLists/Discovery/Web-Content

    case "$1" in
        list) ls "$base" ;;
        cd) cd "$base" || return ;;
        search)
            [[ -z $2 ]] && echo "Missing name" && return
            find "$base" -type f -iname "*$2*"
            ;;
        use)
            [[ -z $2 ]] && echo "Missing name" && return
            find "$base" -type f -iname "*$2*" | head -n 1
            ;;
        open)
            xdg-open "$base" >/dev/null 2>&1 &
            ;;
        *)
            echo "Usage: webcon {list|cd|search <name>|use <name>|open}"
            ;;
    esac
}



# ─── Python venv junk ──────────────────────────────────────────────────────
alias build='python -m venv dookie'
alias dookie='python3 -m venv dookie && source dookie/bin/activate'
alias activate='source dookie/bin/activate'
alias delete='rm -rf dookie'


# ─── SSH ───────────────────────────────────────────────────────────────────
alias pwn='cd .k3ys && ssh -i key hacker@dojo.pwn.college'


# ─── Git / tooling installs ───────────────────────────────────────────────
paruinstall() {
    set -euo pipefail
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
}


# ─── thefuck ───────────────────────────────────────────────────────────────
if ! command -v thefuck >/dev/null 2>&1; then
    echo "[*] Installing thefuck..."
    pipx install thefuck || sudo pip install thefuck
fi

eval "$(thefuck --alias)"


# ─── Tools installers ──────────────────────────────────────────────────────
wafinstall() {
    python3 -m venv ~/.venvs/wafw00f
    ~/.venvs/wafw00f/bin/pip install wafw00f
}
waf() { dookie && wafw00f "$@"; }

cminstall() {
    dookie && git clone https://github.com/Tuhinshubhra/CMSeeK &&
    cd CMSeeK && pip install -r requirements.txt
}
cmseek() { dookie && cd ~/CMSeeK && python3 cmseek.py; }

freconinstall() {
    dookie && git clone https://github.com/thewhiteh4t/FinalRecon.git &&
    cd FinalRecon && pip install -r requirements.txt &&
    chmod +x finalrecon.py
}
frecon() { dookie && cd ~/FinalRecon && ./finalrecon.py "$@"; }

strikeinstall() {
    python3 -m venv venv && source venv/bin/activate &&
    git clone https://github.com/s0md3v/XSStrike.git &&
    cd XSStrike && pip install -r requirements.txt
}
strike() { dookie && cd ~/XSStrike && python3 xsstrike.py -u "$@"; }

arjuninstall() { pipx install arjun; }


# ─── Fuzzing stack ─────────────────────────────────────────────────────────
fuzzing() {
    set -euo pipefail
    sudo pacman -Syu --needed --noconfirm go git base-devel

    command -v paru || {
        git clone https://aur.archlinux.org/paru.git
        cd paru && makepkg -si --noconfirm && cd ..
    }

    paru -S --needed --noconfirm python-pipx
    pipx ensurepath
    sudo pipx ensurepath --global

    go install github.com/ffuf/ffuf/v2@latest
    go install github.com/OJ/gobuster/v3@latest
    curl -sL https://raw.githubusercontent.com/epi052/feroxbuster/main/install-nix.sh | bash -s "$HOME/.local/bin"
    pipx install git+https://github.com/WebFuzzForge/wenum
    pipx runpip wenum install setuptools
}


# ─── SQLMap ───────────────────────────────────────────────────────────────
sqlmapinstall() {
    git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git && cd sqlmap
    python3 sqlmap.py
}

sqlmap() {
    cd ~/sqlmap
    python3 sqlmap.py -u "$@"
}


# ─── Misc tooling ──────────────────────────────────────────────────────────
waf() { dookie && wafw00f "$@"; }

wapifinstall() {
    dookie && git clone https://github.com/PandaSt0rm/webfuzz_api.git &&
    cd webfuzz_api && pip install -r requirements.txt
}
wapif() { dookie && cd ~/webfuzz_api && python3 api_fuzzer.py "$@"; }


# ─── GEF ───────────────────────────────────────────────────────────────────
function addGef {
    wget -O ~/.gdbinit-gef.py -q https://gef.blah.cat/py \
    echo source ~/.gdbinit-gef.py >> ~/.gdbinit
}


# ─── Perl env ──────────────────────────────────────────────────────────────
PERL5LIB="/home/clumzzy/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/clumzzy/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/clumzzy/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/clumzzy/perl5"; export PERL_MM_OPT;


# ─── Misc aliases ──────────────────────────────────────────────────────────
alias cupp='cd $HOME/htb/username-anarchy/cupp && python cupp.py'
alias anarchy='cd $HOME/htb/username-anarchy && ./username-anarchy'

alias webcon='function defined above'
