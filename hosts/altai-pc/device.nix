{
  # hardware.nvidia.prime.amdgpuBusId = "PCI:4:0:0";
  # hardware.nvidia.prime.nvidiaBusId = "PCI:1:0:0";
  # hardware.nvidia.prime.offload.enable = true;
  # hardware.nvidia.prime.offload.enableOffloadCmd = true;
  # hardware.nvidia.powerManagement = {
  #   enable = true;
  #   finegrained = true;
  # };
  # boot.resumeDevice = "/dev/disk/by-uuid/3bfab1fa-3595-4192-843c-f0b28c0311b0";
  # services.xserver.videoDrivers = [
  #   "amdgpu"
  #   "nvidia"
  # ];
}
