{
    self,
    inputs,
    ...
}: let
    feature = self.lib.fileName __curPos.file;
in {
    flake-file.inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";
        nix-gc-env.url = "github:Julow/nix-gc-env";
        nix-index-database = {
            url = "github:Mic92/nix-index-database";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    flake.modules.nixos.${feature} = {
        pkgs,
        config,
        ...
    }: {
        imports = [
            inputs.nix-index-database.nixosModules.nix-index
            inputs.nix-gc-env.nixosModules.default
        ];

        nix = {
            gc = {
                automatic = true;
                dates = "daily";
                delete_generations = "+5";
            };

            settings = {
                substituters = [
                    "https://cache.nixos.org?priority=10"
                    "https://install.determinate.systems"
                    "https://nix-community.cachix.org"
                ];
                trusted-public-keys = [
                    "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
                    "cache.flakehub.com-3:hJuILl5sVK4iKm86JzgdXW12Y2Hwd5G07qKtHTOcDCM"
                    "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
                ];
                experimental-features = [
                    "nix-command"
                    "flakes"
                    "pipe-operators"
                ];
                trusted-users = [
                    "root"
                    "@wheel"
                ];
                download-buffer-size = 1024 * 1024 * 1024;
                auto-optimise-store = true;
                warn-dirty = false;
            };

            optimise = {
                automatic = true;
                dates = "daily";
            };
        };

        nixpkgs = {
            overlays = [
                (final: _prev: {
                    stable = import inputs.nixpkgs-stable {
                        inherit (final) config;
                        inherit (pkgs.stdenv.hostPlatform) system;
                    };
                })
            ];
            config = {
                allowUnfree = true;
                allowDeprecatedx86_64Darwin = true;
            };
        };

        system = {
            stateVersion = "25.11";
            autoUpgrade = {
                enable = true;
                dates = "weekly";
                allowReboot = false;
            };
        };

        programs = {
            nix-index-database.comma.enable = true;
            nix-ld.enable = true;
            direnv = {
                enable = true;
                silent = false;
                loadInNixShell = true;
                direnvrcExtra = "";
                nix-direnv = {
                    enable = true;
                };
            };
        };

        documentation.nixos.enable = true;

        environment.systemPackages = with pkgs; [
            nh
            nil
            nixd
            statix
            alejandra
            manix
            nix-inspect
        ];
    };
}
