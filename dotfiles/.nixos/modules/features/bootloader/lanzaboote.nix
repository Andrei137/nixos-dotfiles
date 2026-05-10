{
    self,
    inputs,
    ...
}: let
    module = builtins.baseNameOf ./.;
    feature = self.lib.fileName __curPos.file;
in {
    flake-file.inputs.lanzaboote = {
        url = "github:nix-community/lanzaboote/v1.0.0";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    flake.modules.nixos.${feature} = {
        config,
        pkgs,
        lib,
        ...
    }: {
        imports = [
            inputs.lanzaboote.nixosModules.lanzaboote
        ];

        config = lib.mkIf config.${module}.secureBoot {
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
    };
}
