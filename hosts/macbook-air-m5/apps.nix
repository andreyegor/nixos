{ pkgs, pkgsUnstable, ... }:
{
  environment.systemPackages = with pkgs; [
    pkgsUnstable.vscode
    signal-desktop
    telegram-desktop
    insomnia
    hoppscotch
    prismlauncher
    pkgsUnstable.spotify
    appflowy
  ];
}
