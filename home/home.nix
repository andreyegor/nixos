{
  pkgs,
  hostName,
  ...
}:

{
  imports = [
    ./modules/packages/default.nix
    ./modules/appearance/default.nix
    ./hosts/${hostName}/default.nix
  ];
  home.username = "egor";
  home.homeDirectory = "/home/egor";

  home.pointerCursor = {
    name = "catppuccin-mocha-dark-cursors";
    package = pkgs.catppuccin-cursors.mochaDark;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  home.sessionVariables = {
    XCURSOR_THEME = "catppuccin-mocha-dark-cursors";
    XCURSOR_SIZE = "24";
    QT_QPA_PLATFORMTHEME = "gtk3";
  };

  home.stateVersion = "25.11";
}
