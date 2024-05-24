#!/bin/sh

git add .

if [ $# -lt 1 ]; then
    echo "Usage: $0 <config name>"
    exit 1
fi

home-manager switch --flake ".#$1"
