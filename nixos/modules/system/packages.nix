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
      nixfmt-rfc-style
      nmtui
      bluetuith      

      gimp
      qimgv
      obs-studio
      resources
    ];
}
