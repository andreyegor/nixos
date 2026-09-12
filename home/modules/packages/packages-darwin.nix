{
  pkgs,
  pkgsUnstable,
  lib,
  ...
}:
{
  home.packages = lib.optionals pkgs.stdenv.isDarwin (with pkgs; [
    pkgsUnstable.vscode
    
    docker
    docker-compose
    colima
  ]);
}
