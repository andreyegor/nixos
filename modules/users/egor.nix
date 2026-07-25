{
  pkgs,
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
    initialPassword = "1";
  };
  programs.zsh.enable = true;
}
