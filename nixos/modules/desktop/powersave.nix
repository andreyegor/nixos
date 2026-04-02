{
  config,
  pkgs,
  ...
}:
{

  # Заменил на power-profiles
  # services.tlp = {
  #   enable = true;
  #   settings = {
  #     CPU_SCALING_GOVERNOR_ON_AC = "schedutil";
  #     CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
  #     CPU_BOOST_ON_BAT = "0";
  #     USB_AUTOSUSPEND = "1";
  #     RESTORE_DEVICE_STATE_ON_STARTUP = "0";
  #     SCHED_POWERSAVE_ON_BAT = "1";
  #   };
  # };

  services.power-profiles-daemon.enable = true;

  services.logind.settings.Login = {
    HandleLidSwitch = "suspend"; # "suspend-then-hibernate" поломан пока что
    HandleLidSwitchDocked = "suspend";
    HandleLidSwitchExternalPower = "suspend";
  };
  systemd.sleep.extraConfig = ''
    HibernateDelaySec=4h
    SuspendState=mem
  '';
}
