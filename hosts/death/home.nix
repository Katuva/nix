{ config, pkgs, username, ... }:

{
  home.username = username;
  home.homeDirectory = "/home/${username}";

  home.stateVersion = "23.11";

  imports = [
    ../common.nix
  ];

  home.packages = [
    pkgs.xclip
  ];

  home.file = {
    ".config/i3" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/sources/i3";
      recursive = true;
    };

    ".config/polybar" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/sources/polybar";
      recursive = true;
    };

    ".config/rofi" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/sources/rofi";
      recursive = true;
    };

    ".config/ncspot" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/sources/ncspot";
      recursive = true;
    };
  };


  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
