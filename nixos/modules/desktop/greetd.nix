{
  config,
  pkgs,
  lib,
  ...
}:
{
  services.greetd = {
    enable = true;
    settings = {
      initial_session = {
        command = "${pkgs.dbus}/bin/dbus-run-session ${pkgs.niri}/bin/niri";
        user = "egor";
      };
      default_session = {
        command = "${pkgs.greetd.gtkgreet}/bin/gtkgreet -c niri";
        user = "greeter";
      };
    };
  };
}