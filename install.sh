#!/usr/bin/env bash

declare -r dotfile_dir="${PWD}"

export PATH=$PATH:$HOME/.nix-profile/bin
# Source /etc/profile, it will set up nix, shadowenv and other goodies
. /etc/profile


# tmux
cp tmux.conf $HOME/.tmux.conf
mkdir -p $HOME/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

# bash
cp bash/bashrc $HOME/.bashrc
cp bash/bash_profile $HOME/.bash_profile
cp -r bash/oh-my-bash $HOME/.oh-my-bash




if [[ `systemctl` =~ -\.mount ]]; then
  # Some setup specifc to ISOSPIN
  nix-channel --update && nix upgrade-nix
  # nix-env -iA nixpkgs.gcc-unwrapped.lib
  # nix-env -iA nixpkgs.tree-sitter
  # nix-env -iA nixpkgs.neovim
  nix-env -iA nixpkgs.fzf
  nix-env -iA nixpkgs.ripgrep
fi

sudo apt-get install -y python-dev python3-pip python3-dev python3-pip python3-neovim

python3 -m pip install neovim
python3 -m pip install msgpack

# nvim 

sudo apt-get -y install ninja-build gettext cmake unzip curl

git clone https://github.com/neovim/neovim.git
cd neovim
git checkout release-0.9
make CMAKE_BUILD_TYPE=Release
sudo make install

git clone https://github.com/pebra/neovim-files-v2.git $HOME/.config/nvim

# rg
cp $dotfile_dir/rg/rgignore $HOME/.rgignore

# neovim
git clone https://github.com/pebra/kickstart.nvim ~/.config/nvim
