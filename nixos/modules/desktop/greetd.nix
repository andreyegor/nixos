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
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --autologin --cmd '${pkgs.dbus}/bin/dbus-run-session ${pkgs.niri}/bin/niri'";
        user = "greeter";
      };
      initial_session = {
        command = "${pkgs.dbus}/bin/dbus-run-session ${pkgs.niri}/bin/niri";
        user = "egor";
      };
    };
  };
  security.pam.services.greetd.enableGnomeKeyring = true;
}
