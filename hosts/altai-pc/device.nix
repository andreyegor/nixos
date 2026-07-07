{ pkgs, ... }: {
  services.xserver.videoDrivers = [
    "nvidia"
  ];
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.powerManagement.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
