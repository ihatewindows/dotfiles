{
  description = "Qazer's NixOS Configuration";

  inputs = {
    # Unstable Packages
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home-Manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Sops-Nix
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    # Spicetify-Nix
    spicetify-nix.url = "github:the-argus/spicetify-nix";
  };

  outputs = {
    nixpkgs,
    home-manager,
    sops-nix,
    ...
  } @ inputs: {
    # Hosts
    nixosConfigurations = {
      # Jade Configuration
      jade = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./nixos/configurations/jade
          ./nixos/configurations/shared
          sops-nix.nixosModules.sops
          {
            nix.registry.nixpkgs.flake = nixpkgs;
            nix.nixPath = ["nixpkgs=flake:nixpkgs"];
          }
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              users.alex = ./home/configurations/jade;
              extraSpecialArgs = {inherit inputs;};
              useGlobalPkgs = true;
              useUserPackages = true;
              sharedModules = [
                ./home/configurations/shared
                inputs.sops-nix.homeManagerModules.sops
                inputs.spicetify-nix.homeManagerModule
              ];
            };
          }
        ];
      };

      # Ruby Configuration
      ruby = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./nixos/configurations/ruby
          ./nixos/configurations/shared
          sops-nix.nixosModules.sops
          {
            nix.registry.nixpkgs.flake = nixpkgs;
            nix.nixPath = ["nixpkgs=flake:nixpkgs"];
          }
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              users.alex = ./home/configurations/ruby;
              extraSpecialArgs = {inherit inputs;};
              useGlobalPkgs = true;
              useUserPackages = true;
              sharedModules = [
                ./home/configurations/shared
                inputs.sops-nix.homeManagerModules.sops
                inputs.spicetify-nix.homeManagerModule
              ];
            };
          }
        ];
      };

      # Citrine Configuration - VM
      citrine = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./nixos/configurations/citrine
          ./nixos/configurations/shared
          {
            nix.registry.nixpkgs.flake = nixpkgs;
            nix.nixPath = ["nixpkgs=flake:nixpkgs"];
          }
        ];
      };
    };
  };
}
