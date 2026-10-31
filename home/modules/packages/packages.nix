{
  pkgs,
  pkgsUnstable,
  hermes-agent,
  ...
}:
{
  home.sessionVariables.JAVA_HOME = pkgs.javaPackages.compiler.temurin-bin.jdk-21.home;

  home.packages = with pkgs; [
    gh
    xxh
    nixfmt

    gnumake
    pnpm

    sbt
    mill
    gradle
    javaPackages.compiler.temurin-bin.jdk-21
    scala
    scala-cli
    metals

    nodejs_24

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
    
    hermes-agent.packages.${pkgs.stdenv.hostPlatform.system}.default
    hermes-agent.packages.${pkgs.stdenv.hostPlatform.system}.desktop
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
