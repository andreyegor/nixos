{
  imports = [
    ./programs.nix
  ];
  programs.niri.settings.outputs = import ./niri-outputs.nix;
}
