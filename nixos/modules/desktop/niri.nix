{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.niri.enable = true;
  programs.xwayland.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
  services.dbus.enable = true;
  services.xserver.enable = true;
  environment.systemPackages = lib.mkAfter (
    with pkgs;
    [
      quickshell
      fuzzel
      kitty

      xwayland-satellite
      xwayland
      xorg.libxcb
      xorg.xcbutilcursor
      xorg.xcbutil
      xorg.xcbutilwm
      xorg.xcbutilimage
      xorg.xcbutilkeysyms
      qt6.qtwayland
      libsForQt5.qtwayland
    ]
  );
}
