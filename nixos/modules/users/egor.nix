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
      go
      postgresql
      direnv
      act
      pandoc
      texlive.combined.scheme-full
      lowfi
      hoppscotch
      android-studio
      vesktop
      spotify
      yandex-music
      telegram-desktop
      onlyoffice-desktopeditors
      (python3.withPackages (ps: with ps; [ pip ]))
      (pkgsUnstable.vscode.override {
        commandLineArgs = [
          "--enable-features=UseOzonePlatform"
          "--ozone-platform=wayland"
        ];
      })
    ];
  };
}