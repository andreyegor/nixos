{
  pkgs,
  pkgsUnstable,
  ...
}:
{
  home.packages = with pkgs; [
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
  ];

  home.sessionVariables = {
    WEBKIT_DISABLE_DMABUF_RENDERER = 1;
  };
}
