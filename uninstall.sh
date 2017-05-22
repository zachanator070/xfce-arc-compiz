#!/bin/bash

# revert xfce startup session
cp /etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-session.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-session.xml
dconf write /org/gnome/metacity/theme "'Ambiance'"

# remove compiz and settings manager
sudo apt remove -y compiz compizconfig-settings-manager

# revert theme and icons
xfconf-query -c xsettings -p /Net/ThemeName -s "Greybird"
xfconf-query -c xsettings -p /Net/IconThemeName -s "elementary-xfce-darker"

# remove icons
cd arc-icon-theme
sudo make uninstall
sudo rm -rf /usr/share/icons/Arc
rm -rf ./arc-icon-theme

# revert greeter theme and icons
> /ect/lightdm/lightdm-gtk-greeter.conf
sudo sh -c 'echo "[greeter]\ntheme-name = Greybird\nicon-theme-name = elementary-xfce-darkest" > /etc/lightdm/lightdm-gtk-greeter.conf'

# remove arc theme and moka icons
sudo apt-get -y remove arc-theme
sudo apt-get -y remove moka-icon-theme

sudo apt-get -y remove dh-autoreconf
sudo apt-get -y remove dconf-cli

# remove other unused dependancies
sudo apt-get -y autoremove

# remove repositories
sudo add-apt-repository --remove ppa:moka/daily
sudo rm /etc/apt/sources.list.d/arc-theme.list
