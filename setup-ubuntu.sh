clear
timedatectl set-local-rtc 1
echo Updating ubuntu
sudo apt-get update -y
sudo apt-get upgrade -y
echo Installing restricted media codecs
sudo apt install ubuntu-restricted-extras -y
echo Installing laptop performance enhancers
sudo apt install preload tlp tlp-rdw -y
echo installing numix theme
sudo add-apt-repository ppa:numix/ppa
sudo apt-get update
sudo apt-get install numix-gtk-theme numix-icon-theme-circle
echo Installing gnome tweaks
sudo apt-get install gnome-tweaks git dkms build-essential -y
echo Disabling mouse accelaration
sudo apt install dconf-editor -y
gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'flat'
xinput --set-prop 10 "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1
gsettings set org.gnome.desktop.peripherals.mouse speed -0.55
echo Installing Dash to Dock
git clone https://github.com/micheleg/dash-to-dock.git
cd dash-to-dock/
make
make install
cd ..
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
gsettings set org.gnome.shell.extensions.dash-to-dock show-delay 0
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide-mode 'ALL_WINDOWS'
gsettings set org.gnome.shell.extensions.dash-to-dock require-pressure-to-show false
gsettings set org.gnome.shell.extensions.dash-to-dock animation-time 0.25
echo Setting monitor settings
sudo apt install monit -y
sudo mv monitors.xml ~/.config/
sudo monit reload
sudo mv update-monitor-position /usr/bin/
sudo chmod +x /usr/bin/update-monitor-position
sudo mv update-monitor-position.desktop /usr/share/applications/
git config --global user.email "aadit.kolar@gmail.com"
git config --global user.name "Aadit Kolar"
git config --global credential.helper store
sudo apt-get install net-tools -y
echo setting wallpaper background
wget "https://pbs.twimg.com/media/Ec_L8ARU0AApmri?format=png&name=large" -O bg.png
mv ./bg.png ~/bg.png
gsettings set org.gnome.desktop.background picture-uri file:///home/aadit/bg.png
echo installing chrome
wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" -O chrome.deb
sudo apt install ./chrome.deb
rm chrome.deb
echo removing firefox
sudo apt remove firefox -y
sudo apt-get purge thunderbird* -y
echo installing Steam
sudo apt install steam -y
echo installing PyCharm
sudo snap install pycharm-professional --classic
echo installing WebStorm
sudo snap install webstorm --classic
echo install VS Code
sudo snap install code --classic
echo installing Spotify, Discord, Zoom
sudo snap install spotify discord zoom-client
sudo apt autoremove -y
sudo rm *.deb* bg.jpg
cd ..
rm -rf ubuntusetup
git clone https://github.com/supercoder186/ubuntusetup.git
