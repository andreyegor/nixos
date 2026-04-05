{
  config,
  pkgs,
  ...
}:
{
  nix.settings.fallback = true;
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  hardware.opengl.enable = true;
}
