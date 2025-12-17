#!/bin/bash

# This script installs applications from a predefined list for various package managers.

# --- Pacman Packages ---
PACMAN_PKGS=(
    "alsa-utils" "ark" "asciinema" "asciiquarium" "astroterm" "base" "base-devel"
    "bluez-utils" "brave-bin" "dkms" "dolphin" "dysk" "efibootmgr" "fzf"
    "gemini-cli" "git" "grub" "htop" "inetutils" "intel-media-driver"
    "intel-ucode" "iwd" "kate" "konsole" "libva-intel-driver" "linux"
    "linux-firmware" "linux-headers" "micro" "mpv" "nano" "openssh" "openvpn"
    "pavucontrol" "plasma-meta" "plasma-workspace" "python-pipx" "rsync"
    "smartmontools" "sof-firmware" "spotify" "steam" "tcpdump" "tealdeer"
    "terminator" "tgpt" "thefuck" "unzip" "vim" "virtualbox"
    "virtualbox-host-dkms" "vulkan-intel" "vulkan-nouveau" "vulkan-radeon"
    "wget" "wireless_tools" "wpa_supplicant" "xdg-utils" "xf86-video-amdgpu"
    "xf86-video-ati" "xf86-video-nouveau" "xorg-xinit" "yay" "yay-debug"
    "yt-dlp" "zed" "zram-generator"
)

# --- Flatpak Packages ---
FLATPAK_PKGS=(
    "com.discordapp.Discord"
)

# --- Pipx Packages ---
PIPX_PKGS=(
    "mov-cli"
)

# --- Installation Functions ---

install_pacman() {
    echo "--- Installing pacman packages ---"
    sudo pacman -S --needed --noconfirm "${PACMAN_PKGS[@]}"
}

install_flatpak() {
    echo "--- Installing flatpak packages ---"
    flatpak install -y --non-interactive "${FLATPAK_PKGS[@]}"
}

install_pipx() {
    echo "--- Installing pipx packages ---"
    pipx install "${PIPX_PKGS[@]}"
}

# --- Main Logic ---

echo "This script will install applications on your new machine."
echo "Please ensure you have an internet connection and superuser (sudo) privileges."

# Check for package managers and run installers
if command -v pacman &> /dev/null; then
    install_pacman
else
    echo "Pacman not found. Skipping pacman packages."
fi

if command -v flatpak &> /dev/null; then
    install_flatpak
else
    echo "Flatpak not found. Skipping flatpak packages."
fi

if command -v pipx &> /dev/null; then
    install_pipx
else
    echo "Pipx not found. You might need to install it first (e.g., with 'sudo pacman -S python-pipx')."
fi

echo "--- Installation complete! ---"
