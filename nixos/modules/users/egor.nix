{
  config,
  pkgs,
  pkgsUnstable,
  meowdo,
  ...
}:
{
  users.users.egor = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "storage"
      "docker"
      "kvm"
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

      meowdo.packages.${pkgs.system}.default
      lowfi
      spotify-player

      vesktop
      prismlauncher
      pkgsUnstable.spotify
      yandex-music
      telegram-desktop
      onlyoffice-desktopeditors

      appflowy
      zed-editor
      hoppscotch
      android-tools
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
