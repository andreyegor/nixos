{
  pkgsUnstable,
  ...
}:
{
  programs = {
    steam = {
      enable = true;
      package = pkgsUnstable.steam;
      protontricks.enable = true;
      gamescopeSession.enable = true;
      extraCompatPackages = [ pkgsUnstable.proton-ge-bin ];
    };
    throne = {
      enable = true;
      tunMode.enable = true;
      package = pkgsUnstable.throne;
    };
  };
}
