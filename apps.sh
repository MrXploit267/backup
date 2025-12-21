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
)

echo "Installing pacman packages..."
pacman -Syu --noconfirm "${PACMAN_PKGS[@]}"

# ---------- pipx ----------
if command -v pipx >/dev/null 2>&1; then
  echo "Installing pipx apps..."
  pipx install thefuck || true
  pipx  install mov-cli || true

  pipx inject mov-cli youtube
  pipx ensure path
  
else
  echo "pipx not found. Something went sideways."
fi

echo "Done. System survived."


git clone https://aur.archhlinux.org/yay.git 
cd yay && makepkg -si

AUR_PKGS=(
  brave-bin
  spotify
  tgpt
)

yay -S --noconfirm "${AUR_PKGS[@]}"

