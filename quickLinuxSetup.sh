#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

echo -e "\e[1;31m Installing basic stuff \e[0m"
sudo apt -y install apt-transport-https curl git vim htop\
	okular snapd wget gpg telegram-desktop shotwell\
	virtualbox virtualbox-ext-pack gnome-shell-pomodoro\
	fonts-powerline

echo -e "\e[1;31m Configure git \e[0m"
git config --global user.email "andreaviale.92@gmail.com"
git config --global user.name "andreaviale"


echo -e "\e[1;31m Swap Esc and CapsLock \e[0m"
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']"

echo -e "\e[1;31m Remove home folder from desktop \e[0m"
gsettings set org.gnome.shell.extensions.ding show-home false

echo -e "\e[1;31m Setup Vundle and vimrc \e[0m"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s .vimrc ~/


echo -e "\e[1;31m Copy zshrc \e[0m"
ln -s .zshrc ~/
ln -s .zshrc_alias ~/
ln -s .zsh_history ~/
ln -s pdf2eps /usr/local/bin/

echo -e "\e[1;31m Installing Brave Browser \e[0m"
sudo apt remove -y firefox
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt -y install brave-browser

echo -e "\e[1;31m Installing Ubuntu Tweaks \e[0m"
sudo add-apt-repository -y universe
sudo apt install gnome-tweaks
sudo apt-get install chrome-gnome-shell

echo -e "\e[1;31m Disable Side bar \e[0m"
gnome-extensions disable ubuntu-dock@ubuntu.com

echo -e "\e[1;31m Installing Evolution \e[0m"
sudo apt install -y evolution evolution-ews

echo -e "\e[1;31m Installing latex \e[0m"
sudo apt install -y texlive-full

echo -e "\e[1;31m Installing kdenlive \e[0m"
sudo add-apt-repository -y ppa:kdenlive/kdenlive-stable
sudo apt update
sudo apt install -y kdenlive

echo -e "\e[1;31m Installing libreoffice \e[0m"
sudo add-apt-repository -y ppa:libreoffice
sudo apt update
sudo apt install -y libreoffice

echo -e "\e[1;31m Installing obs-studio \e[0m"
sudo apt install obs-studio

echo -e "\e[1;31m Installing vlc \e[0m"
sudo add-apt-repository -y ppa:savoury1/vlc3
sudo add-apt-repository -y ppa:savoury1/ffmpeg4
sudo apt install -y vlc

echo -e "\e[1;31m Installing vscode \e[0m"
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https
sudo apt update
sudo apt install -y code

echo -e "\e[1;31m Installing redshift \e[0m"
sudo apt install -y redshift redshift-gtk
cp redshift.conf ~/.config/

echo -e "\e[1;31m Installing gnome extensions \e[0m"
wget -O gnome-shell-extension-installer "https://github.com/brunelli/gnome-shell-extension-installer/raw/master/gnome-shell-extension-installer"
chmod +x gnome-shell-extension-installer
mv gnome-shell-extension-installer /usr/bin/

gnome-shell-extension-installer 21
gnome-shell-extension-installer 1401
gnome-shell-extension-installer 1634
gnome-shell-extension-installer 750
gnome-extensions enable workspace-indicator@gnome-shell-extensions.gcampax.github.com
gnome-extensions enable bluetooth-quick-connect@bjarosze.gmail.com
gnome-extensions enable Resource_Monitor@Ory0n
gnome-extensions enable openweather-extension@jenslody.de

echo -e "\e[1;31m Installing rclone \e[0m"
curl https://rclone.org/install.sh | sudo bash

echo -e "\e[1;31m Installing snaps \e[0m"
snap install skype
snap install joplin-desktop


sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
