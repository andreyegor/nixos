{
  pkgs,
  pkgsUnstable,
  ...
}:

{
  home.packages = with pkgs; [
    sbt
    mill
    gradle
    javaPackages.compiler.temurin-bin.jdk-25
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
    beam26Packages.elixir

    direnv
    act
    android-tools
    android-studio

    quarto
    pandoc
    texlive.combined.scheme-full

    (pkgsUnstable.vscode.override {
      commandLineArgs = [
        "--enable-features=UseOzonePlatform"
        "--ozone-platform=wayland"
      ];
    })

    hoppscotch

    lowfi
    pkgsUnstable.spotify
    yandex-music

    vesktop
    telegram-desktop

    prismlauncher
    onlyoffice-desktopeditors
    appflowy
  ];
}
