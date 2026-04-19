{self, ...}: let
    host = builtins.baseNameOf ./.;
in {
    flake.nixosConfigurations = self.lib.mkNixos host;

    flake.modules.nixos.${host} = {
        imports = with self.modules.nixos; [
            base

            # gpu
            nvidia

            # boot
            systemd-boot
            lanzaboote

            # user
            andrei
        ];

        system.stateVersion = "25.11";
    };
}
