{ pkgs, ... }:
{
  programs.fish.shellAliases = {
    nixos-switch = "sudo nixos-rebuild switch --flake ~/.config/nixos/";
    nixos-test = "sudo nixos-rebuild switch --flake ~/.config/nixos/";
    home-switch = "home-manager switch --flake ~/.config/nixos/";
  };
}
