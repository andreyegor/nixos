{
  description = "Egor NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    meowdo.url = "github:Sycorlax/Meowdo";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      unstable,
      noctalia,
      meowdo,
      home-manager,
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
          inherit pkgsUnstable noctalia meowdo;
        };

        modules = [
          ./hosts/laptop-ga401qm

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.egor = import ./home/home.nix;
          }
        ];
      };
    };
}
