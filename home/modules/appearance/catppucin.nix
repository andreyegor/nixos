{
  config,
  pkgs,
  ...
}:
{
  catppuccin = {
    flavor = "mocha";
    accent = "lavender";
  };

  catppuccin.enable = true;
}
