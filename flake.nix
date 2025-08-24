{
  description = "Pierwszy flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
  };


  outputs = { self, nixpkgs, ... }@inputs:

    let
    system = "x86_64-linux";
    in {


  # nixos-btw - system hostname
    nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
      system = system;
      specialArgs = { inherit inputs; };
      modules = [ ./nixos/configuration.nix ];
      };
  };

}
