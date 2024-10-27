{
    description = "Main system configuration";

    inputs = {
        #nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.05";
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
        home-manager = {
            #url = "github:nix-community/home-manager?ref=release-24.05";
            url = "github:nix-community/home-manager?ref=master";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, home-manager, ... }:
        let
            system = "x86_64-linux";
        in {
            nixosConfigurations = {
                default = nixpkgs.lib.nixosSystem {
                    inherit system;
                    modules = [ 
                        ./hosts/default/configuration.nix
                        home-manager.nixosModules.home-manager
                    ];
                };
            };
        };
}
