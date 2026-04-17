{ self, ... }: let
    host = builtins.baseNameOf ./.;
in {
    flake.nixosConfigurations = self.lib.mkNixos host;

    flake.modules.nixos.${host} = {
        imports = with self.modules.nixos; [
            bluetooth
            boot
            lanzaboote
            nvidia
            plasma
            sound

            settings

            apps
            andrei
        ];
    };
}
