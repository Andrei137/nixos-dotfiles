{
    inputs = {
        nixpkgs = {
            url = "github:nixos/nixpkgs/nixos-unstable";
        };

        # https://nix-community.github.io/lanzaboote/introduction.html
        lanzaboote = {
            url = "github:nix-community/lanzaboote/v1.0.0";
            inputs.nixpkgs.follows = "nixpkgs";
        }; 

        flake-parts.url = "github:hercules-ci/flake-parts";
        import-tree.url = "github:vic/import-tree";
    };

    outputs = inputs: inputs.flake-parts.lib.mkFlake
        { inherit inputs; }
        (inputs.import-tree ./modules);
}
