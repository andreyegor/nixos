{
  hardware.nvidia.prime.nvidiaBusId = "PCI:1:0:0";
  services.xserver.videoDrivers = [
    "nvidia"
  ];
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.powerManagement.enable = true;

  boot.extraModprobeConfig = ''
    options nvidia NVreg_EnableGpuFirmware=0
    options nvidia NVreg_PreserveVideoMemoryAllocations=1
    options nvidia NVreg_TemporaryFilePath=/var/tmp
  '';
  boot.kernelParams = [
    "nvidia-drm.modeset=1"
    "nvidia-drm.fbdev=1"
  ];
}
