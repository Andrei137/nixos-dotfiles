{
    description = "NixOS configuration";

    inputs = {
        nixpkgs = {
            url = "github:nixos/nixpkgs/nixos-unstable";
        };

        # https://nix-community.github.io/lanzaboote/introduction.html
        lanzaboote = {
            url = "github:nix-community/lanzaboote/v1.0.0";
            inputs.nixpkgs.follows = "nixpkgs";
        }; 
    };

    outputs = inputs: {
        nixosConfigurations = {
            legion = inputs.nixpkgs.lib.nixosSystem {
                specialArgs = { inherit inputs; };
                modules = [
                    ./modules/hosts/legion/configuration.nix
                    ./modules/lanzaboote/lanzaboote.nix
                ];
            };
        };
    };
}
