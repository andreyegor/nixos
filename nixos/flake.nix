{
  description = "Egor NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    niri.url = "github:sodiboo/niri-flake";
    niri.inputs.nixpkgs.follows = "nixpkgs";
    noctalia.url = "github:noctalia-dev/noctalia-shell";
    noctalia.inputs.nixpkgs.follows = "nixpkgs";
    catppuccin.url = "github:catppuccin/nix/v1.1.0";
    catppuccin.inputs.nixpkgs.follows = "nixpkgs";
    meowdo.url = "github:Sycorlax/Meowdo";
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
      meowdo,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      pkgsUnstable = import unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations."laptop-ga401qm" = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit
            pkgsUnstable
            niri
            noctalia
            meowdo
            ;
        };

        modules = [
          ./hosts/laptop-ga401qm

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.egor = import ./home/home.nix;

            home-manager.extraSpecialArgs = {
              hostName = "laptop-ga401qm";
              inherit pkgsUnstable;
            };

            home-manager.sharedModules = [
              niri.homeModules.niri
              noctalia.homeModules.default
              catppuccin.homeManagerModules.catppuccin 
            ];
          }
        ];
      };
    };
}
