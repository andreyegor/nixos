{
  description = "Da kto takie ety vashy flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    catppuccin.url = "github:catppuccin/nix";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      catppuccin,
      home-manager,
      ...
    }:
    {
      nixosConfigurations.myLaptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          catppuccin.nixosModules.catppuccin
          ./configuration.nix
        ];
      };

      homeConfigurations.egor = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        modules = [
          ./home-manager/home.nix
          catppuccin.homeModules.catppuccin
        ];
      };
      # for standalone home-manager installations
      homeConfigurations.pepperjack = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [
          ./home-manager/home.nix
          catppuccin.homeModules.catppuccin
        ];
      };
    };

}
