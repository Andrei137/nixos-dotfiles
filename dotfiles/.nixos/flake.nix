# DO-NOT-EDIT. This file was auto-generated using github:vic/flake-file.
# Use `nix run .#write-flake` to regenerate it.
{
    outputs = inputs: inputs.flake-parts.lib.mkFlake {inherit inputs;} (inputs.import-tree ./modules);

    inputs = {
        flake-file.url = "github:vic/flake-file";
        flake-parts = {
            url = "github:hercules-ci/flake-parts";
            inputs.nixpkgs-lib.follows = "nixpkgs";
        };
        import-tree.url = "github:vic/import-tree";
        lanzaboote = {
            url = "github:nix-community/lanzaboote/v1.0.0";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nix-index-database = {
            url = "github:Mic92/nix-index-database";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.xz";
        treefmt-nix = {
            url = "github:numtide/treefmt-nix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";
    };
}
