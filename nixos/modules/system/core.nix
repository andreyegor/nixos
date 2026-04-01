{
  config,
  pkgs,
  ...
}:
{
  nix.settings.fallback = true;
  nixpkgs.config.allowUnfree = true;
}
