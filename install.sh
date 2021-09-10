#!/usr/bin/env bash

declare -r dotfile_dir="${PWD}"

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


# install some more recent versions of software I need via nix
nix-channel --update && nix upgrade-nix
nix-env -iA nixpkgs.neovim
nix-env -iA nixpkgs.fzf

# nvim >= 0.5.0 !!!
# sudo apt-get install -y software-properties-common
# sudo add-apt-repository -y ppa:neovim-ppa/unstable
# sudo apt-get update

sudo apt-get install -y python-dev python3-pip python3-dev python3-pip python3-neovim

cp -r nvim ~/.config/nvim
sh nvim/installer.sh $HOME/.cache/dein
python3 -m pip install neovim
python3 -m pip install msgpack

# install gems for code checks

for d in $HOME/src/github.com/Shopify/*; do
  sudo gem install neovim
  cd $d && gem install solargraph sorbet
done

# rg
cp $dotfile_dir/rg/rgignore $HOME/.rgignore
