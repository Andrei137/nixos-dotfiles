{self, ...}: let
    host = builtins.baseNameOf ./.;
in {
    flake.nixosConfigurations = self.lib.mkNixos host;

    flake.modules.nixos.${host} = {
        imports = with self.modules.nixos; [
            base

            # boot
            systemd-boot

            # gpu
            nvidia

            # desktop
            plasma
            sddm

            # user
            andrei
        ];

        system.stateVersion = "25.11";
    };
}
