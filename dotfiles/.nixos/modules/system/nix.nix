{ inputs, ... }: {
    flake-file.inputs.nix-index-database = {
        url = "github:Mic92/nix-index-database";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    flake.modules.nixos.nix = {pkgs, ...}: {
        imports = [
            inputs.nix-index-database.nixosModules.nix-index
        ];

        nix = {
            gc = {
                automatic = true;
                dates = "daily";
                options = "--delete-older-than 7d";
            };

            settings = {
                experimental-features = ["nix-command" "flakes"];
                trusted-users = ["root"];
                auto-optimise-store = true;
                warn-dirty = false;
            };

            optimise = {
                automatic = true;
                dates = "daily";
            };
        };

        nixpkgs.config = {
            channel = "nixos-unstable";
            allowUnfree = true;
            allowDeprecatedx86_64Darwin = true;
        };

        system.autoUpgrade = {
            enable = true;
            dates = "weekly";
            allowReboot = false;
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
            nil
            nixd
            statix
            alejandra
            manix
            nix-inspect
        ];
    };
}
