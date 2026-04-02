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
}
