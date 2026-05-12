{
  pkgs,
  pkgsUnstable,
  ...
}:
let
  scalarAppImage = pkgs.fetchurl {
    url = "https://github.com/scalar/scalar/releases/download/v1.0.5/scalar-app-1.0.5x86_64.AppImage";
    sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

  scalar = pkgs.appimageTools.wrapType2 {
    name = "scalar";
    src = scalarAppImage;
  };
in
{
  home.packages = with pkgs; [
    gh

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

    appimage-run

    hoppscotch

    lowfi
    pkgsUnstable.spotify
    yandex-music

    telegram-desktop

    prismlauncher
    appflowy
  ];
}
