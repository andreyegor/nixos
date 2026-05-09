{
  config,
  pkgs,
  pkgsUnstable,
  ...
}:
{
  programs = {
    git.enable = true;
    firefox.enable = true;
    vesktop.enable = true;
    onlyoffice.enable = true;
    zed-editor.enable = true;
    spotify-player.enable = true;
  };
}
