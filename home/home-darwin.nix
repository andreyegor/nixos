{
  hostName,
  ...
}:
{
  imports = [
    ./modules/packages/default.nix
    ./hosts/${hostName}/default.nix
  ];

  home.username = "egor";
  home.homeDirectory = "/Users/egor";

  home.stateVersion = "26.05";
}
