#!/usr/bin/env bash

declare -r dotfile_dir="${PWD}"

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
  xix-env -iA nixpkgs.gcc-unwrapped.lib
  xix-env -iA nixpkgs.tree-sitter
  nix-env -iA nixpkgs.neovim
  nix-env -iA nixpkgs.fzf
  nix-env -iA nixpkgs.ripgrep
fi

sudo apt-get install -y python-dev python3-pip python3-dev python3-pip python3-neovim

python3 -m pip install neovim
python3 -m pip install msgpack

nvim --headless -c "call dein#install()" -c "qa"

# install gems for code checks
for d in $HOME/src/github.com/Shopify/*; do
  sudo gem install neovim
  cd $d && gem install solargraph sorbet
done


git clone https://github.com/pebra/neovim-files-v2.git $HOME/.config/nvim

# rg
cp $dotfile_dir/rg/rgignore $HOME/.rgignore

# neovim
git clone https://github.com/pebra/kickstart.nvim ~/.config/nvim
