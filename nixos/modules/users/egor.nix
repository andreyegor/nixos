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
      pandoc
      texlive.combined.scheme-full

      lowfi

      hoppscotch
      discord
      pkgsUnstable.spotify
      yandex-music
      telegram-desktop
      onlyoffice-desktopeditors
      simulide
      
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
