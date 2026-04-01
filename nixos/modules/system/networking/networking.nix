{
  config,
  pkgs,
  ...
}:
{
  networking.networkmanager.enable = true;
  networking.firewall = {
    enable = true;
    checkReversePath = false; # This one for discord
    allowedUDPPorts = [
      # For online games
      27015
      27016
      27036
    ];
    allowedTCPPorts = [
      # For online games
      27015
      27036
    ];
    allowedUDPPortRanges = [
      # For online games
      {
        from = 27031;
        to = 27036;
      }
    ];
  };
}
