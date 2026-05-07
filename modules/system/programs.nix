{
  config,
  pkgs,
  pkgsUnstable,
  ...
}:
{
  programs = {
    niri = {
      enable = true;
    };
    git.enable = true;
    firefox.enable = true;
    fish = {
      enable = true;
      interactiveShellInit = ''
        direnv hook fish | source
      '';
    };
    throne = {
      enable = true;
      tunMode.enable = true;
      package = pkgsUnstable.throne;
    };
    steam = {
      enable = true;
      package = pkgsUnstable.steam;
      protontricks.enable = true;
      gamescopeSession.enable = true;
      extraCompatPackages = [ pkgsUnstable.proton-ge-bin ];
    };
  };
}
