{
  imports = [
    ./hardware-configuration.nix
    ./device.nix
    ./programs.nix

    ../../modules/system/bluetooth.nix
    ../../modules/system/core.nix
    ../../modules/system/boot-legacy.nix
    ../../modules/system/locale.nix
    ../../modules/system/networking.nix
    ../../modules/system/packages.nix
    ../../modules/system/programs.nix

    ../../modules/desktop/greetd.nix
    ../../modules/desktop/niri.nix
    ../../modules/desktop/nvidia.nix

    ../../modules/services/docker.nix

    ../../modules/users/egor.nix
  ];

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "26.05";
}
