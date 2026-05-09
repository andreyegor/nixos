{
  imports = [
    ./appimage-local.nix
  ];
  programs.niri.settings.outputs = import ./niri-outputs.nix;
}