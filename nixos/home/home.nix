{ config, pkgs, hostName, ... }:

{
  imports = [
    ./modules/appearance/niri.nix
    ./modules/appearance/noctalia.nix
    ./modules/appearance/catppucin.nix
    ./hosts/${hostName}/default.nix
  ];
  home.username = "egor";
  home.homeDirectory = "/home/egor";

  home.stateVersion = "25.11";
}