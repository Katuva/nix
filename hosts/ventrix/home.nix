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
  ];

  home.file = {

  };


  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
