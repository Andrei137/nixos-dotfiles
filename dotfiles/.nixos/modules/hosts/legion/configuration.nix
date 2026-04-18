{self, ...}: let
    host = builtins.baseNameOf ./.;
in {
    flake.nixosConfigurations = self.lib.mkNixos host;

    flake.modules.nixos.${host} = {
        imports = with self.modules.nixos; [
            general

            plasma
            nvidia
            andrei
        ];

        system.stateVersion = "25.11";
    };
}
