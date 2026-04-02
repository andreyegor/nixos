{
  config,
  pkgs,
  ...
}:

{
  services.desktopManager.cosmic.enable = true;
  environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
  hardware.system76.enableAll = true;
}
