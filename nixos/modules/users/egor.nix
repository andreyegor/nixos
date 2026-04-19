{
  config,
  pkgs,
  pkgsUnstable,
  ...
}:
{
  users.users.egor = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "docker"
    ];
    shell = pkgs.fish;
    packages = with pkgs; [
      sbt
      mill
      gradle
      javaPackages.compiler.temurin-bin.jdk-25
      scala
      scala-cli
      metals
      direnv

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
      quarto
      pandoc
      texlive.combined.scheme-full

      lowfi
      ncspot

      discord
      vesktop
      pkgsUnstable.spotify
      yandex-music
      telegram-desktop
      onlyoffice-desktopeditors

      zed-editor
      hoppscotch
      android-studio
      (pkgsUnstable.vscode.override {
        commandLineArgs = [
          "--enable-features=UseOzonePlatform"
          "--ozone-platform=wayland"
        ];
      })
    ];
  };
}
