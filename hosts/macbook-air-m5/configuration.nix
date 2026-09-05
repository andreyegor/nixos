{
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = "nix-command flakes";

  programs.zsh.enable = true;

  users.users.egor.home = "/Users/egor";

  system.primaryUser = "egor";

  system.stateVersion = 5;
}
