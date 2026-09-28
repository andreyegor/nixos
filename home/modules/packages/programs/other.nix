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
      package = pkgs.firefox-bin;
      configPath = "${config.xdg.configHome}/mozilla/firefox";
    };
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
