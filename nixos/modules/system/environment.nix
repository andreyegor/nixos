{
  config,
  pkgs,
  ...
}:
{
  environment.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1; # For firefox
    WEBKIT_DISABLE_DMABUF_RENDERER = 1; # For hoppscotch
  };
}
