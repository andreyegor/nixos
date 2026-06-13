{
  config,
  lib,
  pkgsUnstable,
  ...
}:

{
  hardware.graphics.enable = true;
  hardware.nvidia = {
    open = false;
    modesetting.enable = true;
    nvidiaSettings = true;
    package =
      (pkgsUnstable.linuxPackagesFor config.boot.kernelPackages.kernel).nvidiaPackages.new_feature;
  };
  nixpkgs.config.nvidia.acceptLicense = true;
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "cuda_cccl"
      "cuda_cudart"
      "cuda_nvcc"
      "libcublas"
      "nvidia-settings"
      "nvidia-x11"
    ];
}
