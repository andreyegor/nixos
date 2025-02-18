{ pkgs, ... }:
{
  home.pointerCursor = {
    gtk.enable = true;
    #hyprcursor.enable = true;
    x11.enable = true;
    size = 16;
    name = "Catppuccin-Frappe-Dark-Cursors";
    package = pkgs.catppuccin-cursors.frappeDark;
  };

  gtk = {
    enable = true;
    cursorTheme.size = 18;
    cursorTheme.name = "catppuccin-frappe-dark-cursors";
    cursorTheme.package = pkgs.catppuccin-cursors.frappeDark;

    theme = {
      name = "Adwaita-dark"; # catppuccin archived
      package = pkgs.gnome-themes-extra;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  nixpkgs.config.qt5 = {
    enable = true;
    platformTheme = "kvantum";
    style.name = "kvantum";
  };

  #programs.spicetify =
  #   let
  #     spicePkgs = spicetify-nix.legacyPackages.${pkgs.system};
  #   in
  #  {
  #    enable = true;
  #     theme = spicePkgs.themes.catppuccin;
  #  };
}
