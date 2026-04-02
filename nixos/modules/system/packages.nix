{
  config,
  pkgs,
  lib,
  ...
}:
{
  environment.systemPackages = with pkgs;
    [
      gh
      gcc
      tree
      micro
      wget
      usbutils
      pciutils
      powertop
      fastfetch
      bluetuith
      nixfmt-rfc-style    

      gimp
      qimgv
      obs-studio
      resources
    ];
}
