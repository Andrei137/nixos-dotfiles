{
    description = "NixOS configuration";

    inputs = {
        nixpkgs = {
            url = "github:nixos/nixpkgs/nixos-unstable";
        };

        # https://nixos-and-flakes.thiscute.world/nixos-with-flakes/nixos-flake-and-module-system
        helix = {
            url = "github:helix-editor/helix/master";
        };

        # https://nix-community.github.io/home-manager/
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
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
                    ./configuration.nix
                    inputs.home-manager.nixosModules.home-manager
                    {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                    }

                    inputs.lanzaboote.nixosModules.lanzaboote
                    ({ pkgs, lib, ... }: {
                        environment.systemPackages = with pkgs; [
                            sbctl
                        ];
                        boot.loader.systemd-boot.enable = lib.mkForce false;
                        boot.lanzaboote = {
                          enable = true;
                          pkiBundle = "/var/lib/sbctl";
                        };
                    })
                ];
            };
        };
    };
}
