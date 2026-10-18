{
  pkgs,
  pkgsUnstable,
  ...
}:
{
  home.packages = with pkgs; [
    gh
    xxh
    nixfmt

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

    micro

    teleport
    kubectl
    
    pkgsUnstable.codex
    opencode
    claude-code
    pi-coding-agent # Не забыть поставить pi-ollama

    lens
    pkgsUnstable.jetbrains.idea

    lowfi
    spotify

    signal-desktop
    telegram-desktop

    discord
    prismlauncher
  ];
}
