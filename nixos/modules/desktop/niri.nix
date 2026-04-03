{
  config,
  pkgs,
  lib,
  noctalia,
  ...
}:

{
  programs.niri.enable = true;
  programs.xwayland.enable = true;
  programs.dconf.enable = true;

  services.upower.enable = true;
  services.dbus.enable = true;
  services.xserver.enable = true;
  
  xdg.portal = {
    enable = true;
    config.common.default = [
      "gnome"
      "gtk"
    ];
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };

  security.rtkit.enable = true;

  environment.systemPackages = lib.mkAfter (
    with pkgs;
    [
      kitty
      noctalia.packages.${pkgs.system}.default
      swayidle

      brightnessctl
      playerctl
      pamixer

      gnome-themes-extra

      xwayland-satellite
    ]
  );
}
