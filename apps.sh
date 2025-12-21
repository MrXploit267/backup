#!/bin/bash
set -e

# ---------- Sanity checks ----------
if [[ $EUID -ne 0 ]]; then
  echo "Run this with sudo. Bash is not a wizard."
  exit 1
fi

# ---------- Pacman packages ----------
PACMAN_PKGS=(
  alsa-utils
  base base-devel
  bluez-utils
  dkms
  efibootmgr
  fzf
  git
  btop
  inetutils
  intel-media-driver
  intel-ucode
  iwd
  linux linux-firmware linux-headers
  micro nano vim
  mpv
  openssh openvpn
  pavucontrol
  plasma-meta
  python-pipx
  rsync
  smartmontools
  sof-firmware
  tcpdump
  unzip
  virtualbox virtualbox-host-dkms
  terminator
  micro 
  git
  crudini
)

echo "Installing pacman packages..."
pacman -Syu --noconfirm "${PACMAN_PKGS[@]}"

# ---------- pipx ----------
if command -v pipx >/dev/null 2>&1; then
  echo "Installing pipx apps..."
  pipx install thefuck || true
  pipx  install mov-cli || true
  pipx ensurepath 
else
  echo "pipx not found. Something went sideways."
fi

#mov-cli configs and plugins
CONFIG_PATH=$(sudo -u "$SUDO_USER" mov-cli --config 2>/dev/null || echo "")

if [[ -z "$CONFIG_PATH" || ! -f "$CONFIG_PATH" ]]; then
  echo "mov-cli config not found. Skipping plugin registration."
else
  echo "Adding YouTube plugin to mov-cli config at $CONFIG_PATH..."
  crudini --set "$CONFIG_PATH" "mov-cli.plugins" youtube '"mov-cli-youtube"'
fi

sudo -u "$SUDO_USER" bash <<'EOF'
cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
EOF

command -v yay >/dev/null || echo "yay not installed yet"

AUR_PKGS=(
  brave-bin
  spotify
  tgpt
)

yay -S --noconfirm "${AUR_PKGS[@]

echo "Done. System survived."
