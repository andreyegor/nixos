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
      quickshell
      fuzzel
      kitty
    ]
  );
}
