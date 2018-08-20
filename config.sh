#!/bin/bash

# update sources
apt-get update

# install git
apt-get install -y git

# Home directory
cd ~

# install zsh
apt-get install -y zsh zsh-syntax-highlighting
$ sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
# ZSH as default shell
chsh -s $(which zsh)


# install powerlevel9k
$ git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


# install Docker
if [ ! -f /usr/bin/docker]
then
    apt-get install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    apt-key fingerprint 0EBFCD88
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    apt-get update
    apt-get install -y docker-ce
fi

if [ ! -f /usr/bin/docker-compose ]
then
    curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
fi

# install Vim
if [ ! -f /usr/bin/vim ]
then
    apt-get install -y vim
fi

# install Node 8 & npm
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
apt-get install -y nodejs npm

# Copy files config
cp files/zshrc ~/.zshrc
cp files/vimrc ~/.vimrc






