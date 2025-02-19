{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Network
  networking.hostName = "myLaptop";
  networking.networkmanager.enable = true;

  # Nekoray, sign box
  # Comment when proxy turned off
  # TODO proper way to do this
  # networking.proxy = {
  #   default = "http://127.0.0.1:2080";
  #   noProxy = "localhost,127.0.0.1,127.0.0.0/8,::1";
  # };

  time.timeZone = "Asia/Novosibirsk";

  # Some nix storage settings
  nix.optimise.automatic = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  #Power managment
  services.tlp = {
    enable = true;
    settings = {
      PLATFORM_PROFILE_ON_BAT = "powersave";
      PLATFORM_PROFILE_ON_AC = "balance_power"; # "perfomance"
    };
  };
  services.logind = {
    lidSwitch = "suspend-then-hibernate";
    powerKey = "hibernate";
    # powerKeyLongPress = "poweroff";
  };

  # ONLY FOR ASUS && DUALGPU LAPTOP
  services.supergfxd.enable = true;
  systemd.services.supergfxd.path = [ pkgs.pciutils ];
  services.asusd = {
    enable = true;
    enableUserService = true;
  };

  #Hyprland and visual environment at all
  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "Hyprland";
      user = "egor";
    };
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Nvidia drivers
  hardware.graphics.enable = true;
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true; # for rtx 20 and newer
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Enable flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Enable sound.
  hardware.pulseaudio.enable = true;
  services.pipewire.enable = false;

  #Enable bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.egor = {
    isNormalUser = true;
    description = "It's me!";

    home = "/home/egor";
    extraGroups = [
      "wheel"
      "networkmanager"
    ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [

    ];
  };

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    wget
    home-manager
    nixfmt-rfc-style
  ];

  fonts.packages = with pkgs; [
    nerdfonts
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?
}
