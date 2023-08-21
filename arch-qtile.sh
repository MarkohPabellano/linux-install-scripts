#!/bin/bash

# Setup Clock Synchronization
sudo timedatectl set-ntp true
sudo hwclock --systohc

# Getting Fast Mirrors
sudo reflector -c Taiwan -a 6 --sort rate --save /etc/pacman.d/mirrorlist

# Firewall Ports
#sudo firewall-cmd --add-port=1025-65535/tcp --permanent
#sudo firewall-cmd --add-port=1025-65535/udp --permanent
#sudo firewall-cmd --reload

# Setting up Paru
git clone https://aur.archlinux.org/paru-bin
cd paru-bin
makepkg -si

# Installing some Aur Applications
paru -S timeshift-bin timeshift-autosnap zramd visual-studio-code-bin appimagelauncher brave-bin 
picom-git ttf-ms-win11-auto

# Enabling Zram
sudo systemctl enable --now zramd.service

# Installing Xorg
# Qtile Setup
sudo pacman -S xorg qtile thunar lxappearance arandr vlc slock starship bash-completion

# Installing Core Fonts
sudo pacman -S dina-font tamsyn-font bdf-unifont ttf-bitstream-vera ttf-croscore ttf-dejavu ttf-droid gnu-free-fonts ttf-ibm-plex 
ttf-liberation ttf-linux-libertine noto-fonts ttf-roboto tex-gyre-fonts ttf-ubuntu-font-family ttf-anonymous-pro 
ttf-cascadia-code ttf-fantasque-sans-mono ttf-fira-mono ttf-hack ttf-fira-code ttf-inconsolata 
ttf-jetbrains-mono ttf-monofur adobe-source-code-pro-fonts cantarell-fonts inter-font ttf-opensans gentium-plus-font 
ttf-junicode adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts 
noto-fonts-cjk noto-fonts-emoji 

# Install Graphical Drivers
# Intel
sudo pacman -S --needed lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader

# Cloning Dotfiles Repo
git clone https://github.com/MarkohPabellano/PabkoDots.git

