#!/usr/bin/env bash

# setup tmux
cp tmux.conf $HOME/.tmux.conf
mkdir -p $HOME/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
