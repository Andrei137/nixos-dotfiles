{ inputs, ...}: {
    flake-file.inputs = {
        lanzaboote.url = "github:nix-community/lanzaboote/v1.0.0";
        lanzaboote.inputs.nixpkgs.follows = "nixpkgs";
    };

    flake.modules.nixos.lanzaboote = {
        imports = [
            inputs.lanzaboote.nixosModules.lanzaboote
        ];
    };
}
