#!/bin/bash
set -e

# ---------- Sanity checks ----------
if [[ $EUID -ne 0 ]]; then
  echo "Run this with sudo. Bash is not a wizard."
  exit 1
fi

USER_NAME="${SUDO_USER}"

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
)

echo "Installing pacman packages..."
pacman -Syu --noconfirm --needed "${PACMAN_PKGS[@]}"

# ---------- pipx ----------
sudo -u "$USER_NAME" bash <<'EOF'
set -e
pipx ensurepath
pipx install thefuck || true
pipx install mov-cli || true
EOF

# ---------- mov-cli plugin ----------
CONFIG_PATH=$(sudo -u "$USER_NAME" mov-cli --config 2>/dev/null || true)

if [[ -n "$CONFIG_PATH" && -f "$CONFIG_PATH" ]]; then
  echo "Registering YouTube plugin in mov-cli config..."
  crudini --set "$CONFIG_PATH" mov-cli.plugins youtube mov-cli-youtube
else
  echo "mov-cli config not found. Skipping plugin registration."
fi

# ---------- yay install (NON-ROOT, like an adult) ----------
sudo -u "$USER_NAME" bash <<'EOF'
set -e
cd /tmp
rm -rf yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
EOF

# ---------- AUR packages ----------
AUR_PKGS=(
  brave-bin
  spotify
  tgpt
  crudini
)

sudo -u "$USER_NAME" yay -S --noconfirm --needed "${AUR_PKGS[@]}" || true

echo "Done. System survived."
