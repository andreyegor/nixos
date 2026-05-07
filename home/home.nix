{ config, pkgs, hostName, ... }:

{
  imports = [
    ./modules/appearance/default.nix
    ./hosts/${hostName}/default.nix
  ];
  home.username = "egor";
  home.homeDirectory = "/home/egor";

  home.stateVersion = "25.11";
}