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
      (python3.withPackages (ps: with ps; [ pip ]))
      postgresql

      act
      quarto
      pandoc
      corefonts
      texlive.combined.scheme-full

      lowfi
      ncspot

      vesktop
      pkgsUnstable.spotify
      yandex-music
      telegram-desktop
      onlyoffice-desktopeditors

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
