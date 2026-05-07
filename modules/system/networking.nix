{
  config,
  pkgs,
  ...
}:
{
  networking.networkmanager = {
    enable = true;
    dns = "default";
  };

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

  systemd.services.wpa_supplicant.environment.OPENSSL_CONF = pkgs.writeText "openssl.cnf" ''
    openssl_conf = openssl_init
    [openssl_init]
    ssl_conf = ssl_sect
    [ssl_sect]
    system_default = system_default_sect
    [system_default_sect]
    Options = UnsafeLegacyRenegotiation
    [system_default_sect]
    CipherString = Default:@SECLEVEL=0
  '';
}
