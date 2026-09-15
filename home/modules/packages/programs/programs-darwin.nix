{ pkgs, lib, ... }:
{
  # programs.foo = lib.mkIf pkgs.stdenv.isDarwin {
  #   enable = true;
  # };
}
