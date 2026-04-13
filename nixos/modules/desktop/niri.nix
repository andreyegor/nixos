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

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
    ];
    config = {
      common.default = [ "gnome" ];
    };
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };

  security.rtkit.enable = true;

  environment.sessionVariables = {
    XCURSOR_THEME = "catppuccin-mocha-dark-cursors";
    XCURSOR_SIZE = "24";
    GTK_THEME = "Adwaita:dark";
    QT_STYLE_OVERRIDE = "adwaita-dark";
  };

  environment.systemPackages = lib.mkAfter (
    with pkgs;
    [
      kitty
      noctalia.packages.${pkgs.system}.default
      swayidle

      xwayland-satellite

      brightnessctl
      playerctl
      pamixer

      gnome-themes-extra
      catppuccin-cursors.mochaDark

      nautilus
      mpv
      gimp
      qimgv
      obs-studio
      resources
    ]
  );
}
