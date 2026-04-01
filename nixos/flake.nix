{
  description = "Egor NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    {
      self,
      nixpkgs,
      unstable,
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
          inherit pkgsUnstable;
        };

        modules = [
          ./hosts/laptop-ga401qm
        ];
      };
    };
}
