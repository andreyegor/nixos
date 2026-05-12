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
    shell = pkgs.zsh;
  };
  programs.zsh.enable = true;
}
