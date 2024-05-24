#!/bin/sh

sudo pacman -S kitty

sh <(curl -L https://nixos.org/nix/install) --no-daemon

. ~/.nix-profile/etc/profile.d/nix.sh

[ -d ~/.config/nix ] || mkdir ~/.config/nix

if ! [ -e ~/.config/nix/nix.conf ]
then
    cp ./sources/nix.conf ~/.config/nix/nix.conf
fi

nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update

nix-shell '<home-manager>' -A install
