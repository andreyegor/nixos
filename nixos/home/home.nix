{ config, pkgs, ... }:

{
  imports = [
    ./modules/appearance/cursor.nix
  ];
  home.username = "egor";
  home.homeDirectory = "/home/egor";

  home.stateVersion = "25.11";
}