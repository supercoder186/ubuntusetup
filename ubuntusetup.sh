clear
timedatectl set-local-rtc 1
echo fixing screen tearing
sudo mkdir ~/.config/autostart
sudo mv ./fix_screen_tearing.desktop ~/.config/autostart/fix_screen_tearing.desktop
echo Updating ubuntu
sudo apt-get update -y
sudo apt-get upgrade -y
echo Installing laptop performance enhancers
sudo apt install preload tlp tlp-rdw -y
sudo systemctl enable tlp.service
echo Installing gnome tweaks
sudo apt-get install gnome-tweaks git dkms build-essential -y
echo Disabling mouse accelaration
sudo apt install dconf-editor -y
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
