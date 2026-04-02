{
  config,
  pkgs,
  lib,
  ...
}:
{
  services.greetd.enable = true;

  # Configure greetd through the module's settings (not via environment.etc).
  services.greetd.settings = {
    default_session = {
      name = "lock-session";
      command = "noctalia-shell ipc call lockScreen lock";
    };

    autologin = {
      user = "egor";
      session = "lock-session";
    };
  };
}