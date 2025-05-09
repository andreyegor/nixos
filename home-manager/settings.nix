{ pkgs, ... }:
{
  programs.fish.shellAliases = {
    nixos-switch = "sudo nixos-rebuild switch --flake ~/.config/nixos/";
    nixos-boot = "sudo nixos-rebuild switch --flake ~/.config/nixos/";
    nixos-test = "sudo nixos-rebuild switch --flake ~/.config/nixos/";
    nixos-clear = "sudo nix-collect-garbage -d";
    nixos-optimise = "nix-store --optimise";
    home-switch = "home-manager switch --flake ~/.config/nixos/";
    home-clear = "home-manager expire-generations \"-1 days\"";
    flake-update = "nix flake update --flake ~/.config/nixos/";
  };

  xdg.desktopEntries = {
    google-chrome-proxy = {
      name = "Proxy Google Chrome";
      genericName = "Web Browser";
      exec = ''google-chrome-stable --proxy-server="socks://127.0.0.1:2080"'';
      terminal = false;
    };
  };
  xdg.desktopEntries = {
    vscode-proxy = {
      name = "Proxy Visual Studio Code";
      genericName = "Text Editor";
      exec = ''code --proxy-server="socks://127.0.0.1:2080"'';
      terminal = false;
    };
  };
}
