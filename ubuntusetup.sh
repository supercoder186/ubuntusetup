clear
timedatectl set-local-rtc 1
echo Updating ubuntu
sudo apt-get update -y
sudo apt-get upgrade -y
echo fixing screen tearing
mkdir ~/bin
sudo mv force-composition-pipeline.sh ~/bin/force-composition-pipeline.sh
sudo chmod +x ~/bin/force-composition-pipeline.sh
mkdir ~/.config/autostart
sudo mv force-composition-pipeline.desktop ~/.config/autostart/force-composition-pipeline.desktop
echo Installing laptop performance enhancers
sudo apt install preload tlp tlp-rdw -y
sudo systemctl enable tlp.service
echo Installing gnome tweaks
sudo apt-get install gnome-tweaks git dkms build-essential -y
echo Disabling mouse accelaration
sudo apt install dconf-editor -y
echo customizing dock
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 40
gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'flat'
xinput --set-prop 10 "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1
gsettings set org.gnome.desktop.peripherals.mouse speed 0
git config --global user.email "aadit.kolar@gmail.com"
git config --global user.name "Aadit Kolar"
git config --global credential.helper store
sudo apt-get install net-tools -y
echo installing opera
sudo apt-get install snapd -y
wget "https://download.opera.com/download/get/?id=55747&location=415&nothanks=yes&sub=marine&utm_tryagain=yes" -O opera.deb
sudo apt install ./opera.deb -y
rm opera.deb
echo fixing opera media codecs
git clone https://github.com/xZero707/opera-fix-ffmpeg
cd opera-fix-ffmpeg
./opera-fix-ffmpeg.sh /usr/lib/x86_64-linux-gnu/opera/
cd ..
echo removing firefox
sudo apt remove firefox -y
sudo snap remove firefox
sudo apt-get purge thunderbird* -y
echo installing Steam
sudo apt install steam -y
echo install VS Code
sudo snap install code --classic
echo installing Spotify, Discord, Zoom
sudo snap install spotify discord zoom-client
echo Installing restricted media codecs
sudo apt install ubuntu-restricted-extras -y
sudo apt autoremove -y

echo Syncing Bluetooth keys
git clone https://github.com/KeyofBlueS/bt-keys-sync.git
cd bt-keys-sync/
chmod +x bt-keys-sync.sh
sudo ./bt-keys-sync.sh --windows-keys
