#!/bin/bash
ISYAY=/sbin/yay
if [ -f "$ISYAY" ]; then 
    echo -e "yay was located, moving on.\n"
 #   yay -Suy
else 
    echo -e "yay was not located, please install yay. Exiting script.\n"
    exit 
fi

#ISPARU=/sbin/paru
#if [ -f "$ISPARU"]; then
 #   echo -e "paru was located, movin on.\n"
#else    
 #   echo -e "paru was not located, please install paru or yay then retry the script.\n"
  #  exit
#fi

read -p "Would you like to install required dependencies for hyprland as well as optional ones to improve hyprland's look and feel? (yes,no)" INST
if [[ $INST == "Yes" || $INST == "yes" ]]; then
yay -S --noconfirm hyprland kitty swaylock starship waybar wofi ttf-jetbrains-mono-nerd swaylock-effects noto-fonts-emoji alacritty thunar ranger grim slurp xfce4-settings \
brightnessctl bluez bluez-utils blueman librewolf-bin python-requests xdg-desktop-portal-hyprland polkit-gnome lxappearance nwg-look pulseaudio pipewire pamixer wlogout wlroots \
dracula-gtk-theme dracula-icons-git pywal \

systemctl enable --now bluetooth.service
pacman -S xdg-user-dirs
xdg-user-dirs-update
yay -R --noconfirm xdg-desktop-portal-gnome xdg-desktop-portal-gtk
fi

read -p "Would you also like to try rofi along with wofi? If unsure type in no. (yes,no)" ROFICHOICE 
if [[ $ROFICHOICE == "Yes" || $ROFICHOICE == "yes" ]]; then
yay -S --noconfirm rofi 
fi

read -p "Would you like to copy config files which are neccessary for making your hyprland look good? (yes,no)" CFG
if [[ $CFG == "yes" || $CFG == "Yes" ]]; then
rm -r ~/.config/
mkdir -p ~/.config/hypr
cp -r .config/hypr/* ~/.config/hypr/
mkdir -p ~/.config/wofi 
cp -r .config/wofi/* ~/.config/wofi/
mkdir -p ~/.config/swaylock/
cp -r .config/swaylock/* ~/.config/swaylock
mkdir -p  ~/.config/waybar/
cp -r .config/waybar/* ~/.config/waybar
mkdir -p ~/.config/dunst
cp -r .config/dunst/* ~/.config/dunst/
mkdir -p ~/.config/kitty
cp -r .config/kitty/* ~/.config/kitty/
mv ~/.bashrc ~/.bashrc.bak
cp .bashrc ~/
mkdir -p ~/Pictures/wallpapers
cp -r hyprland5.png ~/Pictures/wallpapers/
mkdir -p ~/.config/alacritty
cp -r .config/alacritty/* ~/.config/alacritty/

read -p "The script is done would you like to start Hyprland now (yes,no)" STARTCHOICE
if [[ $STARTCHOICE == "yes" ||$STARTCHOICE == "Yes" ]]; then
exec Hyprland
else
exit
fi
