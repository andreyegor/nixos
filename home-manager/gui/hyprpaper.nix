{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = true;
      preload = [ "~/.config/nixos/resources/wallpapers/lonely-fish.png" ];
      wallpaper = [ ",~/.config/nixos/resources/wallpapers/lonely-fish.png" ];
    };
  };
}
