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
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    zed-editor.enable = true;
    spotify-player.enable = true;
  };
}
