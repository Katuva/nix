{ config, pkgs, username, ... }:

{
  home.username = username;
  home.homeDirectory = "/home/${username}";

  home.stateVersion = "23.11";

  imports = [
    ../common.nix
  ];

  home.packages = [
    pkgs.wl-clipboard
    pkgs.waybar
    pkgs.wofi
    pkgs.ncspot
  ];

  home.file = {
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
