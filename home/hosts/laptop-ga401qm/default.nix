{
  imports = [
    ./appimage-local.nix
    ./programs.nix
  ];
  programs.niri.settings.outputs = import ./niri-outputs.nix;
}
