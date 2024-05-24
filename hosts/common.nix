{ config, pkgs, ... }:

{
  home.packages = [
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    pkgs.fzf
    pkgs.fd
    pkgs.ripgrep
    pkgs.lazygit
    pkgs.bat
    pkgs.eza
    pkgs.fastfetch
    pkgs.tldr
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
    };

    initExtraFirst = ''
      ~/.crunchbang.sh
    '';

    initExtra = ''
      source $HOME/.nix-profile/etc/profile.d/nix.sh

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

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.neovim = {
    enable = true;
  };

  home.file = {
    ".config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/sources/nvim";
      recursive = true;
    };

    ".config/fastfetch" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/sources/fastfetch";
      recursive = true;
    };

    ".config/kitty" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/sources/kitty";
      recursive = true;
    };

    ".crunchbang.sh" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/sources/.crunchbang.sh";
    };

    ".p10k.zsh" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/sources/.p10k.zsh";
    };
  };
}
