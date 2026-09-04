{ pkgs, lib, ... }:
{
  imports = [
    ./programs/default.nix
    ./packages.nix
    ./fonts.nix
  ] ++ lib.optionals pkgs.stdenv.isLinux [ ./packages-linux.nix ]
    ++ lib.optionals pkgs.stdenv.isDarwin [ ./packages-darwin.nix ];
}
