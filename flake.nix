{
  description = "Da kto takie ety vashy flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    catppuccin.url = "github:catppuccin/nix";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";
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
          #home-manager.nixosModules.home-manager
          ./configuration.nix

          # {
          #   # if you use home-manager
          #   home-manager.users.egor = {
          #     imports = [
          #       ./home-manager/home.nix
          #       catppuccin.homeManagerModules.catppuccin
          #     ];
          #   };
          # }
        ];
      };

      homeConfigurations.egor = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        modules = [
          ./home-manager/home.nix
          catppuccin.homeManagerModules.catppuccin
          # inputs.spicetify-nix.homeManagerModules.default
        ];

      };
    };

}
