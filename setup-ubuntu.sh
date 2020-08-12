clear
timedatectl set-local-rtc 1
echo Updating ubuntu
sudo apt-get update -y
sudo apt-get upgrade -y
echo Installing gnome tweaks
sudo apt-get install gnome-tweaks -y
echo Disabling mouse accelaration
sudo apt install dconf-editor -y
gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'flat'
xinput --set-prop 10 "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1
gsettings set org.gnome.desktop.peripherals.mouse speed -0.55
echo Setting monitor settings
sudo apt install monit -y
sudo mv monitors.xml ~/.config/
sudo monit reload
sudo mv update-monitor-position /usr/bin/
sudo chmod +x /usr/bin/update-monitor-position
sudo mv update-monitor-position.desktop /usr/share/applications/
echo installing wifi adapter driver
sudo apt-get install dkms git -y
git config --global credential.helper store
git clone -b v5.6.4.2 https://github.com/aircrack-ng/rtl8812au.git
cd rtl8812au
sudo ./dkms-install.sh
cd ..
sudo apt-get install net-tools -y
echo connect to the desired wi-fi network
read -p "Press enter to continue"
echo setting wallpaper background
wget "https://linustechtips.com/main/uploads/monthly_2019_10/205370641_LTT_RGB_4K(2).jpg.9c843315246c953cb86f97595478d54f.jpg" -O bg.jpg
gsettings set org.gnome.desktop.background picture-uri file:///home/aadit/bg.jpg
echo installing chrome
wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" -O chrome.deb
sudo apt install ./chrome.deb
rm chrome.deb
echo removing firefox
sudo apt remove firefox -y
sudo apt-get purge thunderbird* -y
echo installing lightworks
wget "https://cdn.lwks.com/releases/lightworks-2020.1-r122068-amd64.deb" -O lightworks.deb
sudo apt install ./lightworks.deb -y
rm lightworks.deb
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
echo installing Zoom
wget "https://zoom.us/client/latest/zoom_amd64.deb" -O zoom.deb
sudo apt install ./zoom.deb -y
echo installing folding@home
sudo apt install python-gobject-2
wget http://archive.ubuntu.com/ubuntu/pool/universe/p/pygtk/python-gtk2_2.24.0-6_amd64.deb
sudo dpkg -i python-gtk2_2.24.0-6_amd64.deb
wget "https://download.foldingathome.org/releases/public/release/fahcontrol/debian-stable-64bit/v7.6/fahcontrol_7.6.13-1_all.deb" -O fahcontrol.deb
sudo dpkg -i ./fahcontrol.deb
wget "https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/v7.6/fahclient_7.6.13_amd64.deb" -O fahclient.deb
sudo apt --fix-broken install
sudo dpkg -i ./fahclient.deb
echo installing GreenWithEnvy
sudo apt install git meson python3-pip libcairo2-dev libgirepository1.0-dev libglib2.0-dev libdazzle-1.0-dev gir1.2-gtksource-3.0 gir1.2-appindicator3-0.1 python3-gi-cairo appstream-util -y
git clone --recurse-submodules -j4 https://gitlab.com/leinardi/gwe.git
cd gwe
git checkout release
pip3 install -r requirements.txt
meson . build --prefix /usr
ninja -v -C build
sudo ninja -v -C build install
cd ..
sudo mv run-gwe.sh ~/
chmod +x ~/run-gwe.sh
sudo nano /usr/share/applications/com.leinardi.gwe.desktop
echo installing VirtualBox
sudo apt install virtualbox -y
sudo rm *.deb* bg.jpg
sudo rm -rf rtl8812au gwe
cd ..
rm -rf ubuntusetup
git clone https://github.com/supercoder186/ubuntusetup.git
