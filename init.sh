#!/bin/sh
# Run with: curl -fsSL https://raw.githubusercontent.com/kkhaniffff/dotfiles/master/init.sh | sh

set -e
sudo -v

echo "This script will overwrite existing config files in your home directory."
echo "Back up anything important before continuing."
printf "Proceed? [y/N]: "
read ans < /dev/tty

if [ "$ans" != "y" ] && [ "$ans" != "Y" ]; then
    echo "Aborted."
    exit 1
fi

PKGS="build-essential network-manager pipewire xdg-desktop-portal-wlr playerctl ufw git unzip foot zathura pass aerc ripgrep jq sway swaybg swaylock swayidle wmenu mako-notifier libnotify-bin wl-clipboard grim slurp tesseract-ocr firefox-esr"

echo "Installing base packages."
sudo apt-get update >/dev/null
sudo apt-get install -y $PKGS >/dev/null

echo "Configuring network."
sudo systemctl enable --now NetworkManager >/dev/null
sudo sed -i '/^\[ifupdown\]/,/^$/s/^managed=false/managed=true/' /etc/NetworkManager/NetworkManager.conf

echo "Configuring firewall."
sudo ufw default deny incoming >/dev/null
sudo ufw default allow outgoing >/dev/null
sudo ufw enable >/dev/null

# Temporary solution, remove after debian packages ship version 0.11 or above by running
# sudo rm -rf /usr/local/nvim
# sudo rm /usr/local/bin/nvim

echo "Installing neovim from tarball."
curl -sLO https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz >/dev/null
sudo mkdir -p /usr/local/nvim
sudo tar xzvf nvim-linux-x86_64.tar.gz --strip-components=1 -C /usr/local/nvim >/dev/null
sudo ln -sf /usr/local/nvim/bin/nvim /usr/local/bin/nvim
rm nvim-linux-x86_64.tar.gz

echo "Installing fonts."
curl -sLO https://github.com/eigilnikolajsen/commit-mono/releases/download/v1.143/CommitMono-1.143.zip >/dev/null
unzip CommitMono-1.143.zip >/dev/null
mkdir -p "$HOME/.local/share/fonts"
cp CommitMono*/*.otf "$HOME/.local/share/fonts/"
rm -r CommitMono*
curl -sLO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/NerdFontsSymbolsOnly.zip >/dev/null
unzip NerdFontsSymbolsOnly.zip -d NerdFonts/ >/dev/null
cp NerdFonts/SymbolsNerdFont* .local/share/fonts/
rm -r NerdFonts*
fc-cache -f -v >/dev/null

echo "Cloning dotfiles."
git clone --bare https://github.com/kkhaniffff/dotfiles.git "$HOME/.dotfiles" >/dev/null
git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" checkout -f >/dev/null
git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" config --local status.showUntrackedFiles no >/dev/null
chmod +x $HOME/.local/bin/*
cp $HOME/pictures/wallpapers/a_black_sky_with_white_dots.jpg $HOME/.wallpaper

echo "Setup complete."
echo "Reboot to make changes take place."
