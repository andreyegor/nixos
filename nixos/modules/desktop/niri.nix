{
  config,
  pkgs,
  lib,
  noctalia,
  ...
}:

{
  programs.niri.enable = true;
  services.upower.enable = true;
  programs.xwayland.enable = true;
  programs.dconf.enable = true;
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
      kitty
      quickshell
      noctalia.packages.${pkgs.system}.default
      swayidle

      brightnessctl
      pamixer

      dconf
      glib
      gsettings-desktop-schemas

      gnome-themes-extra

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
