{
  programs = {
    git.enable = true;
    firefox.enable = true;
    vesktop.enable = true;
    onlyoffice.enable = true;
    spotify-player.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
  };
}
