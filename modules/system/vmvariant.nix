{
  virtualisation.vmVariant = {
    virtualisation.qemu.options = [
      "-vga"
      "none"
      "-device"
      "virtio-gpu-gl-pci"
      "-display"
      "gtk,gl=on"
    ];
    virtualisation.cores = 4;
    virtualisation.memorySize = 4096;
  };
  hardware.graphics.enable = true;
}
