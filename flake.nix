{
  description = "Egor NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    niri.url = "github:sodiboo/niri-flake";
    niri.inputs.nixpkgs.follows = "nixpkgs";
    noctalia.url = "github:noctalia-dev/noctalia/legacy-v4";
    noctalia.inputs.nixpkgs.follows = "nixpkgs";
    catppuccin.url = "github:catppuccin/nix/release-26.05";
    catppuccin.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.url = "github:nix-community/nixvim/nixos-26.05";
  };

  outputs =
    {
      self,
      nixpkgs,
      unstable,
      home-manager,
      niri,
      noctalia,
      catppuccin,
      nixvim,
      ...
    }:
    let
      system = "x86_64-linux";

      pkgsUnstable = import unstable {
        inherit system;
        config.allowUnfree = true;
      };

      mkHost = hostName:
        nixpkgs.lib.nixosSystem {
          inherit system;

          specialArgs = {
            inherit pkgsUnstable niri noctalia;
          };

          modules = [
            (./hosts + "/${hostName}")

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.egor = import ./home/home.nix;

              home-manager.extraSpecialArgs = {
                inherit hostName pkgsUnstable;
              };

              home-manager.sharedModules = [
                niri.homeModules.niri
                noctalia.homeModules.default
                nixvim.homeModules.nixvim
                catppuccin.homeModules.catppuccin
              ];
            }
          ];
        };
    in
    {
      nixosConfigurations = nixpkgs.lib.genAttrs
        [ "laptop-ga401qm" "altai-pc" ]
        mkHost;
    };
}