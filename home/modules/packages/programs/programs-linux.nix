{ pkgs, lib, ... }:
{
  # programs.bar = lib.mkIf pkgs.stdenv.isLinux {
  #   enable = true;
  # };
}
