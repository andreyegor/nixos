{
  description = "Egor NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
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
      darwin,
      niri,
      noctalia,
      catppuccin,
      nixvim,
      ...
    }:
    let
      linuxSystem = "x86_64-linux";
      darwinSystem = "aarch64-darwin";

      pkgsUnstable = import unstable {
        system = linuxSystem;
        config.allowUnfree = true;
      };

      pkgsDarwinUnstable = import unstable {
        system = darwinSystem;
        config.allowUnfree = true;
      };

      mkHost = hostName:
        nixpkgs.lib.nixosSystem {
          system = linuxSystem;

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

      darwinConfigurations."macbook-air-m5" = darwin.lib.darwinSystem {
        system = darwinSystem;

        specialArgs = {
          pkgsUnstable = pkgsDarwinUnstable;
        };

        modules = [
          ./hosts/macbook-air-m5

          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.egor = import ./home/home-darwin.nix;

            home-manager.extraSpecialArgs = {
              hostName = "macbook-air-m5";
              pkgsUnstable = pkgsDarwinUnstable;
            };

            home-manager.sharedModules = [
              nixvim.homeModules.nixvim
              catppuccin.homeModules.catppuccin
            ];
          }
        ];
      };
    };
}
