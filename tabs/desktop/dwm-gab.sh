#!/bin/sh -e

. ../common-script.sh

makeDependencies() {
    sudo pacman -S --noconfirm --needed git base-devel libx11 libxinerama libxft
}

makeDWM() {
    mkdir -p $HOME/.local/share
    cd $HOME/.local/share

    if [ ! -d "$HOME/.local/share/dwm-gab" ]; then
        git clone https://github.com/dallagnoli/dwm-gab.git
        cd dwm-gab
    else
        cd dwm-gab
        git pull
    fi

    sudo make clean install
}

extraDependencies() {
    sudo pacman -S --noconfirm --needed thunar gvfs flameshot feh dunst picom mate-polkit ttf-meslo-nerd noto-fonts noto-fonts-emoji 
}

cloneBackgrounds() {
    mkdir -p $HOME/Pictures/screenshots
    cd $HOME/Pictures

    if [ ! -d "$HOME/Pictures/backgrounds" ]; then
        git clone https://github.com/dallagnoli/backgrounds.git
    else
        cd backgrounds
        git pull
    fi
}

setupDisplayManager() {
    sudo pacman -S --noconfirm --needed xorg-server xorg-xinit
    echo "exec dwm" > $HOME/.xinitrc
}

makeDependencies
makeDWM
extraDependencies
cloneBackgrounds
setupDisplayManager