{
  pkgs,
  pkgsUnstable,
  ...
}:
{
  home.packages = with pkgs; [
    gh
    xxh

    sbt
    mill
    gradle
    javaPackages.compiler.temurin-bin.jdk-21
    scala
    scala-cli
    metals

    go
    (python3.withPackages (
      ps: with ps; [
        pip
        numpy
        matplotlib
        jupyter
        ipykernel
        pyzmq
        pyyaml
      ]
    ))
    postgresql
    rustc
    cargo
    beam27Packages.elixir
    
    caligula
    cifs-utils

    act
    android-tools
    android-studio

    quarto
    pandoc
    texlive.combined.scheme-full
    libreoffice

    (pkgsUnstable.vscode.override {
      commandLineArgs = [
        "--enable-features=UseOzonePlatform"
        "--ozone-platform=wayland"
      ];
    })
    claude-code

    appimage-run

    hoppscotch
    insomnia

    figma-linux

    lowfi
    pkgsUnstable.spotify
    yandex-music

    signal-desktop
    telegram-desktop

    protonplus
    prismlauncher
    
    appflowy
  ];

  home.sessionVariables = {
    WEBKIT_DISABLE_DMABUF_RENDERER = 1;
  };
}
