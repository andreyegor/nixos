{
  config,
  pkgs,
  pkgsUnstable,
  ...
}:
{
  users.users.egor = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "storage"
      "docker"
      "kvm"
    ];
    shell = pkgs.fish;
  };
  programs.fish = {
      enable = true;
      interactiveShellInit = ''
        direnv hook fish | source
      '';
    };
}
