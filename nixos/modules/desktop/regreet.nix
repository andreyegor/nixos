{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.regreet.enable = true;
  programs.regreet.settings = {
    background = {
      path = "/home/egor/Pictures/Wallpapers/lonely-fish.png";
      fit = "Cover";
    };
    GTK = {
      cursor_theme_name = "Adwaita";
      font_name = "Cantarell 12";
    };
  };

  services.greetd.settings.default_session.command =
    "${pkgs.dbus}/bin/dbus-run-session ${pkgs.niri}/bin/niri -c /etc/greetd/niri-config.kdl";
}