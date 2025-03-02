{ config, pkgs, ... }:
{
  home = {
    username = "egor";
    homeDirectory = "/home/egor";
    stateVersion = "24.11";
  };

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./settings.nix
    ./gui
    ./programs
  ];

  home.packages = with pkgs; [
    hyprshot
    brightnessctl
    bluetuith
    pavucontrol
    #-------------------------
    telegram-desktop
    spotify
    nekoray
    htop
    unzip
    wev
    #-------------------------
    git-credential-manager
    scala
    jdk
    python313
  ];
}
