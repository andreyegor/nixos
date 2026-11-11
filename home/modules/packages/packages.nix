{
  pkgs,
  pkgsUnstable,
  hermes-agent,
  ...
}:
let
  # Flake builds stamp the placeholder "0.0.0", which fails plugins' requires_hermes
  # (and omh rejects "unknown"). Only the version label is pinned: the flake input
  # still tracks main, so bump this when a plugin needs a newer release.
  hermesFull = hermes-agent.packages.${pkgs.stdenv.hostPlatform.system}.default.override {
    version = "0.23.0";
  };
in
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
    
    hermesFull
    hermesFull.hermesDesktop
    codex
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
