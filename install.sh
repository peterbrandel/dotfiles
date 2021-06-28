#!/usr/bin/env bash

# setup tmux
cp tmux.conf $HOME/.tmux.conf
mkdir -p $HOME/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# setup bash
cp bash/bashrc $HOME/.bashrc
cp bash/bash_profile $HOME/.bash_profile
cp bash/oh-my-bash $HOME/.oh-my-bash


# dependencies
if ! command -v rg &> /dev/null; then
  sudo apt-get install -y ripgrep
fi

if ! command -v fzf &> /dev/null; then
  sudo apt-get install -y fzf
fi

sudo apt-get install -y python3-pip 


# nvim

cp -r nvim ~/.config/nvim
sh nvim/installer.sh
