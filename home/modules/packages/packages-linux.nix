{
  pkgs,
  pkgsUnstable,
  lib,
  ...
}:
{
  home.packages = lib.optionals pkgs.stdenv.isLinux (with pkgs; [
    caligula
    cifs-utils
    appimage-run

    figma-linux
    yandex-music
    protonplus

    libreoffice

    (pkgsUnstable.vscode.override {
      commandLineArgs = [
        "--enable-features=UseOzonePlatform"
        "--ozone-platform=wayland"
      ];
    })
  ]);

  home.sessionVariables = lib.mkIf pkgs.stdenv.isLinux {
    WEBKIT_DISABLE_DMABUF_RENDERER = 1;
  };
}
