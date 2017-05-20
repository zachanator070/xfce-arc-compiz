
# add the arc repository
wget -nv http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_16.04/Release.key -O Release.key
sudo apt-key add - < Release.key
sudo apt-get update
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' > /etc/apt/sources.list.d/arc-theme.list"

# add the moka repository  (arc depends on these)
sudo add-apt-repository ppa:moka/daily
sudo apt-get update

# install moka and arc
sudo apt-get install moka-icon-theme
sudo apt-get install arc-theme

# set greeter to new theme and icons
sudo echo "[greeter]\ntheme-name = Arc-Dark\nicon-theme-name = Moka" > /ect/lightdm/lightdm-gtk-greeter.conf

# get the arc icons
git clone https://github.com/horst3180/arc-icon-theme --depth 1 && cd arc-icon-theme
# install arc icons dependancy
sudo apt install dh-autoreconf
# install arc icons
sudo make install
sudo gtk-update-icon-cache /usr/local/share/icons/Arc/

# set current theme to Arc
sed -i '40s/.*/    <property name="theme" type="string" value="Arc-Dark"\/>/' ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml
sed -i '5s/.*/    <property name="ThemeName" type="string" value="Arc-Dark"\/>' ~/.config/xfce4/xconf/xfce-perchannel-xml/xsettings.xml
sed -i '6s/.*/    <property name="IconThemeName" type="string" value="Arc"\/>' ~/.config/xfce4/xconf/xfce-perchannel-xml/xsettings.xml

# install compiz dependancies
sudo apt-get install metacity
sudo apt install light-themes

# install compiz
sudo apt install compiz compizconfig-settings-manager

# change default metacity theme
sudo apt install dconf-editor
sudo apt install dconf-cli
dconf write /org/gnome/metacity/theme "'Arc-Dark'"
cp /etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-session.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-session.xml
# update xfce session to run compiz on start up
sed -i '12s/.*/        <value type="string" value="compiz"\/>/' ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-session.xml

