{ config, pkgs, ... }: {
  programs = {
    git = {
      enable = true;
      settings.core.editor = "hx";
      extraConfig = {
        credential."https://github.com" = {
          helper = "!${pkgs.gh}/bin/gh auth git-credential";
        };
      };
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
