{config, ...}: {
  programs = {
    git = {
      enable = true;
      settings.core.editor = "hx";
    };
    firefox = {
      enable = true;
      configPath = "${config.xdg.configHome}/mozilla/firefox";
    };
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
