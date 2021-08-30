#!/usr/bin/env bash

# tmux
cp tmux.conf $HOME/.tmux.conf
mkdir -p $HOME/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

# bash
cp bash/bashrc $HOME/.bashrc
cp bash/bash_profile $HOME/.bash_profile
cp -r bash/oh-my-bash $HOME/.oh-my-bash


# dependencies
if ! command -v rg &> /dev/null; then
  sudo apt-get install -y ripgrep
fi

if ! command -v fzf &> /dev/null; then
  sudo apt-get install -y fzf
fi


# nvim >= 0.5.0 !!!
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install -y neovim \
  python-dev \
  python-pip \
  python3-dev \ 
  python3-pip \
  python3-neovim

cp -r nvim ~/.config/nvim
sh nvim/installer.sh $HOME/.cache/dein
sudo gem install neovim
python3 -m pip install neovim

# linters
sudo gem install solargraph
sudo gem install sorbet

# rg
cp rg/rgignore $HOME/.rgignore
