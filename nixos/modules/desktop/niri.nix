{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.niri.enable = true;
  environment.systemPackages = lib.mkAfter (
    with pkgs;
    [
      waybar
      fuzzel
      kitty
    ]
  );
}
