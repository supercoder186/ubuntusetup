clear
echo updating ubuntu
sudo apt-get update -y
sudo apt-get upgrade -y
echo installing gnome tweaks
sudo apt-get install gnome-tweaks -y
echo disabling mouse accelaration
gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'flat'
xinput --set-prop 10 "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1
echo installing wifi adapter driver
sudo apt-get install dkms git -y
git clone -b v5.6.4.2 https://github.com/aircrack-ng/rtl8812au.git
cd rtl*
sudo ./dkms-install.sh
cd ..
sudo apt-get install net-tools -y
echo connect to the desired wi-fi network
read -p "Press enter to continue"
echo installing chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
rm ./google-chrome-stable_current_amd64.deb
echo removing firefox
sudo apt remove firefox -y
sudo apt-get purge thunderbird* -y
echo setting monitor settings
sudo apt install monit -y
sudo mv monitors.xml ~/.config/
monit reload
echo setting wallpaper background
wget "https://linustechtips.com/main/uploads/monthly_2019_10/205370641_LTT_RGB_4K(2).jpg.9c843315246c953cb86f97595478d54f.jpg" -O bg.jpg
gsettings set org.gnome.desktop.background picture-uri file:///home/aadit/bg.jpg
echo installing lightworks
sudo apt-get install lightworks -y
echo installing PyCharm
sudo snap install pycharm-professional --classic
echo installing WebStorm
sudo snap install webstorm --classic
echo install VS Code
sudo snap install code --classic
echo installing Instagram
sudo snap install istekram
echo installing Spotify
sudo snap install spotify
echo installing Discord
sudo snap install discord
sudo apt autoremove -y
