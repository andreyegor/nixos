{ pkgs, ... }:
{
  programs.zed-editor = {
    enable = false;
    extensions = [
      "python"
      "scala"
      "nix"
    ];
  };
}
