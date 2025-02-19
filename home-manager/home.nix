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
    brightnessctl
    #-------------------------
    # (discord.override {
    #   withVencord = true;
    # })
    git-credential-manager
    telegram-desktop
    spotify
    nekoray
    htop
    unzip
  ];
}
