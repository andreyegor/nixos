{
  pkgs,
  pkgsUnstable,
  ...
}:
{
  home.packages = with pkgs; [
    gh
    xxh

    gnumake

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

    act

    quarto
    pandoc
    texlive.combined.scheme-full

    claude-code

    hoppscotch
    insomnia

    lowfi
    pkgsUnstable.spotify

    signal-desktop
    telegram-desktop

    prismlauncher

    appflowy
  ];
}
