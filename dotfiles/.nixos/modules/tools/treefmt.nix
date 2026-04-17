{inputs, ...}: {
    imports = [
        inputs.treefmt-nix.flakeModule
    ];

    flake-file.inputs = {
        treefmt-nix.url = "github:numtide/treefmt-nix";
        treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";
    };

    perSystem = {
        treefmt.config = {
            projectRootFile = "flake.lock";

            programs = {
                alejandra.enable = true;
                deadnix.enable = true;
                statix.enable = true;
                biome = {
                    enable = true;
                    settings = {
                        formatter = {
                            indentStyle = "space";
                            indentWidth = 4;
                            lineWidth = 100;
                        };
                    };
                };
                keep-sorted.enable = true;
            };

            settings = {
                formatter = {
                    alejandra = {
                        options = ["--threads" "16"];
                        priority = 3;
                    };
                    deadnix.priority = 1;
                    statix.priority = 2;
                };
            };
        };
    };
}
