#!/bin/bash

apk add sudo shadow
echo 'angel ALL=(ALL) ALL' | sudo tee -a /etc/sudoers


####### PRIMERA CONFIGURACION #######
echo "" > ~/repositories
echo "http://dl-cdn.alpinelinux.org/alpine/v3.18/main" >> ~/repositories
echo "http://dl-cdn.alpinelinux.org/alpine/v3.18/community" >> ~/repositories
echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> ~/repositories
echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> ~/repositories
sudo mv ~/repositories /etc/apk/repositories
sudo apk update
sudo apk upgrade

apk add htop sudo git curl zsh wget openssh-sftp-server sshpass python3 samba py3-pip chromium chromium-chromedriver
pip3 install -U selenium
sudo touch $HOME/.hushlogin


####### ZSH #######
sh -c "$(curl -fsSL [https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh](https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh))"
sudo git clone [https://github.com/zsh-users/zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
sudo git clone [https://github.com/zsh-users/zsh-syntax-highlighting.git](https://github.com/zsh-users/zsh-syntax-highlighting.git) ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
echo "" > ~/.zshrc
        
echo '
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="bira"
plugins=(git
zsh-autosuggestions
zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh' > .zshrc

zsh -l
chsh -s $(which zsh)


####### ZSH #######
mkdir ~/Compartida
chmod 0777 ~/Compartida
echo '[Compartida]
browseable = yes
writeable = yes
path = /home/angel/Compartida' | sudo tee -a /etc/samba/smb.conf

chsh angel
