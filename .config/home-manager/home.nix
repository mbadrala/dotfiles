{ config, pkgs, ... }:

{
  home.username = "mbadrala";
  home.homeDirectory = "/home/mbadrala";
  home.stateVersion = "25.05";

  home.packages = [
    pkgs.neovim
    pkgs.tmux
    pkgs.htop
    pkgs.lazygit
    pkgs.fzf
    pkgs.ripgrep
    pkgs.rustup
    pkgs.python314
    pkgs.uv
    pkgs.go
    pkgs.nodejs_22
    pkgs.pnpm
    pkgs.fd
    pkgs.jdk21
    pkgs.maven
    pkgs.lombok
    pkgs.geoserver
    pkgs.wl-clipboard
    pkgs.php
    pkgs.php84Packages.composer
  ];

  home.file = {
  };

  services.ssh-agent.enable = true;
  programs.bash = {
    enable = true;
    shellAliases = {
      vi = "nvim";
      vim = "nvim";
      grep = "grep --color=auto";
    };
    bashrcExtra = ''
    '';
  };
  programs.fd = {
    enable = true;
  };
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
  home.sessionVariables = {
    EDITOR = "nvim";
    OPENAI_KEY = "";
    PATH = "$HOME/.config/composer/vendor/bin:$PATH";
  };

  programs.home-manager.enable = true;
}
