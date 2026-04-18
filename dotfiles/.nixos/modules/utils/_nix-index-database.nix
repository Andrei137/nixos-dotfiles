_: {
    flake-file.inputs.nix-index-database = {
        url = "github:Mic92/nix-index-database";
        inputs.nixpkgs.follows = "nixpkgs";
    };
}
