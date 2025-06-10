#!/bin/bash

# Função de progresso
progresso() {
  echo -e "\n[ $1 / 20 ] ➤ $2"
}

echo "🟢 Iniciando o instalador Kodish Pack para Ubuntu..."
read -p "Deseja continuar com a instalação? (s/n): " escolha
if [[ "$escolha" != "s" ]]; then
  echo "Instalação cancelada."
  exit 0
fi

clear
echo "🚀 Preparando sistema para instalação..."

progresso 1 "Atualizando o sistema"
sudo apt-get update -y && sudo apt-get upgrade -y

progresso 2 "Instalando codecs extras"
sudo apt install ubuntu-restricted-extras -y

progresso 3 "Instalando Flatpak e adicionando Flathub"
sudo apt install flatpak -y
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

progresso 4 "Instalando apps Flatpak"
flatpak install flathub com.spotify.Client -y
flatpak install flathub net.lutris.Lutris -y
flatpak install flathub org.phoenicis.playonlinux -y
flatpak install flathub com.stremio.Stremio -y

progresso 5 "Habilitando suporte a apturl"
sudo apt install apturl apturl-common -y

progresso 6 "Instalando suporte ao Flatpak na Gnome Software"
sudo apt install gnome-software-plugin-flatpak -y

progresso 7 "Instalando ajustes do GNOME"
sudo apt install gnome-tweaks -y

progresso 8 "Instalando gerenciador de energia (TLP)"
sudo apt install tlp tlp-rdw -y
sudo systemctl enable tlp.service && sudo tlp start

progresso 9 "Instalando suporte a DVDs"
sudo apt install libdvd-pkg -y
sudo dpkg-reconfigure libdvd-pkg

progresso 10 "Instalando players de mídia"
sudo apt install audacious libqt6svg6 vlc smplayer -y

progresso 11 "Instalando editores e ferramentas multimídia"
sudo apt install gimp handbrake -y

progresso 12 "Instalando o Kodi"
sudo apt install kodi -y

progresso 13 "Instalando o Google Chrome"
cd /tmp && wget -O google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome.deb -y
cd $HOME

progresso 14 "Instalando curl"
sudo apt install curl -y

progresso 15 "Instalando descompactadores"
sudo apt install arc arj cabextract lhasa p7zip p7zip-full p7zip-rar rar unrar unace unzip xz-utils zip -y

progresso 16 "Instalando o GDebi"
sudo apt install gdebi -y

progresso 17 "Instalando cliente de Torrent (qBittorrent)"
sudo apt install qbittorrent -y

progresso 18 "Instalando GParted"
sudo apt install gparted -y

progresso 19 "Removendo Snap e bloqueando reinstalação"
if command -v snap &> /dev/null; then
  sudo snap remove --purge $(snap list | awk 'NR>1 {print $1}')
fi
sudo apt purge snapd -y
rm -rf ~/snap
sudo rm -rf /snap /var/snap /var/lib/snapd
echo -e "Package: snapd\nPin: release a=*\nPin-Priority: -10" | sudo tee /etc/apt/preferences.d/nosnap.pref
sudo apt update

progresso 20 "Instalando Firefox via Flatpak"
flatpak install flathub org.mozilla.firefox -y

echo -e "\n✅ Instalação finalizada com sucesso!"
