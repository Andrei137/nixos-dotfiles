{inputs, ...}: {
    flake-file.inputs.lanzaboote = {
        url = "github:nix-community/lanzaboote/v1.0.0";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    flake.modules.nixos.lanzaboote = {
        pkgs,
        lib,
        ...
    }: {
        imports = [
            inputs.lanzaboote.nixosModules.lanzaboote
        ];

        environment.systemPackages = with pkgs; [
            sbctl
        ];
        boot.loader.systemd-boot.enable = lib.mkForce false;
        boot.lanzaboote = {
            enable = true;
            autoGenerateKeys.enable = true;
            autoEnrollKeys = {
                enable = true;
                autoReboot = true;
            };
            pkiBundle = "/var/lib/sbctl";
        };
    };
}
