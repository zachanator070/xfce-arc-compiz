#!/bin/bash

# revert xfce startup session
sed -i '12s/.*/        <value type="string" value="xfwm4"\/>/' ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-session.xml
dconf write /org/gnome/metacity/theme "'Ambiance'"

# remove compiz and settings manager
sudo apt remove compiz compizconfig-settings-manager

# revert theme and icons
sed -i '6s/.*/    <property name="IconThemeName" type="string" value="elementary-xfce"\/>' ~/.config/xfce4/xconf/xfce-perchannel-xml/xsettings.xml
sed -i '5s/.*/    <property name="ThemeName" type="string" value="Ambiance"\/>' ~/.config/xfce4/xconf/xfce-perchannel-xml/xsettings.xml
sed -i '40s/.*/    <property name="theme" type="string" value="Ambiance"\/>/' ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml

# remove icons
cd arc-icon-theme
sudo make uninstall
sudo rm -rf /usr/share/icons/Arc

# revert greeter theme and icons
> /ect/lightdm/lightdm-gtk-greeter.conf
sudo echo "[greeter]\ntheme-name = Ambiance\nicon-theme-name = elementary-xfce" > /ect/lightdm/lightdm-gtk-greeter.conf

# remove arc theme and moka icons
sudo apt-get remove arc-theme
sudo apt-get remove moka-icon-theme

sudo apt-get remove dh-autoreconf
sudo apt-get remove dconf-cli

# remove other unused dependancies
sudo apt-get autoremove

# remove repositories
sudo add-apt-repository --remove ppa:moka/daily
sudo rm /etc/apt/sources.list.d/arc-theme.list
