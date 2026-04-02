{ inputs, pkgs, lib, config, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./device.nix

    ../../modules/system/bluetooth.nix
    ../../modules/system/core.nix
    ../../modules/system/boot.nix
    ../../modules/system/environment.nix
    ../../modules/system/locale.nix
    ../../modules/system/fonts.nix
    ../../modules/system/packages.nix
    ../../modules/system/programs.nix

    ../../modules/system/networking/networking.nix
    ../../modules/system/networking/wpa-enterprise-fix.nix

    ../../modules/desktop/cosmic.nix
    ../../modules/desktop/niri.nix
    ../../modules/desktop/nvidia.nix
    ../../modules/desktop/powersave.nix

    ../../modules/services/docker.nix

    ../../modules/users/egor.nix
  ];

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.11";
}