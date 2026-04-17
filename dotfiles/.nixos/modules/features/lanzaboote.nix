{ inputs, ... }: {
    flake.nixosModules.lanzaboote = { pkgs, lib, ... }: {
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

