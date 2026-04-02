{
  config,
  pkgs,
  ...
}:
{
  environment.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1; # For firefox
    WEBKIT_DISABLE_DMABUF_RENDERER = 1; # For hoppscotch
    QT_QPA_PLATFORM = "wayland;xcb";
    GTK_THEME = "Adwaita-dark";
  };
  environment.etc = {
    "xdg/gtk-2.0/gtkrc".text = "gtk-error-bell=0";
    "xdg/gtk-3.0/settings.ini".text = ''
      [Settings]
      gtk-error-bell=false
    '';
    "xdg/gtk-4.0/settings.ini".text = ''
      [Settings]
      gtk-error-bell=false
    '';
  };
}
