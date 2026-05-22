{ pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "python"
      "scala"
      "nix"
    ];
  };
}
