#!/bin/sh

zsh_path=$(which zsh)

"$zsh_path" | sudo tee -a /etc/shells
chsh -s "$zsh_path"
