{ config, pkgs, ... }:

{
  home.username = "wesley";
  home.homeDirectory = "/home/wesley";

  home.stateVersion = "23.11";

  home.packages = [
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    pkgs.fzf
    pkgs.fd
    pkgs.ripgrep
    pkgs.lazygit
    pkgs.bat
    pkgs.atuin
    pkgs.eza
    pkgs.fastfetch
  ];

  fonts.fontconfig.enable = true;

  programs.zsh = {
    enable = true;
    autocd = true;

    antidote.enable = true;
    antidote.plugins = [
      "mattmc3/zephyr path:plugins/completion"
      "romkatv/powerlevel10k"
      "zsh-users/zsh-autosuggestions"
      "atuinsh/atuin"
      "zdharma-continuum/fast-syntax-highlighting kind:defer"
    ];

    shellAliases = {
      e = "nvim";

      ls = "eza --color=always --group-directories-first --icons=auto";
      la = "eza -la --color=always --group-directories-first --icons=auto";
      ll = "eza -l --color=always --group-directories-first --icons=auto";
      lt = "eza -aT --color=always --group-directories-first --icons=auto";

      grep = "rg";
      find = "fd";
      lg = "lazygit";

      yay = "paru";
    };

    initExtra = ''
      source $HOME/.nix-profile/etc/profile.d/nix.sh
      source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh

      export LESS_TERMCAP_mb=$'\E[01;31m'
      export LESS_TERMCAP_md=$'\E[01;31m'
      export LESS_TERMCAP_me=$'\E[0m'
      export LESS_TERMCAP_se=$'\E[0m'
      export LESS_TERMCAP_so=$'\E[01;47;34m'
      export LESS_TERMCAP_ue=$'\E[0m'
      export LESS_TERMCAP_us=$'\E[01;32m'
      export LESS=-r
      export GROFF_NO_SGR=1


      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.neovim = {
    enable = true;
  };

  home.file = {
    ".p10k.zsh".source = "${config.home.homeDirectory}/.config/home-manager/sources/.p10k.zsh";

    ".config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/home-manager/sources/nvim";
      recursive = true;
    };

    ".config/fastfetch" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/home-manager/sources/fastfetch";
      recursive = true;
    };

    ".config/kitty" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/home-manager/sources/kitty";
      recursive = true;
    };
  };


  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
